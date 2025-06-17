# ---Product & Customer Setup (prices as strings)
products = {
    101: {"name": "Pen", "price": "1.20"},
    102: {"name": "Notebook", "price": "2.75"},
    103: {"name": "Stapler", "price": "4.50"},
    104: {"name": "Desk Lamp", "price": "15.99"},
    105: {"name": "Paper", "price": "3.40"}
}

customers = {
    1: "Michael Scott",
    2: "Pam Beesly",
    3: "Jim Halpert",
    4: "Dwight Schrute",
    5: "Stanley Hudson"
}

# ---Simulated Orders (order_id, customer_id, product_id, quantity)
orders = [
    (1001, 1, 101, 10),
    (1002, 2, 102, 5),
    (1003, 3, 104, 2),
    (1004, 4, 103, 4),
    (1005, 5, 105, 8),
    (1006, 3, 105, 15)  # Large order
]

# --- Analysis Setup 
total_products_sold = 0
product_sales = {}
revenue_per_customer = {}
large_order_customers = set()

# ---Process Orders 
for order_id, cust_id, prod_id, qty in orders:
    product = products[prod_id]
    name = product["name"]
    
    # Convert price from string to float
    price = float(product["price"])

    # Apply 10% discount if price > 10
    if price > 10:
        price *= 0.9

    total = price * qty
    total_products_sold += qty

    # Track how many times each product was bought
    product_sales[name] = product_sales.get(name, 0) + qty

    # Track customer revenue
    revenue_per_customer[cust_id] = revenue_per_customer.get(cust_id, 0) + total

    # Identify large orders (> $100 or quantity > 10)
    if total > 100 or qty > 10:
        large_order_customers.add(customers[cust_id])

# ---Identify Most Popular Product 
most_popular = max(product_sales, key=product_sales.get)

# ---Prepare Summary Report 
report = {
    "total_products_sold": total_products_sold,
    "most_popular_product": most_popular,
    "revenue_per_customer": {
        customers[cid]: round(amt, 2)
        for cid, amt in revenue_per_customer.items()
    },
    "large_order_customers": list(large_order_customers)
}

# ---Print Summary Report 
print("Simple Sales Report")
print("=========================")
print(f"Total Products Sold: {report['total_products_sold']}")
print(f"Most Popular Product: {report['most_popular_product']}")
print("\n Revenue per Customer:")
for name, amount in report["revenue_per_customer"].items():
    print(f" - {name}: ${amount}")
print("\n Customers with Large Orders:")
for name in report["large_order_customers"]:
    print(f" - {name}")
