#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/Image.h>
#include <std_msgs/Header.h>
#include <sensor_msgs/image_encodings.h>
#include <filesystem>
#include "edge_detection/EdgeDetector.hpp"
#include "edge_detection/service.h"

namespace fs = std::filesystem;

class EdgeDetectorServer
{
    private:

    public:
    ros::ServiceServer service_;

    // Constructor
    EdgeDetectorServer(ros::NodeHandle &nh)
    {
        service_ = nh.advertiseService("edge_detection_service", &EdgeDetectorServer::detect, this);
    }

    // Callback function
    bool detect(edge_detection::service::Request &req, edge_detection::service::Response &res)
    {
        // Create a EdgeDetector class instance
        edge_detection::EdgeDetector detector;

        // ROS to OpenCV Image (Input)
        cv::Mat input_image = cv_bridge::toCvCopy(req.input_image, sensor_msgs::image_encodings::BGR8)->image;

        // Detect Edges
        cv::Mat edges_image = detector.detectEdges(input_image);

        // Superimpose
        cv::Mat output_image = detector.ColorEdges(input_image, edges_image);

        // OpenCV to ROS Image (Output)
        cv_bridge::CvImage img_bridge;
        std_msgs::Header header;
        header.stamp = ros::Time::now();
        img_bridge = cv_bridge::CvImage(header, sensor_msgs::image_encodings::BGR8, output_image);
        img_bridge.toImageMsg(res.edges_image);
        
        return true;
    }
};

int main(int argc, char **argv) 
{
    // Initialize ROS node
    ros::init(argc, argv, "edge_detection_server");

    // Create ROS Node
    ros::NodeHandle nh;

    // Create Edge Detection Server object
    EdgeDetectorServer server(nh);

    // Sprin the node
    ros::spin();
}