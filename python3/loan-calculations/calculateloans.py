# Loan details for each loan
loans = {
    # 'GreenState 5.99% (20% down)': {
    #     'loan_amount': 420000,
    #     'monthly_payment': 2515.41,
    #     'interest_rate': 5.99 / 100,
    # }, # disabled as it has points, I don't want that


    # "Fifth Third TBD"
    # "Chase TBD"
    'GreenState 6.125% (20% down)': {
        'loan_amount': 420000,
        'monthly_payment': 2551.96,
        'interest_rate': 6.125 / 100,
    },
    'HNB 6.00%': {
        'loan_amount': 420000,
        'monthly_payment': 2518.11,
        'interest_rate': 6.00 / 100,
    },
    'BMO 6.375': {
        'loan_amount': 420000,
        'monthly_payment': 2620.25,
        'interest_rate': 6.375 / 100,
    },
    "Rocketmortgage 6.625 30 year fixed with 0 points": {
        'loan_amount': 420000,
        'monthly_payment': 2689.31,
        'interest_rate': 6.625 / 100,
    },
}


# Function to calculate TIP and principal paid after 10 years
def calculate_loan_metrics(loan_amount, monthly_payment, annual_rate, loan_term_years=30, calc_years=10):
    months = loan_term_years * 12
    monthly_rate = annual_rate / 12
    total_interest = 0
    principal_paid = 0
    remaining_balance = loan_amount

    for month in range(1, months + 1):
        interest_payment = remaining_balance * monthly_rate
        principal_payment = monthly_payment - interest_payment
        total_interest += interest_payment
        principal_paid += principal_payment
        remaining_balance -= principal_payment

        if month == calc_years * 12:
            principal_paid_10yrs = principal_paid

    TIP = (total_interest / loan_amount) * 100
    return TIP, principal_paid_10yrs


# Calculate for each loan
loan_results = {}
for loan_name, loan_details in loans.items():
    TIP, principal_10yrs = calculate_loan_metrics(
        loan_details['loan_amount'],
        loan_details['monthly_payment'],
        loan_details['interest_rate']
    )
    loan_results[loan_name] = {'TIP': TIP, 'Principal Paid after 10 years': principal_10yrs}

from pprint import pprint

for item, value in loan_results.items():
    print(item)
    pprint(value)
    print()

# show the best loan
best_loan = min(loan_results, key=lambda x: loan_results[x]['TIP'])
print(f"The best loan is {best_loan} with a TIP of {loan_results[best_loan]['TIP']:.2f}%")
