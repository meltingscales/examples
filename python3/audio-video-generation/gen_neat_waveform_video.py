import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile
from tqdm import tqdm
import os
import subprocess
import shutil  # For checking if ffmpeg exists

# Check if ffmpeg is installed
if shutil.which("ffmpeg") is None:
    raise FileNotFoundError("ffmpeg is not installed or not found in PATH. Please install it to proceed.")


# Configuration
audio_file = "audio.wav"  # Replace with your audio file path
output_video = "waveform_output.mp4"
frame_rate = 30  # Frames per second for video
chunk_size = 500  # Controls "chunkiness" of the waveform
colors = ['#00E7FF', '#FF4DFF', '#FFE500', '#B100E8', '#FF00A5', '#39FF14']  # 4lung-inspired colors
test_mode = False  # Set to True for a n-minute test video
test_duration = 5  # Duration of test video in seconds

# Load audio file and extract waveform data
sample_rate, audio_data = wavfile.read(audio_file)
audio_data = audio_data / np.max(np.abs(audio_data))  # Normalize

# Calculate duration and limit to test duration if in test mode
duration = len(audio_data) / sample_rate
if test_mode:
    duration = min(duration, test_duration)  # Limit to test duration
    audio_data = audio_data[:int(test_duration * sample_rate)]

samples_per_frame = int(sample_rate / frame_rate)
frames = []
total_frames = len(audio_data) // samples_per_frame

# Create temporary directory for frames
os.makedirs("frames", exist_ok=True)

# Generate frames with waveform visualization
for i in tqdm(range(0, len(audio_data), samples_per_frame), desc="Generating frames"):
    plt.figure(figsize=(10, 3), dpi=100)
    plt.axis('off')
    
    chunk = audio_data[i:i + samples_per_frame]
    
    # Draw waveform with chunky effect
    for j, color in enumerate(colors):
        offset = j * chunk_size  # Offset each color layer
        plt.plot(np.arange(len(chunk)) + offset, chunk, color=color, lw=2)

    # Save frame image
    frame_path = f"frames/frame_{i // samples_per_frame:04d}.png"
    plt.savefig(frame_path, bbox_inches='tight', pad_inches=0)
    frames.append(frame_path)
    plt.close()

# Use ffmpeg to combine frames into a video with the audio file
ffmpeg_command = [
    "ffmpeg",
    "-y",
    "-framerate", str(frame_rate),
    "-i", "frames/frame_%04d.png",
    "-i", audio_file,
    "-c:v", "mpeg4",  # Use mpeg4 codec instead of libx264
    "-q:v", "5",  # Adjust quality (1 is highest, 31 is lowest)
    "-c:a", "aac",
    "-shortest",
    output_video
]

# Run ffmpeg command
try:
    subprocess.run(ffmpeg_command, check=True)
    print("Video created successfully:", output_video)
except subprocess.CalledProcessError as e:
    print("Error creating video:", e)

# Cleanup temporary frames
for frame_path in frames:
    os.remove(frame_path)
os.rmdir("frames")
