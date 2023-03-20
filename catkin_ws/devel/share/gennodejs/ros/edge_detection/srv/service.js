// Auto-generated. Do not edit!

// (in-package edge_detection.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class serviceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input_image = null;
    }
    else {
      if (initObj.hasOwnProperty('input_image')) {
        this.input_image = initObj.input_image
      }
      else {
        this.input_image = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type serviceRequest
    // Serialize message field [input_image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.input_image, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type serviceRequest
    let len;
    let data = new serviceRequest(null);
    // Deserialize message field [input_image]
    data.input_image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.Image.getMessageSize(object.input_image);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'edge_detection/serviceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a290e9e25e4086fd604347d20967f215';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Service request message for edge detection
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new serviceRequest(null);
    if (msg.input_image !== undefined) {
      resolved.input_image = sensor_msgs.msg.Image.Resolve(msg.input_image)
    }
    else {
      resolved.input_image = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

class serviceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.edges_image = null;
    }
    else {
      if (initObj.hasOwnProperty('edges_image')) {
        this.edges_image = initObj.edges_image
      }
      else {
        this.edges_image = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type serviceResponse
    // Serialize message field [edges_image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.edges_image, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type serviceResponse
    let len;
    let data = new serviceResponse(null);
    // Deserialize message field [edges_image]
    data.edges_image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.Image.getMessageSize(object.edges_image);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'edge_detection/serviceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a30db8ee9afdde291c7437f220d2ce74';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new serviceResponse(null);
    if (msg.edges_image !== undefined) {
      resolved.edges_image = sensor_msgs.msg.Image.Resolve(msg.edges_image)
    }
    else {
      resolved.edges_image = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

module.exports = {
  Request: serviceRequest,
  Response: serviceResponse,
  md5sum() { return 'e688705977db0e1d33f518faf3757bce'; },
  datatype() { return 'edge_detection/service'; }
};
