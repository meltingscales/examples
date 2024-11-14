import numpy as np
import matplotlib.pyplot as plt
from tqdm import tqdm

def plot_bifurcation_diagram(resolution=5000):
    # Parameters
    r_min, r_max = 2.5, 4  # Range of r values
    x0 = 0.5  # Initial condition
    iterations = 1000  # Total iterations
    discard = 200  # Discard initial transient iterations

    # Generate r values with specified resolution
    r_values = np.linspace(r_min, r_max, resolution)

    # Initialize arrays to store results
    x_values = []

    # Compute the bifurcation diagram with a progress bar
    for r in tqdm(r_values, desc="Computing bifurcation diagram"):
        x = x0
        trajectory = []
        for i in range(iterations):
            x = r * x * (1 - x)
            if i >= discard:
                trajectory.append(x)
        x_values.extend([(r, xi) for xi in trajectory])

    # Plot the bifurcation diagram
    x_vals, y_vals = zip(*x_values)
    plt.figure(figsize=(10, 6))
    plt.scatter(x_vals, y_vals, s=0.1, color='black')
    plt.title("Bifurcation Diagram of the Logistic Map")
    plt.xlabel("Control Parameter (r)")
    plt.ylabel("Population (x)")
    plt.grid(True)
    plt.show()

# Example usage
plot_bifurcation_diagram(resolution=5000)