# python3 -m virtualenv ./venv
# source ./venv/bin/activate
# pip install -r requirements.txt

from djitellopy import Tello
import time

tello = Tello()

tello.connect()

# Check battery level
print(f"Battery: {tello.get_battery()}%")

tello.takeoff()

time.sleep(8)  # Give the drone more time to stabilize after takeoff

tello.move_left(100)
tello.rotate_counter_clockwise(90)
tello.move_forward(100)

tello.land()