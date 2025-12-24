#!/usr/bin/env python3
"""
Generate synthetic Steam game sales data for analysis.

This script reads game_sales_data.csv and creates transaction-level sales data
using the actual game names and publishers as foreign keys for relational analysis.
"""

import random
from datetime import datetime, timedelta
from collections import defaultdict
import pandas as pd


def load_games_from_csv(filename='game_sales_data.csv'):
    """
    Load games and publishers from the existing CSV file.

    Returns:
        dict: Publisher -> [(game_name, estimated_price), ...]
    """
    # Try different encodings
    for encoding in ['utf-8', 'latin-1', 'iso-8859-1', 'cp1252']:
        try:
            df = pd.read_csv(filename, encoding=encoding)
            print(f"Successfully loaded CSV with {encoding} encoding")
            break
        except UnicodeDecodeError:
            continue
    else:
        raise ValueError("Could not read CSV with any supported encoding")

    publisher_games = defaultdict(list)

    for _, row in df.iterrows():
        game_name = row['Name']
        publisher = row['Publisher']
        platform = row['Platform']
        year = int(row['Year']) if pd.notna(row['Year']) else 2020

        # Estimate price based on platform and year
        # Newer games are more expensive, older games are cheaper
        age = 2024 - year

        if platform in ['PC', 'PS4', 'PS5', 'XOne', 'XSX', 'NS']:
            # Modern platforms
            if age <= 1:
                base_price = random.uniform(49.99, 69.99)
            elif age <= 3:
                base_price = random.uniform(29.99, 59.99)
            elif age <= 5:
                base_price = random.uniform(19.99, 39.99)
            else:
                base_price = random.uniform(9.99, 29.99)
        else:
            # Older platforms or retro games
            base_price = random.uniform(4.99, 19.99)

        # Some popular games are free-to-play
        if game_name in ['Fortnite', 'Apex Legends', 'Dota 2', 'Team Fortress 2',
                       'Counter-Strike: Source', 'Garry\'s Mod']:
            base_price = 0.00

        publisher_games[publisher].append((game_name, base_price))

    return dict(publisher_games)


