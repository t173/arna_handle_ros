// Auto-generated. Do not edit!

// (in-package arna_handle.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class HandleState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.left = null;
      this.right = null;
    }
    else {
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = new Array(8).fill(0);
      }
      if (initObj.hasOwnProperty('right')) {
        this.right = initObj.right
      }
      else {
        this.right = new Array(8).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HandleState
    // Check that the constant length array field [left] has the right length
    if (obj.left.length !== 8) {
      throw new Error('Unable to serialize array field left - length must be 8')
    }
    // Serialize message field [left]
    bufferOffset = _arraySerializer.float32(obj.left, buffer, bufferOffset, 8);
    // Check that the constant length array field [right] has the right length
    if (obj.right.length !== 8) {
      throw new Error('Unable to serialize array field right - length must be 8')
    }
    // Serialize message field [right]
    bufferOffset = _arraySerializer.float32(obj.right, buffer, bufferOffset, 8);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HandleState
    let len;
    let data = new HandleState(null);
    // Deserialize message field [left]
    data.left = _arrayDeserializer.float32(buffer, bufferOffset, 8)
    // Deserialize message field [right]
    data.right = _arrayDeserializer.float32(buffer, bufferOffset, 8)
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'arna_handle/HandleState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '23088a19e1128164dade1d897d8039d0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Each handle should have eight sensors, connected to the custom
    # Arduino hat as pins A0-A7 (left handle) and pins A8-A15 (right
    # handle)
    float32[8] left
    float32[8] right
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HandleState(null);
    if (msg.left !== undefined) {
      resolved.left = msg.left;
    }
    else {
      resolved.left = new Array(8).fill(0)
    }

    if (msg.right !== undefined) {
      resolved.right = msg.right;
    }
    else {
      resolved.right = new Array(8).fill(0)
    }

    return resolved;
    }
};

module.exports = HandleState;
