# ROS-Edge-Detection

The following tasks were completed as part of Neura Robotics interview on Edge Detection using ROS. The goal is to detect edges of a checkboard and highlight them with a green line.

First, in the catkin_ws/src/edge_detection_ros/ folder, decompress the robot.zip package. A video of one run of the robot with the point cloud is in the folder video/



https://user-images.githubusercontent.com/65805235/226298516-70ba6a32-6701-4ae2-90c7-49d4b23ec774.mp4




There were in general 5 problem statements whose solutions are described below:

## Problem 1
* Problem (Edge Detection):
Create a Edge Detector function which will take image input files and will return the original image superimposed with edges detected and highlighted with green line.

* Solution:
To solve this problem, the Canny Edge Detector is used. The files present for theis task are: EdgeDetector.cpp and EdgeDetector.hpp. The code is robust to noise, distortion and can take as input image files of varied dimensions. The edge detector can be parametrized with the threshold values, the aparture and the dilution parameter.

* Installation:
For the Canny Edge Detection, the open source OpenCV library is used for it varsitality and ease of use. ROS noetic and Cmake are also required to run the package in this repository.
Installation of OpenCV: [Official OpenCV website](https://opencv.org/)
Installation of ROS Noetic: [Official ROS website](http://wiki.ros.org/noetic/Installation)
Installation of Cmake: [Official Cmake website](https://cmake.org/install/)

* Implementation steps:
To use the canny edge detector, use the EdgeDetector.cpp file in the src folder of the package edge_detection. In the main function, provide the input path to the image and run the function. The output will show the original image with edges highlighted in green.

## Problem 2
* Problem (Service):
Give an example of client and server for the edge detection task. The client will take images from the image folder provided within the data/.

* Solution:
The client (client.cpp) takes input arguments as the input folder to the image files and the output folder where the images will be stored. It will call the server for all the image files. The edge detector parameters can be set within the server (server.cpp) file. The service used by both the client and server is stored in srv/

* Implementation:
```
## Terminal 1
roscore

## Terminal 2
cd <path to catkin workspace>
catkin_make
source devel/setup.bash
rosrun edge_detection edge_detection_server_node

## Terminal 3
cd <path to catkin workspace>
source devel/setup.bash
rosrun edge_detection edge_detection_client_node
```

## Problem 3
* Problem (Bag file subscriber):
Detect edges from a topic published from the ROS bag file. The detected edges should be visulaized in RViz

* Solution:
A node (subscriber.cpp) is created which subscribes to the image topic from the ROS bag file and publishes the detected edge image on the topic "superimposed_edges". This topic can be used to visualize the detected edge image on RViz

* Implementation:
```
## Terminal 1
roscore

## Terminal 2
cd <path to catkin workspace>
catkin_make
source devel/setup.bash
rosrun edge_detection edge_detection_bag_subscriber_node

## Terminal 3
rviz
In rviz -> go to add -> select By Topic -> /superimposed_edges -> image 

## Terminal 4
rosbag play --clock -l <path to bagfile>
```

## Problem 4
* Problem (Point Cloud):
Convert the pixel coordinates (u,v) of the detected edges to Point Cloud 3D points (x,y,z) using the depth images and camera parameters in the ROS bag file.

* Solution:
A node (pointcloud.cpp) is created which subscribes to the /edges topic from the subscriber node created in the previous step, it also subscribes to the depth images and camera info topic from the bag file and generates the 3D point cloud for the detected edges. The point cloud is poublished on the topic /edge_points and has the message type sensor_msgs/PointCloud

* Implementation:
```
## Terminal 1
roscore

## Terminal 2
cd <path to catkin workspace>
catkin_make
source devel/setup.bash
rosrun edge_detection edge_detection_bag_subscriber_node

## Terminal 3
cd <path to catkin workspace>
source devel/setup.bash
rosrun edge_detection edge_detection_pointcloud_node

## Terminal 4
rosbag play --clock -l <path to bagfile>

## Terminal 4
cd <path to catkin workspace>
source devel/setup.bash
rostopic echo /edge_points
```

## Problem 4
* Problem (Visualize the Point Cloud):
Visualize the point clouds in RViz.

* Solution:
The published point cloud on the topic /edge_points is visualized with the robot model in RViz

* Implementation:
```
## Terminal 1
roscore

## Terminal 2
cd <path to catkin workspace>
catkin_make
source devel/setup.bash
rosrun edge_detection edge_detection_bag_subscriber_node

## Terminal 3
cd <path to catkin workspace>
source devel/setup.bash
rosrun edge_detection edge_detection_pointcloud_node

## Terminal 4
rosbag play --clock -l <path to bagfile>

## Terminal 5
rosparam set /use_sim_time true
source <path to catkin workspace>/devel/setup.bash
roslaunch mira_picker display.launch gripper_name:=robotiq2f_140 publish_joint_state:=false publish_robot_state:=false
In rviz -> go to add -> select By Topic -> /edge_points -> PointCloud 
```

