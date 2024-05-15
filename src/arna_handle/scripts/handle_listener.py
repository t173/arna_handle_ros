#!/usr/bin/env python3

import sys
import os
import argparse
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib.ticker import PercentFormatter

import rospy
from arna_handle.msg import HandleState

max_value = 1000

bar_style = {
    'color': '#AD0000',  # official UofL cardinal red
}

mpl.rcParams['toolbar'] = 'None'

parser = argparse.ArgumentParser()
parser.add_argument('--text', action='store_true')
cmdline = parser.parse_args()

state = None
def callback(data):
    global state
    state = data
    #rospy.loginfo("left:" + str(data.left) + "; right:" + str(data.right))

def make_bars(ax, sensors):
    x = np.arange(len(sensors))
    return ax.bar(x, sensors, width=0.9, align='center', **bar_style)

def set_textvalues(texts, bars):
    for i, y in enumerate(bars.datavalues):
        p = 100.0*y/max_value
        if p < 0: p = 0
        if p > 100: p = 100
        texts[i].set_text('%3.0f' % p)

def make_textvalues(ax, bars):
    num_bars = len(bars)
    pos = np.arange(num_bars)
    return [ax.text(i, 0, 'XXX', ha='center', va='bottom') for i in range(num_bars)]

def anim_init():
    fig, (left, right) = plt.subplots(1, 2, sharey=True, num='Handles', constrained_layout=False, facecolor='#CCCCCC')
    #left.axis('off')
    #right.axis('off')

    global state, left_bars, right_bars, left_values, right_values
    while state is None:
        pass
    left_bars = make_bars(left, state.left)
    left.set_xticks(np.arange(len(state.left)))
    left.set_xlabel("Left", fontsize=20)

    right_bars = make_bars(right, state.right)
    right.set_xticks(np.arange(len(state.right)))
    right.set_xlabel("Right", fontsize=20)

    if cmdline.text:
        left_values = make_textvalues(left, left_bars)
        right_values = make_textvalues(right, right_bars)

    fmtr = PercentFormatter(xmax=max_value)
    left.yaxis.set_major_formatter(fmtr)
    right.yaxis.set_major_formatter(fmtr)
    left.set_ylim(0, max_value)
    # left.set_yticks([])
    right.tick_params(left=False, labelleft=False, right=True, labelright=True)
    plt.subplots_adjust(left=0.09, right=0.91, top=0.98, bottom=0.15, wspace=0)
    return fig, left, right

def anim_update(frame, left_ax, right_ax):
    global state, left_bars, right_bars, left_values, right_values
    left_bars.remove()
    right_bars.remove()
    left_bars = make_bars(left_ax, state.left)
    right_bars = make_bars(right_ax, state.right)

    if cmdline.text:
        set_textvalues(left_values, left_bars)
        set_textvalues(right_values, right_bars)
    
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
