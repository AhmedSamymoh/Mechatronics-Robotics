#!/usr/bin/env python3

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge


def cam_stream():
    rospy.init_node('cam_stream_node', anonymous=True)
    pub = rospy.Publisher("/camstream", Image, queue_size=10)
    bridge = CvBridge()
    
    cap = cv2.VideoCapture("/home/sami/Desktop/robotics/Lab4/catkin_ws/src/carcrash.mp4")
    
    if not cap.isOpened():
        print("Error: Could not open video.")
        exit()
        
        
    frame_id = 0
    rate = rospy.Rate(30)
    try:
        while not rospy.is_shutdown():
            ret, frame = cap.read()
        
            if not ret:
                print("Video Finished")
                return
    
                
            ros_image = bridge.cv2_to_imgmsg(frame,encoding="bgr8")
            ros_image.header.stamp = rospy.Time.now()
            ros_image.header.frame_id = str(frame_id)
            
            frame_id += 1
            rospy.loginfo(f"Publishing frame {frame_id}")
        
            pub.publish(ros_image)
            
            rate.sleep()
        
    except KeyboardInterrupt:
        rospy.loginfo("Streaming interrupted by user.")
    finally:
        cap.release()
        rospy.loginfo("Camera stream closed.")

        
        
if __name__ == "__main__":
    try:
        cam_stream()
    except rospy.ROSInterruptException:
        pass