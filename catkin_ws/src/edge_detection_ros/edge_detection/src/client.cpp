#include <ros/ros.h>
#include <ros/package.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/Image.h>
#include <std_msgs/Header.h>
#include <sensor_msgs/image_encodings.h>
#include <filesystem>
#include "edge_detection/EdgeDetector.hpp"
#include "edge_detection/service.h"

namespace fs = std::filesystem;

class EdgeDetectionClient
{
    private:
        ros::ServiceClient client_;
        std::string input_folder_;
        std::string output_folder_;

    public:

        // Constructor
        EdgeDetectionClient(ros::NodeHandle &nh, std::string input_folder, std::string output_folder)
        : input_folder_(input_folder), output_folder_(output_folder)
        {
            client_ = nh.serviceClient<edge_detection::service>("edge_detection_service");
        }

        // Run the client
        void run()
        {
            for (auto input_file : fs::directory_iterator(input_folder_)) {

                cv::Mat in_image = cv::imread(input_file.path());

                edge_detection::service srv;

                cv_bridge::CvImage img_bridge;
                std_msgs::Header header;
                header.stamp = ros::Time::now();
                img_bridge = cv_bridge::CvImage(header, sensor_msgs::image_encodings::BGR8, in_image);
                img_bridge.toImageMsg(srv.request.input_image);
            
                if (client_.call(srv)) {
                    ROS_INFO("Edge detection service succeeded");

                    cv::Mat out_image = cv_bridge::toCvCopy(srv.response.edges_image, sensor_msgs::image_encodings::BGR8)->image;
                    cv::imwrite(output_folder_ + input_file.path().filename().string(), out_image);
                } else {
                    ROS_ERROR("Edge detection service failed");
                    return;
                }
            }
        }
};

int main(int argc, char **argv)
{
    // Initialize ROS
    ros::init(argc, argv, "edge_detection_client");

    // Create ROS Node
    ros::NodeHandle nh;

    // Input and Output path
    std::string path = ros::package::getPath("edge_detection");
    std::string input_image_folder = path + "/data";
    std::string output_image_folder = path + "/output_image/";

    // Initialize client
    EdgeDetectionClient client(nh, input_image_folder, output_image_folder);

    // Run client
    client.run();

    return 0;
}