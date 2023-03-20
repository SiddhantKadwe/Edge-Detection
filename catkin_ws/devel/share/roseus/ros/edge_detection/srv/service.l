;; Auto-generated. Do not edit!


(when (boundp 'edge_detection::service)
  (if (not (find-package "EDGE_DETECTION"))
    (make-package "EDGE_DETECTION"))
  (shadow 'service (find-package "EDGE_DETECTION")))
(unless (find-package "EDGE_DETECTION::SERVICE")
  (make-package "EDGE_DETECTION::SERVICE"))
(unless (find-package "EDGE_DETECTION::SERVICEREQUEST")
  (make-package "EDGE_DETECTION::SERVICEREQUEST"))
(unless (find-package "EDGE_DETECTION::SERVICERESPONSE")
  (make-package "EDGE_DETECTION::SERVICERESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass edge_detection::serviceRequest
  :super ros::object
  :slots (_input_image ))

(defmethod edge_detection::serviceRequest
  (:init
   (&key
    ((:input_image __input_image) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _input_image __input_image)
   self)
  (:input_image
   (&rest __input_image)
   (if (keywordp (car __input_image))
       (send* _input_image __input_image)
     (progn
       (if __input_image (setq _input_image (car __input_image)))
       _input_image)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _input_image
    (send _input_image :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _input_image
       (send _input_image :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _input_image
     (send _input_image :deserialize buf ptr-) (incf ptr- (send _input_image :serialization-length))
   ;;
   self)
  )

(defclass edge_detection::serviceResponse
  :super ros::object
  :slots (_edges_image ))

(defmethod edge_detection::serviceResponse
  (:init
   (&key
    ((:edges_image __edges_image) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _edges_image __edges_image)
   self)
  (:edges_image
   (&rest __edges_image)
   (if (keywordp (car __edges_image))
       (send* _edges_image __edges_image)
     (progn
       (if __edges_image (setq _edges_image (car __edges_image)))
       _edges_image)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _edges_image
    (send _edges_image :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _edges_image
       (send _edges_image :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _edges_image
     (send _edges_image :deserialize buf ptr-) (incf ptr- (send _edges_image :serialization-length))
   ;;
   self)
  )

(defclass edge_detection::service
  :super ros::object
  :slots ())

(setf (get edge_detection::service :md5sum-) "e688705977db0e1d33f518faf3757bce")
(setf (get edge_detection::service :datatype-) "edge_detection/service")
(setf (get edge_detection::service :request) edge_detection::serviceRequest)
(setf (get edge_detection::service :response) edge_detection::serviceResponse)

(defmethod edge_detection::serviceRequest
  (:response () (instance edge_detection::serviceResponse :init)))

(setf (get edge_detection::serviceRequest :md5sum-) "e688705977db0e1d33f518faf3757bce")
(setf (get edge_detection::serviceRequest :datatype-) "edge_detection/serviceRequest")
(setf (get edge_detection::serviceRequest :definition-)
      "# Service request message for edge detection
sensor_msgs/Image input_image

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
# Service response message for edge detection
sensor_msgs/Image edges_image  # Image with edges superimposed on the original image


================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
")

(setf (get edge_detection::serviceResponse :md5sum-) "e688705977db0e1d33f518faf3757bce")
(setf (get edge_detection::serviceResponse :datatype-) "edge_detection/serviceResponse")
(setf (get edge_detection::serviceResponse :definition-)
      "# Service request message for edge detection
sensor_msgs/Image input_image

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
# Service response message for edge detection
sensor_msgs/Image edges_image  # Image with edges superimposed on the original image


================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
")



(provide :edge_detection/service "e688705977db0e1d33f518faf3757bce")


