// Auto-generated. Do not edit!

// (in-package perception_stack_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DetectedObject {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bbox_x1 = null;
      this.bbox_y1 = null;
      this.bbox_x2 = null;
      this.bbox_y2 = null;
      this.confidence = null;
      this.class_id = null;
      this.class_name = null;
    }
    else {
      if (initObj.hasOwnProperty('bbox_x1')) {
        this.bbox_x1 = initObj.bbox_x1
      }
      else {
        this.bbox_x1 = 0;
      }
      if (initObj.hasOwnProperty('bbox_y1')) {
        this.bbox_y1 = initObj.bbox_y1
      }
      else {
        this.bbox_y1 = 0;
      }
      if (initObj.hasOwnProperty('bbox_x2')) {
        this.bbox_x2 = initObj.bbox_x2
      }
      else {
        this.bbox_x2 = 0;
      }
      if (initObj.hasOwnProperty('bbox_y2')) {
        this.bbox_y2 = initObj.bbox_y2
      }
      else {
        this.bbox_y2 = 0;
      }
      if (initObj.hasOwnProperty('confidence')) {
        this.confidence = initObj.confidence
      }
      else {
        this.confidence = 0.0;
      }
      if (initObj.hasOwnProperty('class_id')) {
        this.class_id = initObj.class_id
      }
      else {
        this.class_id = 0;
      }
      if (initObj.hasOwnProperty('class_name')) {
        this.class_name = initObj.class_name
      }
      else {
        this.class_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DetectedObject
    // Serialize message field [bbox_x1]
    bufferOffset = _serializer.int32(obj.bbox_x1, buffer, bufferOffset);
    // Serialize message field [bbox_y1]
    bufferOffset = _serializer.int32(obj.bbox_y1, buffer, bufferOffset);
    // Serialize message field [bbox_x2]
    bufferOffset = _serializer.int32(obj.bbox_x2, buffer, bufferOffset);
    // Serialize message field [bbox_y2]
    bufferOffset = _serializer.int32(obj.bbox_y2, buffer, bufferOffset);
    // Serialize message field [confidence]
    bufferOffset = _serializer.float32(obj.confidence, buffer, bufferOffset);
    // Serialize message field [class_id]
    bufferOffset = _serializer.int32(obj.class_id, buffer, bufferOffset);
    // Serialize message field [class_name]
    bufferOffset = _serializer.string(obj.class_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DetectedObject
    let len;
    let data = new DetectedObject(null);
    // Deserialize message field [bbox_x1]
    data.bbox_x1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [bbox_y1]
    data.bbox_y1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [bbox_x2]
    data.bbox_x2 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [bbox_y2]
    data.bbox_y2 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [confidence]
    data.confidence = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [class_id]
    data.class_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [class_name]
    data.class_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.class_name);
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'perception_stack_pkg/DetectedObject';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '59ad9b3bc0b10f30a1f81dc9d89f08f9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 bbox_x1
    int32 bbox_y1
    int32 bbox_x2
    int32 bbox_y2
    float32 confidence
    int32 class_id
    string class_name
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DetectedObject(null);
    if (msg.bbox_x1 !== undefined) {
      resolved.bbox_x1 = msg.bbox_x1;
    }
    else {
      resolved.bbox_x1 = 0
    }

    if (msg.bbox_y1 !== undefined) {
      resolved.bbox_y1 = msg.bbox_y1;
    }
    else {
      resolved.bbox_y1 = 0
    }

    if (msg.bbox_x2 !== undefined) {
      resolved.bbox_x2 = msg.bbox_x2;
    }
    else {
      resolved.bbox_x2 = 0
    }

    if (msg.bbox_y2 !== undefined) {
      resolved.bbox_y2 = msg.bbox_y2;
    }
    else {
      resolved.bbox_y2 = 0
    }

    if (msg.confidence !== undefined) {
      resolved.confidence = msg.confidence;
    }
    else {
      resolved.confidence = 0.0
    }

    if (msg.class_id !== undefined) {
      resolved.class_id = msg.class_id;
    }
    else {
      resolved.class_id = 0
    }

    if (msg.class_name !== undefined) {
      resolved.class_name = msg.class_name;
    }
    else {
      resolved.class_name = ''
    }

    return resolved;
    }
};

module.exports = DetectedObject;
