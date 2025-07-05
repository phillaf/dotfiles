#!/bin/bash

echo "🔄 Reverting webcam fix..."

# Step 1: Restore access to the real webcam
if [ -e /dev/video0 ]; then
    echo "✅ Restoring /dev/video0 permissions..."
    sudo chmod 660 /dev/video0
else
    echo "⚠️  /dev/video0 not found — skipping permission fix"
fi

# Step 2: Remove v4l2loopback kernel module
if lsmod | grep -q v4l2loopback; then
    echo "❌ Removing v4l2loopback module..."
    sudo rmmod v4l2loopback
else
    echo "ℹ️  v4l2loopback is not loaded"
fi

# Step 3: Kill any ffmpeg process piping video to the loopback
ffmpeg_pid=$(pgrep -f "ffmpeg -f v4l2.*video10")
if [ -n "$ffmpeg_pid" ]; then
    echo "🛑 Stopping ffmpeg stream to /dev/video10 (PID $ffmpeg_pid)..."
    kill "$ffmpeg_pid"
else
    echo "ℹ️  No active ffmpeg stream found"
fi

echo "✅ Webcam fix reverted."
