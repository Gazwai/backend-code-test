# Checkout System Solution

## Overview

This solution refactors the checkout system to support dynamic discounts via a `DiscountDatabase`, improving maintainability and flexibility.

## Key Features

- **Dynamic Discounting**: Discounts like "Buy 3 Get 1 Free" are stored in `DiscountDatabase`, allowing easy updates and new discounts.
- **Custom Error Handling**: Raises for unlisted items to ensure robustness.
- **Single Responsibility Refactoring**: Applies Single Responsibility principle by abstracting discount logic into their own classes.

## Structure

- `checkout.rb`: Main class for scanning items and totaling with discounts.
- `discount_database.rb`: Manages discounts by item.
- Individual discount classes (e.g., `buy_three_get_one_free.rb`, `half_price.rb`).

## Usage

```ruby
prices = { apple: 10, banana: 20, mango: 30 }
discount_db = DiscountDatabase.new
discount_db.add_discount(:banana, HalfPrice.new)
checkout = Checkout.new(prices, discount_db)
checkout.scan(:banana)
checkout.total
```

## Testing

Run RSpec tests with:

```bash
bundle exec rspec
```
