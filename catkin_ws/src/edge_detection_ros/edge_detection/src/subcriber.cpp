#include <ros/ros.h>
#include <iostream>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/PointCloud.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/highgui.hpp>
#include <edge_detection/EdgeDetector.hpp>

class ImageSubscriber
{
    private:
        cv::Mat edges;

        ros::NodeHandle &nh_;
        ros::Subscriber image_sub_;
        ros::Publisher image_pub_;

        ros::Publisher image_pub_edges_;

    public:

        // Constructor
        ImageSubscriber(ros::NodeHandle &nh) : nh_(nh)
        {
            // Publish the edges with the original image on topic "superimposed_edges" 
            image_pub_ = nh_.advertise<sensor_msgs::Image>("superimposed_edges", 1);

            // Publish the edges on topic "edges"
            image_pub_edges_ = nh_.advertise<sensor_msgs::Image>("edges", 1);

            // Subscribe to the input video feed
            image_sub_ = nh_.subscribe("/camera/color/image_raw", 1, &ImageSubscriber::imageCallback, this);
        }

        void imageCallback(const sensor_msgs::ImageConstPtr& msg)
        {
            try
            {
                // Input: ROS Image to OpenCV Image
                cv::Mat image = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8)->image;

                // Create a EdgeDetector class instance
                edge_detection::EdgeDetector detector;

                // Perform edge detection on the input image
                edges = detector.detectEdges(image);

                // Output: OpenCV Image to ROS Image
                sensor_msgs::Image ros_edges_image;

                cv_bridge::CvImage img_bridge_edges;
                std_msgs::Header header_edges;
                header_edges.stamp = ros::Time::now();
                img_bridge_edges = cv_bridge::CvImage(header_edges, "mono8", edges);
                img_bridge_edges.toImageMsg(ros_edges_image);

                // Publish edge image
                image_pub_edges_.publish(ros_edges_image);

                // Superimpose
                cv::Mat output_image = detector.ColorEdges(image, edges);

                // Output: OpenCV Image to ROS Image
                sensor_msgs::Image ros_output_image;

                cv_bridge::CvImage img_bridge;
                std_msgs::Header header;
                header.stamp = ros::Time::now();
                img_bridge = cv_bridge::CvImage(header, sensor_msgs::image_encodings::BGR8, output_image);
                img_bridge.toImageMsg(ros_output_image);

                // Publish the superimposed image
                image_pub_.publish(ros_output_image);
            }
            catch (cv_bridge::Exception& e)
            {
                ROS_ERROR("cv_bridge exception: %s", e.what());
            }
        }
};

int main(int argc, char** argv)
{
    // Initialize ROS
    ros::init(argc, argv, "image_subscriber");

    // Create ROS Node
    ros::NodeHandle nh;

    // Create a subscriber object
    ImageSubscriber image_subscriber(nh);

    // Spin the node
    ros::spin();

    return 0;
}
