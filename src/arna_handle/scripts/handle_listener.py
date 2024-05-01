#!/usr/bin/env python3

import sys
import os
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.animation as animation

import rospy
from arna_handle.msg import HandleState

max_value = 1000

bar_style = {
    'color': '#AD0000',
}

mpl.rcParams['toolbar'] = 'None'

state = None
def callback(data):
    global state
    state = data
    #rospy.loginfo("left:" + str(data.left) + "; right:" + str(data.right))

def make_bars(ax, sensors):
    x = np.arange(len(sensors))
    return ax.bar(x, sensors, width=0.9, align='center', **bar_style)

def anim_init():
    fig, (left, right) = plt.subplots(1, 2, sharey=True, num='Handles', constrained_layout=False, facecolor='#CCCCCC')
    #left.axis('off')
    #right.axis('off')

    global state, left_bars, right_bars
    while state is None:
        pass
    left_bars = make_bars(left, state.left)
    left.set_xticks(np.arange(len(state.left)))
    left.set_xlabel("Left", fontsize=20)

    right_bars = make_bars(right, state.right)
    right.set_xticks(np.arange(len(state.right)))
    right.set_xlabel("Right", fontsize=20)

    left.set_ylim(0, max_value)
    left.set_yticks([])
    plt.subplots_adjust(left=0.05, right=0.95, top=0.98, bottom=0.15, wspace=0)
    return fig, left, right

def anim_update(frame, left_ax, right_ax):
    global state, left_bars, right_bars
    left_bars.remove()
    right_bars.remove()
    left_bars = make_bars(left_ax, state.left)
    right_bars = make_bars(right_ax, state.right)
    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('handle_listener', anonymous=True)
    rospy.Subscriber('handle', HandleState, callback)

    fig, left, right = anim_init()
    anim = animation.FuncAnimation(fig, cache_frame_data=False, func=anim_update, fargs=(left, right), interval=0)
    plt.show()

    # spin() simply keeps python from exiting until this node is stopped
    #rospy.spin()

if __name__ == '__main__':
    listener()
