#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from perception_stack_pkg.msg import DetectedObjectArray, ObjectSpeed  # Custom messages

class SpeedEstimationNode:
    def __init__(self):
        rospy.init_node('speed_estimation_node', anonymous=True)
        self.bridge = CvBridge()

        # Subscribe to the camera stream and detected objects
        self.image_sub = rospy.Subscriber("/camstream", Image, self.image_callback)
        self.detected_objects_sub = rospy.Subscriber("/detected_objects", DetectedObjectArray, self.detected_objects_callback)

        # Publisher for object speeds
        self.speed_pub = rospy.Publisher("/object_speeds", ObjectSpeed, queue_size=10)

        # Initialize variables for optical flow
        self.prev_frame = None
        self.prev_bboxes = None
        self.frame_rate = 30  # Assuming 30 FPS (adjust based on your video)

    def image_callback(self, img_msg):
        # Convert ROS image message to OpenCV frame
        frame = self.bridge.imgmsg_to_cv2(img_msg, desired_encoding="bgr8")
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        if self.prev_frame is not None and self.prev_bboxes is not None:
            # Compute optical flow using Farneback method
            flow = cv2.calcOpticalFlowFarneback(
                self.prev_frame, gray, None, 0.5, 3, 15, 3, 5, 1.2, 0
            )

            # Estimate speed for each detected object
            for obj in self.prev_bboxes.objects:
                x1, y1, x2, y2 = obj.bbox_x1, obj.bbox_y1, obj.bbox_x2, obj.bbox_y2
                center_x = (x1 + x2) // 2
                center_y = (y1 + y2) // 2

                # Get motion vector at the center of the bounding box
                motion_vector = flow[center_y, center_x]
                dx, dy = motion_vector

                # Calculate speed (pixels per second)
                speed_x = dx * self.frame_rate
                speed_y = dy * self.frame_rate
                speed = np.sqrt(speed_x**2 + speed_y**2)

                # Publish the object speed
                speed_msg = ObjectSpeed()
                speed_msg.id = obj.class_id  # Use class ID as object ID
                speed_msg.speed = speed
                self.speed_pub.publish(speed_msg)

                rospy.loginfo(f"\n [ID: {obj.class_id}] Object {obj.class_name} --> Has Speed: {speed:.2f} pixels/sec")
                print(f"-----------------------------------------------------------------------------------------")


        # Update previous frame
        self.prev_frame = gray

    def detected_objects_callback(self, detected_objects_msg):
        # Store the detected objects for speed estimation
        self.prev_bboxes = detected_objects_msg

    def run(self):
        rospy.spin()

if __name__ == "__main__":
    try:
        node = SpeedEstimationNode()
        node.run()
    except rospy.ROSInterruptException:
        pass