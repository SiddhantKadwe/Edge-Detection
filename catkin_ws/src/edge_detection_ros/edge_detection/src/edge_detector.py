# import numpy as np 
# import cv2


# img = cv2.imread("/home/ros/neura/catkin_ws/src/edge_detection_ros/edge_detection/data/Image_2.png")

# img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# img_blur = cv2.GaussianBlur(img_gray, (3,3), 0) 

# edges = cv2.Canny(image=img_blur, threshold1=100, threshold2=200, apertureSize=3)

# # kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (1, 1), anchor=(-1, -1))

# # dilated_edges = cv2.dilate(edges,kernel)

# # contours, _ = cv2.findContours(dilated_edges, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

# cv2.imshow('Canny Edge Detection', edges)
# cv2.waitKey(0)
 
# cv2.destroyAllWindows()


import cv2
import numpy as np

import cv2

class EdgeDetector:
    def __init__(self, canny_threshold_1=50, canny_threshold_2=150, aperture_size=3, dilation_size=5):
        self.canny_threshold_1 = canny_threshold_1
        self.canny_threshold_2 = canny_threshold_2
        self.aperture_size = aperture_size
        self.dilation_size = dilation_size
    
    def detectEdges(self, image):
        # Convert the image to grayscale
        gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

        # Apply a Gaussian blur to the image to remove noise
        gray_image = cv2.GaussianBlur(gray_image, (3, 3), 0)

        # Apply the Canny edge detection algorithm
        edges = cv2.Canny(gray_image, self.canny_threshold_1, self.canny_threshold_2, self.aperture_size)

        # Dilate the edges to fill in gaps
        kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (self.dilation_size, self.dilation_size))
        dilated_edges = cv2.dilate(edges, kernel)

        # Create a color image with green edges superimposed on the original image
        edges_image = cv2.cvtColor(dilated_edges, cv2.COLOR_GRAY2BGR)
        edges_image[np.where((edges_image == [255, 255, 255]).all(axis=2))] = [0, 255, 0]
        output_image = cv2.addWeighted(image, 0.7, edges_image, 0.3, 0)

        # # Get the dimensions of the image
        # height, width = output_image.shape[:2]

        # # Define the coordinates of the bounding box
        # x1, y1 = 0, 0
        # x2, y2 = width - 1, height - 1

        # # Draw the bounding box on the image
        # cv2.rectangle(output_image, (x1, y1), (x2, y2), (0, 255, 0), 2)

        # Return the color image with edges superimposed on the original image
        return output_image

# Create an instance of the EdgeDetector class with desired parameters
canny_threshold_1 = 300
canny_threshold_2 = 300
aperture_size = 3
dilation_size = 6
edge_detector = EdgeDetector(canny_threshold_1, canny_threshold_2, aperture_size, dilation_size)

# Load an image
image_path = "/home/ros/neura/catkin_ws/src/edge_detection_ros/edge_detection/data/Image_2.png"
image = cv2.imread(image_path)

# Detect edges and superimpose on the image
output_image = edge_detector.detectEdges(image)

# Display the output image
cv2.imshow("Edges Image", output_image)
cv2.waitKey(0)
cv2.destroyAllWindows()



# import cv2

# # Load an image
# image = cv2.imread('example_image.jpg')

# # Get the dimensions of the image
# height, width = image.shape[:2]

# # Define the coordinates of the bounding box
# x1, y1 = 0, 0
# x2, y2 = width - 1, height - 1

# # Draw the bounding box on the image
# cv2.rectangle(image, (x1, y1), (x2, y2), (0, 255, 0), 2)

# # Display the result
# cv2.imshow('Bounding box', image)
# cv2.waitKey(0)
# cv2.destroyAllWindows()
