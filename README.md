# Jungle

A mini plant e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

In this project, I have learned about the features in Rails by fixing bugs and adding additional features.

  - Sold Out Badge: Display sold out badge when a quantity of a product goes to 0
  - Admin Categories: Admins are able to list and create new categories. Those new categories can then be used for adding new products.
  - User Authentication: Visitor can register a new account and/or login with existing account. As well, users can log out. 
  - Enhancement to Order Details Page: The order page renders to the buyer, the item, their name, description, quantities and line item totals. It also displays the email/user info that was used for the order purchase.
  Order cannot be placed if there is no current logged in user.
  - Missing Admin Security: Add restriction so that admin accessible page can only be accessed once admin username and password is inputted.
  - Checking Out with Empty Cart: Fix a bug where checking out with an empty cart wouldn't allow a purchase to go through. Rather a friendly message that the cart is empty and a link to the product page is displayed.
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. The username and password .env vars to access admin pages are "Jungle" and "book" respectively
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
