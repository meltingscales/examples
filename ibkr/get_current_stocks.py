from ib_insync import IB
import json

# Initialize IBKR connection
ib = IB()
ib.connect('127.0.0.1', 7497, clientId=1)  # Ensure your TWS or IB Gateway is running

# Fetch portfolio positions
positions = ib.positions()

# Prepare the data for JSON output
portfolio_data = []

for position in positions:
    contract = position.contract
    position_data = {
        'symbol': contract.symbol,
        'position_size': position.position,
        'market_price': round(position.marketPrice, 2),
        'average_cost': round(position.avgCost, 2),
        'unrealized_pnl': round(position.unrealizedPNL, 2)
    }
    portfolio_data.append(position_data)

# Convert the data to JSON
portfolio_json = json.dumps(portfolio_data, indent=4)

# Print or return the JSON data
print(portfolio_json)

# Disconnect after fetching data
ib.disconnect()
