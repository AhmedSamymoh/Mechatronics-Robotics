#!/usr/bin/env python3

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from ultralytics import YOLO

from perception_stack_pkg.msg import DetectedObject, DetectedObjectArray  # Custom messages

# Initialize YOLO model and CV bridge
bridge = CvBridge()
detection_model = YOLO("/home/sami/Desktop/robotics/Lab4/catkin_ws/src/Perception_Stack_pkg/scripts/yolo11n.pt")

def detect_callback(img_msg):
    global bridge, detection_model

    # Extract image from message
    frame = bridge.imgmsg_to_cv2(img_msg, desired_encoding="bgr8")

    # Run YOLO detection
    detection_results = detection_model(frame)
    rospy.loginfo(f"Detected {len(detection_results[0].boxes)} objects.")

    # Create a list to store detected objects
    detected_objects = DetectedObjectArray()

    for box in detection_results[0].boxes:
        # Extract bounding box, confidence, and class ID
        x1, y1, x2, y2 = map(int, box.xyxy[0])
        conf = float(box.conf[0])
        class_id = int(box.cls[0])
        class_name = detection_model.names[class_id]

        # Create a DetectedObject message
        obj_msg = DetectedObject()
        obj_msg.bbox_x1 = x1
        obj_msg.bbox_y1 = y1
        obj_msg.bbox_x2 = x2
        obj_msg.bbox_y2 = y2
        obj_msg.confidence = conf
        obj_msg.class_id = class_id
        obj_msg.class_name = class_name

        # Add the object to the list
        detected_objects.objects.append(obj_msg)

        # Draw bounding box and label on the frame
        cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0),  1)
        cv2.putText(frame, f"{class_name} ({conf:.2f})", (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 1)
    # Publish the detected objects
    detected_objects.header.stamp = rospy.Time.now()
    detected_objects.header.frame_id = img_msg.header.frame_id
    detection_pub.publish(detected_objects)

    # Display the frame
    cv2.imshow("Object Detection", frame)
    cv2.waitKey(1)

if __name__ == "__main__":
    # Initialize ROS node
    rospy.init_node('object_detector_node')

    # Publisher for detected objects
    detection_pub = rospy.Publisher("/detected_objects", DetectedObjectArray, queue_size=10)

    # Subscribe to the camera stream
    cam_topic = "/camstream"
    rospy.Subscriber(cam_topic, Image, detect_callback)

    rospy.loginfo("Object Detection Node started.")
    rospy.spin()