def generate_sales_data(output_file='synthetic_steam_sales.csv', num_transactions=10000):
    """
    Generate synthetic game sales transactions using actual games from the dataset.

    Args:
        output_file: Path to output CSV file
        num_transactions: Number of sale transactions to generate
    """
    print("Loading games from game_sales_data.csv...")
    publisher_games = load_games_from_csv()

    print(f"Loaded {len(publisher_games)} publishers with "
          f"{sum(len(games) for games in publisher_games.values())} games")

    # Date range: 2 years of sales data (2022-2023)
    start_date = datetime(2022, 1, 1)
    end_date = datetime(2023, 12, 31)
    date_range = (end_date - start_date).days

    # Create weighted publisher selection based on number of popular games
    publishers = list(publisher_games.keys())

    # Weight publishers by their game count (more games = more likely to be selected)
    weights = [len(games) for games in publisher_games.values()]

    # Boost certain major publishers
    publisher_boost = {
        'Nintendo': 2.5,
        'Activision': 2.0,
        'Electronic Arts': 2.0,
        'Rockstar Games': 2.2,
        'Valve': 2.0,
        'Sony Interactive Entertainment': 1.8,
        'Ubisoft': 1.8,
        'Blizzard Entertainment': 1.5,
    }

    weights = [
        weights[i] * publisher_boost.get(publishers[i], 1.0)
        for i in range(len(publishers))
    ]

    # Generate transactions
    transactions = []

    for _ in range(num_transactions):
        # Select publisher and game
        publisher = random.choices(publishers, weights=weights)[0]

        if not publisher_games[publisher]:
            continue

        game_name, base_price = random.choice(publisher_games[publisher])

        # Generate sale date
        random_days = random.randint(0, date_range)
        sale_date = start_date + timedelta(days=random_days)

        # Apply random discount (0-75% off)
        # More likely to have smaller discounts or no discount
        discount_percent = random.choices(
            [0, 10, 15, 20, 25, 30, 40, 50, 75],
            weights=[35, 12, 10, 15, 10, 8, 6, 3, 1]
        )[0]

        sale_price = base_price * (1 - discount_percent / 100)

        # Random quantity (usually 1, sometimes more for gifts)
        quantity = random.choices([1, 2, 3, 4, 5], weights=[88, 7, 3, 1, 1])[0]

        total_revenue = sale_price * quantity

        # Add some seasonality - LOTS more sales during holidays
        month = sale_date.month

        # Black Friday / Cyber Monday / Holiday season (November-December)
        if month in [11, 12]:
            # Add 2-3 extra transactions for popular games
            if random.random() < 0.4:
                for _ in range(random.randint(1, 2)):
                    extra_discount = random.choices(
                        [25, 30, 40, 50, 75],
                        weights=[15, 20, 30, 25, 10]
                    )[0]
                    extra_price = base_price * (1 - extra_discount / 100)
                    extra_quantity = random.choices([1, 2, 3, 4], weights=[70, 15, 10, 5])[0]
                    extra_revenue = extra_price * extra_quantity

                    transactions.append({
                        'transaction_id': f'TXN{len(transactions):07d}',
                        'date': sale_date.strftime('%Y-%m-%d'),
                        'year': sale_date.year,
                        'month': sale_date.month,
                        'publisher': publisher,
                        'game_name': game_name,  # This is the FK to game_sales_data.csv
                        'base_price': f'{base_price:.2f}',
                        'discount_percent': extra_discount,
                        'sale_price': f'{extra_price:.2f}',
                        'quantity': extra_quantity,
                        'total_revenue': f'{extra_revenue:.2f}',
                    })

        # Summer sale (June-July)
        if month in [6, 7]:
            if random.random() < 0.25:
                extra_discount = random.choices([20, 30, 40, 50], weights=[20, 30, 30, 20])[0]
                extra_price = base_price * (1 - extra_discount / 100)
                extra_quantity = random.choices([1, 2, 3], weights=[80, 15, 5])[0]
                extra_revenue = extra_price * extra_quantity

                transactions.append({
                    'transaction_id': f'TXN{len(transactions):07d}',
                    'date': sale_date.strftime('%Y-%m-%d'),
                    'year': sale_date.year,
                    'month': sale_date.month,
                    'publisher': publisher,
                    'game_name': game_name,
                    'base_price': f'{base_price:.2f}',
                    'discount_percent': extra_discount,
                    'sale_price': f'{extra_price:.2f}',
                    'quantity': extra_quantity,
                    'total_revenue': f'{extra_revenue:.2f}',
                })

        # Add the main transaction
        transactions.append({
            'transaction_id': f'TXN{len(transactions):07d}',
            'date': sale_date.strftime('%Y-%m-%d'),
            'year': sale_date.year,
            'month': sale_date.month,
            'publisher': publisher,
            'game_name': game_name,  # This is the FK to game_sales_data.csv (Name column)
            'base_price': f'{base_price:.2f}',
            'discount_percent': discount_percent,
            'sale_price': f'{sale_price:.2f}',
            'quantity': quantity,
            'total_revenue': f'{total_revenue:.2f}',
        })

    # Convert to DataFrame for easier manipulation
    df_transactions = pd.DataFrame(transactions)

    # Sort by date, then by transaction_id
    df_transactions = df_transactions.sort_values(['date', 'transaction_id'])

    # Re-number transaction IDs after sorting
    df_transactions['transaction_id'] = [f'TXN{i:07d}' for i in range(len(df_transactions))]

    # Reorder columns
    column_order = [
        'transaction_id', 'date', 'year', 'month', 'publisher',
        'game_name', 'base_price', 'discount_percent', 'sale_price',
        'quantity', 'total_revenue'
    ]
    df_transactions = df_transactions[column_order]

    # Write to CSV
    df_transactions.to_csv(output_file, index=False, encoding='utf-8')

    # Calculate some summary statistics using pandas
    # Convert numeric columns from strings to proper types
    df_transactions['quantity'] = df_transactions['quantity'].astype(int)
    df_transactions['total_revenue'] = df_transactions['total_revenue'].astype(float)

    total_revenue = df_transactions['total_revenue'].sum()

    # Group by publisher
    publisher_stats = df_transactions.groupby('publisher').agg({
        'quantity': 'sum',
        'total_revenue': 'sum'
    }).reset_index()

    top_sales_publishers = publisher_stats.nlargest(5, 'quantity')[['publisher', 'quantity']].values.tolist()
    top_revenue_publishers = publisher_stats.nlargest(5, 'total_revenue')[['publisher', 'total_revenue']].values.tolist()

    print(f"\n{'='*60}")
    print(f"Generated {len(df_transactions):,} transactions in {output_file}")
    print(f"{'='*60}")
    print(f"\nData summary:")
    print(f"  Date range: {start_date.strftime('%Y-%m-%d')} to {end_date.strftime('%Y-%m-%d')}")
    print(f"  Total revenue: ${total_revenue:,.2f}")
    print(f"  Publishers: {len(publisher_games)}")
    print(f"  Unique games: {sum(len(games) for games in publisher_games.values())}")

    print(f"\nTop 5 publishers by sales volume:")
    for i, [pub, sales] in enumerate(top_sales_publishers, 1):
        print(f"  {i}. {pub}: {int(sales):,} units")

    print(f"\nTop 5 publishers by revenue:")
    for i, [pub, revenue] in enumerate(top_revenue_publishers, 1):
        print(f"  {i}. {pub}: ${revenue:,.2f}")

    print(f"\n{'='*60}")
    print("Homework questions you can now answer:")
    print("  1. What publisher made the most sales?")
    print("  2. What publisher made the most money?")
    print("  3. What publisher made the most money in the shortest 1-month period?")
    print("     When was it?")
    print(f"{'='*60}")
    print(f"\nNote: game_name column links to Name column in game_sales_data.csv")


if __name__ == '__main__':
    # Generate the data
    generate_sales_data('synthetic_steam_sales.csv', num_transactions=10000)
