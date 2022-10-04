# from https://www.youtube.com/watch?v=DHSRaVeQxIk
# and https://github.com/clear-code-projects/Minecraft-in-Python
from ursina import *

app = Ursina()

test_square = Entity(model='circle', color=color.red)

app.run()