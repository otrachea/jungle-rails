# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Table of Contents  
[Setup](#setup)

[Troubleshooting](#troubleshooting)

[Dependencies](#dependencies)

[Testing Frameworks Used](#testing-frameworks-used)

[Final Product](#final-product)

[Features](#features)

[Known issues](#known-issues)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s` to start the server. (If you're running the server on vagrant run `bin/rails s -b 0.0.0.0`.)

## Troubleshooting

### Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

### Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios. For the date, put any future date and any three digits of CVC.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Testing Frameworks Used
- Rspec
- Cypress

## Final Product

![Home page](https://github.com/otrachea/jungle-rails/blob/main/docs/homepage.png)

# Features

## Browsing the Site
A logged in user or a guest can browse the website for plants and add products to their carts. Each product belongs to a category. The categories are in the navbar and clicking on a category will lead to a page that shows all products of said category. Clicking on any product will redirect the user to the product's respective info page.

![Evergreen products](https://github.com/otrachea/jungle-rails/blob/main/docs/evergreen-products.png)

![Product page example](https://github.com/otrachea/jungle-rails/blob/main/docs/product-show.png)

### Sold Out Badge
When a product is out of stock, the item cannot be added to cart. A style is added to make the item appear unclickable and a sold out badge is automatically added to the product listing.

![Example of soldout badge](https://github.com/otrachea/jungle-rails/blob/main/docs/sold-out-badge-home-page.png)

## Admin

### Dashboard
After logging in via basic http authentication, an admin can access the dashboard. It displays total number of catgories, total number of unique products and links to their respective admin pages. There is a table that shows how many products are in each category. The last table displays all products and infomration pertaining to each product.

![Admin dashboard](https://github.com/otrachea/jungle-rails/blob/main/docs/admin-dashboard.png)

### Categories
An admin can view a list of all categories and create new ones.

![Admin list of all categories](https://github.com/otrachea/jungle-rails/blob/main/docs/admin-category.png)

![Admin create new category](https://github.com/otrachea/jungle-rails/blob/main/docs/admin-new-category.png)

### Products
An admin can view a list of all products and create new ones.

![Admin list of all products](https://github.com/otrachea/jungle-rails/blob/main/docs/admin-products.png)

![Admin create new product](https://github.com/otrachea/jungle-rails/blob/main/docs/admin-new-product.png)

## Login & Signup
Users can signup for an account and then log into it. Upon successfully logging in, the navbar will show a message to greet the user and a logout button.

![Signup form](https://github.com/otrachea/jungle-rails/blob/main/docs/signup.png)

![Login form](https://github.com/otrachea/jungle-rails/blob/main/docs/login.png)

![The navbar when logged in](https://github.com/otrachea/jungle-rails/blob/main/docs/navbar-logged-in.png)

![The navbar when logged out](https://github.com/otrachea/jungle-rails/blob/main/docs/navbar-logged-out.png)

## Orders

### Making an Order
Only logged in users can access the cart page, even if the guest has items in their cart. If the cart is empty when the cart page is accessed, a will appear letting the user know they cannot checkout an empty cart. If the user is logged in and have items in their cart, they can click on the 'Pay with Card' button to complete payment via Stripe.

![Non-empty cart](https://github.com/otrachea/jungle-rails/blob/main/docs/cart.png)

![Empty cart](https://github.com/otrachea/jungle-rails/blob/main/docs/cart-empty.png)

![Stripe payment](https://github.com/otrachea/jungle-rails/blob/main/docs/cart-stripe.png)

### Order Details
After completing payment via Stripe, the order will go through and the user will be directed to a info page for their order. They can via the email used, the products they purchased and the total cost.

![Order details page](https://github.com/otrachea/jungle-rails/blob/main/docs/order-details.png)

## Known Issues
- When making an order, the email used for the order will be `kvirani@gmail.com` instead of the one associated with the loggged in user. This is due to having stripe only partly implemented.
- When an order is completed, the stock amount will not change.
