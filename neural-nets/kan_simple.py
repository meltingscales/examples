import numpy as np

# Define the KAN functions Φ (activation functions)
def phi_1(x):
    return np.sin(x)

def phi_2(x):
    return np.cos(x)

def phi_3(x):
    return np.tanh(x)

# Define the KAN
def KAN(x):
    n = len(x)
    result = 0
    for q in range(1, 2*n + 1):
        sum_phi = 0
        for p in range(n):
            sum_phi += phi_1(x[p]) + phi_2(x[p]) + phi_3(x[p])
        result += phi_1(q) * sum_phi
    return result

# Test the KAN with an example input
x = np.array([0.5, 1.0, -0.5])
output_kan = KAN(x)
print(f"Output of KAN: {output_kan}")
