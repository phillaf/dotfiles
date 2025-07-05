#!/bin/bash

sudo modprobe v4l2loopback video_nr=10 card_label="FixedCam" exclusive_caps=1
sudo chmod 000 /dev/video0
ffmpeg -f v4l2 -input_format yuyv422 -i /dev/video0 -f v4l2 -pix_fmt yuyv422 /dev/video10

