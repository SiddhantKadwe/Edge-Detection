#include <edge_detection/EdgeDetector.hpp>
#include <iostream>

namespace edge_detection
{
    // Constructor
    EdgeDetector::EdgeDetector(double canny_threshold_1, double canny_threshold_2,
                               int aperture_size, int dilation_size)
        : canny_threshold_1_(canny_threshold_1), canny_threshold_2_(canny_threshold_2),
        aperture_size_(aperture_size), dilation_size_(dilation_size) 
    {}

    // Destructor
    EdgeDetector::~EdgeDetector() {}

    // Detect Edges
    cv::Mat EdgeDetector::detectEdges(cv::Mat& image)
    {
        // Convert the image to grayscale
        cv::Mat gray_image;
        cv::cvtColor(image, gray_image, cv::COLOR_BGR2GRAY);

        // Apply a Gaussian blur to the image to remove noise
        cv::GaussianBlur(gray_image, gray_image, cv::Size(3, 3), 0);

        // Apply the Canny edge detection algorithm
        cv::Mat edges;
        cv::Canny(gray_image, edges, canny_threshold_1_, canny_threshold_2_, aperture_size_);

        // Dilate the edges to fill in gaps
        cv::Mat kernel = cv::getStructuringElement(cv::MORPH_RECT, 
                                                   cv::Size(dilation_size_, dilation_size_));
        cv::Mat dilated_edges;
        cv::dilate(edges, dilated_edges, kernel);

        return dilated_edges;
    }

    // Color the Edges Green and Superimpose on Original Image
    cv::Mat EdgeDetector::ColorEdges(cv::Mat& image, cv::Mat& dilated_edges)
    {
        // Create a color image with green edges superimposed on the original image
        cv::Mat edges_image;
        cv::cvtColor(dilated_edges, edges_image, cv::COLOR_GRAY2BGR);
        for (int i = 0; i < edges_image.rows; i++) {
            for (int j = 0; j < edges_image.cols; j++) {
                if (edges_image.at<cv::Vec3b>(i, j) == cv::Vec3b(255, 255, 255)) {
                    edges_image.at<cv::Vec3b>(i, j) = cv::Vec3b(0, 255, 0);
                }
            }
        }

        cv::Mat output_image;
        cv::addWeighted(image, 0.7, edges_image, 0.3, 0, output_image);

        // Return the color image with edges superimposed on the original image
        return output_image;
    }
}

int main()
{
	edge_detection::EdgeDetector detector;
    
    // Create the executable for testing the code here

    // Load an input image from a file
    cv::Mat input_image = cv::imread("../data/Image_1.png");

    // Perform edge detection on the input image
    cv::Mat dilated_edges = detector.detectEdges(input_image);

    // Superimpose on input image
    cv::Mat output_image = detector.ColorEdges(input_image, dilated_edges);

    // Display the output image
    cv::imshow("Output Image", output_image);
    cv::waitKey(0);

	return 0;
}
