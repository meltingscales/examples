import numpy as np
import matplotlib.pyplot as plt
from tqdm import tqdm

# Parameters
r_min, r_max = 2.5, 4.0  # Range of r
a_min, a_max = -1.0, 1.0  # Range of a (additional parameter)
x0 = 0.5  # Initial condition
iterations = 1000  # Total iterations
discard = 200  # Discard transient iterations
resolution = 500  # Grid resolution

def compute_bifurcations(r_min, r_max, a_min, a_max, x0, resolution):
    r_values = np.linspace(r_min, r_max, resolution)
    a_values = np.linspace(a_min, a_max, resolution)
    x_values = []

    # Compute bifurcations for r and a with progress bar
    for a in tqdm(a_values, desc="Processing a_values"):
        for r in tqdm(r_values, desc="Processing r_values", leave=False):
            x = x0
            trajectory = []
            for i in range(iterations):
                # Modified logistic map with parameter 'a'
                x = r * x * (1 - x) + a * x**2
                if i >= discard:
                    trajectory.append((r, a, x))
            x_values.extend(trajectory)

    return x_values

# Compute bifurcations
x_values = compute_bifurcations(r_min, r_max, a_min, a_max, x0, resolution)

# Extract r, a, and x for plotting
r_vals, a_vals, x_vals = zip(*x_values)

# Create a scatter plot in 3D
fig = plt.figure(figsize=(10, 7))
ax = fig.add_subplot(projection='3d')
scatter = ax.scatter(r_vals, a_vals, x_vals, s=0.1, c=x_vals, cmap='viridis')
ax.set_xlabel("r (Growth Rate)")
ax.set_ylabel("a (Additional Parameter)")
ax.set_zlabel("x (Population)")
plt.title("Multi-Parameter Bifurcation Diagram")
plt.show()
