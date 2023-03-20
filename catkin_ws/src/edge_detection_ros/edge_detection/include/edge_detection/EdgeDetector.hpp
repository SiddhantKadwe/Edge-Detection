#pragma once
#include <opencv2/opencv.hpp>

namespace edge_detection
{
    class EdgeDetector
    {
        private:
            double canny_threshold_1_;
            double canny_threshold_2_;
            int aperture_size_;
            int dilation_size_;

        public:
        
            // Constructor
            EdgeDetector(double canny_threshold_1 = 300.0, double canny_threshold_2 = 300.0,
                        int aperture_size = 3, int dilation_size = 6);

            // Destructor
            ~EdgeDetector();

            // Detect Edges
            cv::Mat detectEdges(cv::Mat& image);

            // Color the Edges Green and Superimpose on Original Image
            cv::Mat ColorEdges(cv::Mat& image, cv::Mat& dilated_edges);
    };
}