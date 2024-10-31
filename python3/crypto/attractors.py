from collections import defaultdict
from functools import lru_cache


@lru_cache(maxsize=None)
def simple_hash(input_data):
    return sum(ord(char) for char in input_data) % 256


def generate_initial_hashes(num_inputs):
    return {f"input_{i}": simple_hash(f"input_{i}") for i in range(num_inputs)}


@lru_cache(maxsize=None)
def rehash_value(value):
    return simple_hash(value)


def rehash_and_track_collisions(num_inputs=1000, num_iterations=10000):
    hashes = generate_initial_hashes(num_inputs)
    collision_tracker = defaultdict(list)

    for iteration in range(1, num_iterations + 1):
        new_hashes = {}
        for key, value in hashes.items():
            new_hash = rehash_value(value)
            new_hashes[key] = new_hash
            collision_tracker[new_hash].append((key, iteration))

        hashes = new_hashes

        collisions = {h: ids for h, ids in collision_tracker.items() if len(ids) > 1}
        print(f"Iteration {iteration}: {len(collisions)} collisions")

        if len(collisions) == len(hashes):
            print("All hashes converged to a small set of outputs.")
            break

    return collision_tracker


# Run the test function
collision_data = rehash_and_track_collisions()