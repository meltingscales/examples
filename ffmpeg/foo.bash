#!/usr/bin/env bash

ffmpeg -loop 1 -i dragon.jpg -i raw.mp3 -c:a copy -c:v libx264 -shortest outputvideo.mp4
