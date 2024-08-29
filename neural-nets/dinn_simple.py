import numpy as np


# Define the dendritic processing functions (similar to Φ in KAN)
def dendrite_1(x):
    return np.sin(x) + np.square(x)


def dendrite_2(x):
    return np.cos(x) * np.tanh(x)


def dendrite_3(x):
    return np.log1p(np.abs(x)) + np.exp(-np.abs(x))


# Define the DINN
def DINN(x):
    # Simulate dendritic branches
    branch_1 = dendrite_1(x)
    branch_2 = dendrite_2(x)
    branch_3 = dendrite_3(x)

    # Sum of dendritic branches to simulate soma integration
    integration = np.sum(branch_1 + branch_2 + branch_3)

    # Output through a final non-linear layer
    output = np.tanh(integration)
    return output


# Test the DINN with the same input
x = np.array([0.5, 1.0, -0.5])
output_dinn = DINN(x)
print(f"Output of DINN: {output_dinn}")
