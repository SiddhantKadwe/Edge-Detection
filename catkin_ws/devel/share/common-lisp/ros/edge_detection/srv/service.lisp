; Auto-generated. Do not edit!


(cl:in-package edge_detection-srv)


;//! \htmlinclude service-request.msg.html

(cl:defclass <service-request> (roslisp-msg-protocol:ros-message)
  ((input_image
    :reader input_image
    :initarg :input_image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass service-request (<service-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <service-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'service-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edge_detection-srv:<service-request> is deprecated: use edge_detection-srv:service-request instead.")))

(cl:ensure-generic-function 'input_image-val :lambda-list '(m))
(cl:defmethod input_image-val ((m <service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edge_detection-srv:input_image-val is deprecated.  Use edge_detection-srv:input_image instead.")
  (input_image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <service-request>) ostream)
  "Serializes a message object of type '<service-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'input_image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <service-request>) istream)
  "Deserializes a message object of type '<service-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'input_image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<service-request>)))
  "Returns string type for a service object of type '<service-request>"
  "edge_detection/serviceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'service-request)))
  "Returns string type for a service object of type 'service-request"
  "edge_detection/serviceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<service-request>)))
  "Returns md5sum for a message object of type '<service-request>"
  "e688705977db0e1d33f518faf3757bce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'service-request)))
  "Returns md5sum for a message object of type 'service-request"
  "e688705977db0e1d33f518faf3757bce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<service-request>)))
  "Returns full string definition for message of type '<service-request>"
  (cl:format cl:nil "# Service request message for edge detection~%sensor_msgs/Image input_image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'service-request)))
  "Returns full string definition for message of type 'service-request"
  (cl:format cl:nil "# Service request message for edge detection~%sensor_msgs/Image input_image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <service-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'input_image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <service-request>))
  "Converts a ROS message object to a list"
  (cl:list 'service-request
    (cl:cons ':input_image (input_image msg))
))
;//! \htmlinclude service-response.msg.html

(cl:defclass <service-response> (roslisp-msg-protocol:ros-message)
  ((edges_image
    :reader edges_image
    :initarg :edges_image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass service-response (<service-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <service-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'service-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edge_detection-srv:<service-response> is deprecated: use edge_detection-srv:service-response instead.")))

(cl:ensure-generic-function 'edges_image-val :lambda-list '(m))
(cl:defmethod edges_image-val ((m <service-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edge_detection-srv:edges_image-val is deprecated.  Use edge_detection-srv:edges_image instead.")
  (edges_image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <service-response>) ostream)
  "Serializes a message object of type '<service-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'edges_image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <service-response>) istream)
  "Deserializes a message object of type '<service-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'edges_image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<service-response>)))
  "Returns string type for a service object of type '<service-response>"
  "edge_detection/serviceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'service-response)))
  "Returns string type for a service object of type 'service-response"
  "edge_detection/serviceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<service-response>)))
  "Returns md5sum for a message object of type '<service-response>"
  "e688705977db0e1d33f518faf3757bce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'service-response)))
  "Returns md5sum for a message object of type 'service-response"
  "e688705977db0e1d33f518faf3757bce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<service-response>)))
  "Returns full string definition for message of type '<service-response>"
  (cl:format cl:nil "# Service response message for edge detection~%sensor_msgs/Image edges_image  # Image with edges superimposed on the original image~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'service-response)))
  "Returns full string definition for message of type 'service-response"
  (cl:format cl:nil "# Service response message for edge detection~%sensor_msgs/Image edges_image  # Image with edges superimposed on the original image~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <service-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'edges_image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <service-response>))
  "Converts a ROS message object to a list"
  (cl:list 'service-response
    (cl:cons ':edges_image (edges_image msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'service)))
  'service-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'service)))
  'service-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'service)))
  "Returns string type for a service object of type '<service>"
  "edge_detection/service")