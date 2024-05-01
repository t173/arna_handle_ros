#!/usr/bin/env python2

## Simple talker demo that published std_msgs/Strings messages
## to the 'chatter' topic

import sys
import pathlib
import subprocess
import rospy
#from std_msgs.msg import String
from arna_handle.msg import HandleState

import skin

devices = ['/dev/ttyACM0', '/dev/ttyACM1']
baud_rate = 115200

layout_file = "arna.layout"
calib_file = "arna.calib"
smoothing_alpha = 0.8
pressure_alpha = 0.1

shutdown = False

def setup_octocan():
    # Find octocan device
    device_found = False
    for device in devices:
        path = pathlib.Path(device)
        if path.exists() and path.is_char_device():
            device_found = device
            break
    if not device_found:
        rospy.loginfo("Cannot find octocan device, tried:\n {}" % (*devices))
        sys.exit(1)
    else:
        rospy.loginfo("Found octocan device on {}" % device)

    # Configure serial
    def run_stty(*args):
        return subprocess.run(['stty', '-clocal', '-F', device] + list(args), check=True)
    rospy.loginfo("Configuring {}" % device)
    try:
        run_stty('raw', '-echo', '-echoe', '-echok', str(baud_rate))
    except subprocess.CalledProcessError:
        rospy.loginfo("Error configuring {}" % device)
        sys.exit(1)

    # Setup sensor communication object
    sensor = skin.Skin(device=device, layout=layout_file)
    sensor.set_alpha(smoothing_alpha)
    sensor.set_pressure_alpha(pressure_alpha)
    sensor.read_profile(calib_file)
    return sensor

def talker():
    global shutdown
    sensor = setup_octocan()
    sensor.start()

    pub = rospy.Publisher('handle', HandleState, queue_size=1)
    rospy.init_node('handle_talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        msg = HandleState()
        msg.left = sensor.get_patch_state(1)
        msg.right = sensor.get_patch_state(2)
        rospy.loginfo(msg)
        pub.publish(msg)
        rate.sleep()

    shutdown = True
    sensor.stop()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
