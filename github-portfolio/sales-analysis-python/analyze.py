"""Simple sales analysis for a small online shop.

Reads sales.csv and prints a short business report:
total revenue, revenue by month, by category, and top products.
Uses only the Python standard library.
"""
import csv
from collections import defaultdict


def load_sales(path):
    with open(path, newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f))
    for r in rows:
        r["quantity"] = int(r["quantity"])
        r["price"] = float(r["price"])
        r["revenue"] = r["quantity"] * r["price"]
    return rows


def group_sum(rows, key):
    totals = defaultdict(float)
    for r in rows:
        totals[key(r)] += r["revenue"]
    return dict(totals)


def print_table(title, data, top=None):
    print(f"\n{title}")
    print("-" * len(title))
    items = sorted(data.items(), key=lambda x: x[1], reverse=True)
    if top:
        items = items[:top]
    for name, value in items:
        print(f"{name:<20} {value:>10.2f}")


def main():
    rows = load_sales("sales.csv")
    total = sum(r["revenue"] for r in rows)
    orders = len({r["order_id"] for r in rows})

    print("SALES REPORT")
    print("=" * 12)
    print(f"Total revenue:   {total:.2f}")
    print(f"Orders:          {orders}")
    print(f"Average order:   {total / orders:.2f}")

    by_month = group_sum(rows, lambda r: r["date"][:7])
    print("\nRevenue by month")
    print("----------------")
    for month in sorted(by_month):
        print(f"{month:<20} {by_month[month]:>10.2f}")

    print_table("Revenue by category", group_sum(rows, lambda r: r["category"]))
    print_table("Top 3 products", group_sum(rows, lambda r: r["product"]), top=3)


if __name__ == "__main__":
    main()
