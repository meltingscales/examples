import requests
import pandas as pd
import io

# Send a request to the API to get the CSV file
url = 'https://github.com/meltingscales/examples/raw/master/python3/excel-stuff/clean.csv'
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    # Convert the response content to a Pandas DataFrame
    csv_data = pd.read_csv(io.StringIO(response.content.decode('utf-8')))
    
    # Since there's only one CSV file, we don't need to combine multiple files
    dataset = csv_data  # Power BI will recognize this as the output dataset
else:
    raise Exception(f"Failed to download the CSV file. Status code: {response.status_code}")

print(dataset)
