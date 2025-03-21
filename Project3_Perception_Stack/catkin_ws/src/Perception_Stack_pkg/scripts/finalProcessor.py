#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from perception_stack_pkg.msg import DetectedObjectArray, ObjectSpeed, ObjectInfo, ObjectList  # Custom messages
import threading  # Import the threading module for semaphore

class FinalProcessorNode:
    def __init__(self):
        rospy.init_node('final_processor_node', anonymous=True)
        self.bridge = CvBridge()

        # Subscribers
        self.detected_objects_sub = rospy.Subscriber("/detected_objects", DetectedObjectArray, self.detected_objects_callback)
        self.speed_sub = rospy.Subscriber("/object_speeds", ObjectSpeed, self.speed_callback)
        self.segmentation_sub = rospy.Subscriber("/segmentation_results", Image, self.segmentation_callback)

        # Publisher for the final object list
        self.object_list_pub = rospy.Publisher("/final_object_list", ObjectList, queue_size=10)

        # Variables to store data
        self.detected_objects = None
        self.speeds = {}  # Dictionary to store speeds by object ID
        self.segmentation_frame = None

        # Unique ID counter for objects
        self.object_id_counter = 0

        # Semaphore to protect the display
        self.display_semaphore = threading.Semaphore(1)

    def detected_objects_callback(self, detected_objects_msg):
        # Store detected objects
        self.detected_objects = detected_objects_msg

    def speed_callback(self, speed_msg):
        # Store speed for the corresponding object ID
        self.speeds[speed_msg.id] = speed_msg.speed

    def segmentation_callback(self, segmentation_msg):
        # Store segmentation frame
        self.segmentation_frame = self.bridge.imgmsg_to_cv2(segmentation_msg, desired_encoding="bgr8")

    def process_and_publish(self):
        if self.detected_objects is None or self.segmentation_frame is None:
            return

        # Create the final object list
        object_list = ObjectList()
        object_list.header.stamp = rospy.Time.now()
        object_list.header.frame_id = self.detected_objects.header.frame_id

        for obj in self.detected_objects.objects:
            # Create an ObjectInfo message
            object_info = ObjectInfo()
            object_info.id = self.object_id_counter
            object_info.class_name = obj.class_name
            object_info.bbox_x1 = obj.bbox_x1
            object_info.bbox_y1 = obj.bbox_y1
            object_info.bbox_x2 = obj.bbox_x2
            object_info.bbox_y2 = obj.bbox_y2
            object_info.confidence = obj.confidence
            object_info.speed = self.speeds.get(obj.class_id, 0.0)  # Default speed is 0.0 if not available

            # Add segmentation mask (if available)
            if self.segmentation_frame is not None:
                mask = self.segmentation_frame[obj.bbox_y1:obj.bbox_y2, obj.bbox_x1:obj.bbox_x2]
                object_info.segmentation_mask = self.bridge.cv2_to_imgmsg(mask, encoding="bgr8").data

            # Add the object to the list
            object_list.objects.append(object_info)

            # Increment object ID counter
            self.object_id_counter += 1

        # Publish the final object list
        self.object_list_pub.publish(object_list)

        # Display the results
        self.display_results()

    def display_results(self):
        if self.detected_objects is None or self.segmentation_frame is None:
            return

        # Create a copy of the segmentation frame for display
        display_frame = self.segmentation_frame.copy()

        for obj in self.detected_objects.objects:
            # Draw bounding box
            cv2.rectangle(display_frame, (obj.bbox_x1, obj.bbox_y1), (obj.bbox_x2, obj.bbox_y2), (0, 255, 0), 2)

            # Draw class label, confidence, and speed
            label = f"[{obj.id}]{obj.class_name} ({obj.confidence:.2f}) | Speed: {self.speeds.get(obj.class_id, 0.0):.2f} px/s"
            cv2.putText(display_frame, label, (obj.bbox_x1, obj.bbox_y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 1)

        # Acquire the semaphore before displaying the frame
        self.display_semaphore.acquire()
        try:
            # Show the frame
            cv2.imshow("Final Object Detection", display_frame)
            cv2.waitKey(1)
        finally:
            # Release the semaphore after displaying the frame
            self.display_semaphore.release()

    def run(self):
        rate = rospy.Rate(150)  # 10 Hz
        while not rospy.is_shutdown():
            self.process_and_publish()
            rate.sleep()

if __name__ == "__main__":
    try:
        node = FinalProcessorNode()
        node.run()
    except rospy.ROSInterruptException:
        pass