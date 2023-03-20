#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/PointCloud.h>
#include <sensor_msgs/PointCloud2.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/highgui.hpp>
#include <edge_detection/EdgeDetector.hpp>

class PointCloud
{
    private:

        ros::NodeHandle &nh_;
        
        cv::Mat edge_image;

        ros::Subscriber edges;
        ros::Subscriber cam_parameters;
        ros::Subscriber point_cloud_sub;
        ros::Publisher point_cloud_pub;

        cv::Mat K; // camera intrinsics matrix
        cv::Mat D; // distortion coefficients
        cv::Mat R; // rotation matrix
        cv::Mat P; // projection matrix

    public:

        PointCloud(ros::NodeHandle &nh) : nh_(nh)
        {
            // Subscribe to the edges topic
            edges = nh_.subscribe("/edges", 1, &PointCloud::DetectedEdges, this);

            // Get camera info
            cam_parameters = nh_.subscribe("/camera/depth/camera_info", 1, &PointCloud::CamInfo, this);

            // Publish the 3D data to ROS Topic: edge_points
            point_cloud_pub = nh_.advertise<sensor_msgs::PointCloud>("edge_points", 1);

            // Convert pixel coordinates (u, v) to 3D data (x, y, z)
            point_cloud_sub = nh_.subscribe("/camera/depth/image_rect_raw", 1, &PointCloud::to3D, this);
        }

        // Save the images from the "edges topic"
        void DetectedEdges(const sensor_msgs::ImageConstPtr &msg)
        {
            try
            {
                // Grey Image
                edge_image = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::MONO8)->image;
            }
            catch (cv_bridge::Exception& e)
            {
                ROS_ERROR("cv_bridge exception: %s", e.what());
            }
        }

        // Store the camera info
        void CamInfo(const sensor_msgs::CameraInfoConstPtr &camera_info)
        {
            K = cv::Mat(3, 3, CV_64F, (void*) camera_info->K.data());
            D = cv::Mat(1, 5, CV_64F, (void*) camera_info->D.data());
            R = cv::Mat(3, 3, CV_64F, (void*) camera_info->R.data());
            P = cv::Mat(3, 4, CV_64F, (void*) camera_info->P.data());
        }

        // Convert the pixel points to point cloud
        void to3D(const sensor_msgs::ImageConstPtr &msg)
        {
            if(edge_image.channels() == 1 && edge_image.dims == 2)
            {
                cv::Mat depth_image = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_16UC1)->image;

                float fx = K.at<double>(0, 0);
                float fy = K.at<double>(1, 1);
                float cx = K.at<double>(0, 2);
                float cy = K.at<double>(1, 2);

                //
                std::vector<cv::Point> edge_points;
                cv::findNonZero(edge_image, edge_points);

                sensor_msgs::PointCloud point_cloud_msg;
                point_cloud_msg.header.stamp = ros::Time::now();
                point_cloud_msg.header.frame_id = "camera_color_optical_frame";

                // Convert pixel points (u,v) to 3D points (x,y,z)
                for(auto &point : edge_points) 
                {
                    float u = point.x;
                    float v = point.y;

                    float depth = static_cast<float>(depth_image.at<uint16_t>(v, u)) / 1000;
                    
                    geometry_msgs::Point32 ros_point;
                    ros_point.x = (u - cx) * depth / fx;
                    ros_point.y = (v - cy) * depth / fy;
                    ros_point.z = depth;
                    
                    point_cloud_msg.points.push_back(ros_point);
                }
                point_cloud_pub.publish(point_cloud_msg);
            }
        }
};

int main(int argc, char** argv)
{
    // Initialize ROS
    ros::init(argc, argv, "point_cloud");

    // Create ROS Node
    ros::NodeHandle nh;

    // Create a point cloud object
    PointCloud pc(nh);

    // Spin the node
    ros::spin();

    return 0;
}