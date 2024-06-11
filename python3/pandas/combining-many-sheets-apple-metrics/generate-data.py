"""
This script generates 20 excel files with random data. Each excel file contains a list
of 4 farmers and the number of apples they have. 
The excel files are saved in the data folder.
"""

import pandas as pd
import numpy as np
import os
import shutil

# Remove the data folder if it exists
if(os.path.exists('data')):
    shutil.rmtree('data')

# Create the data folder
os.makedirs('data', exist_ok=True)

# Generate 20 excel files with random data
for i in range(0, 20):

    df = pd.DataFrame({
        # Create a list of 4 farmer names
        "Farmer name": ['John', 'Paul', 'George', 'Ringo'],

        # Create a list of 4 random apple counts between 0 and 1000
        'Apple count': np.random.randint(0, 1000, 4),
    })

    # Save the data to an excel file
    filepath='data/apples_week_{}.xlsx'.format(i+1)
    print("Saving to: ", filepath)
    df.to_excel(filepath, index=False)