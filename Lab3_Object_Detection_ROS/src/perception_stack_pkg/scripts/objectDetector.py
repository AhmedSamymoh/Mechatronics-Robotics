#!/usr/bin/env python3

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

from ultralytics import YOLO





bridge = CvBridge()
detection_model = YOLO("/home/sami/Desktop/robotics/Lab3/catkin_ws/src/perception_stack_pkg/scripts/yolo11n.pt")

def detect_callback(img_msg):
    global bridge
    
    #extract image from message 
    image_msg_header = img_msg.header
    msg_timestamp = image_msg_header.stamp
    frame_id = image_msg_header.frame_id
    
    # decode msg payload to image
    frame = bridge.imgmsg_to_cv2(img_msg, desired_encoding="bgr8")
    
    detection_results = detection_model(frame)
    rospy.loginfo(f"Detected {len(detection_results)} objects.")
    
    for box in detection_results[0].boxes:
        x1, y1, x2, y2 = map(int, box.xyxy[0])
        conf = float(box.conf[0])
        classId = int(box.cls[0])
        className = detection_model.names[classId]
        cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0), 3)
        cv2.putText(frame, f"{className}", (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)
    cv2.imshow("Object Detection", frame)
    cv2.waitKey(1)
    
    
if __name__ == "__main__":
    cam_topic = "/camstream"
    rospy.init_node('object_detector')
    
    rospy.loginfo("Starting object detection node.")
    rospy.Subscriber(f"{cam_topic}", Image, detect_callback)
    rospy.spin()