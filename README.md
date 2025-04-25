# E-Commerce-DTB
# E-commerce Database Project

## Overview
This repository contains the schema for an e-commerce database, designed to manage the following components of an online store:

- Products (with variations such as color, size, and brand)
- Categories and attributes for products
- Product images and inventory management

The database is built using MySQL, and the structure allows for easy expansion to accommodate more complex e-commerce systems.

## Group Members
- **Kessy Akinyi** (Collaborator)
- **Group Name**: 781

## Tables Overview

The database includes the following tables:

1. **brand** - Stores brand-related data.
2. **product_category** - Classifies products into categories (e.g., clothing, electronics).
3. **color** - Manages available color options for products.
4. **size_category** - Groups sizes into categories (e.g., clothing sizes, shoe sizes).
5. **size_option** - Lists specific size options (e.g., S, M, L, 42).
6. **product** - Stores general product details such as name, brand, category, and price.
7. **product_image** - Stores image URLs for each product.
8. **product_variation** - Links products to their variations (e.g., size, color).
9. **product_item** - Represents purchasable items with variations (e.g., SKU, stock quantity).
10. **attribute_category** - Groups product attributes into categories (e.g., physical, technical).
11. **attribute_type** - Defines the types of product attributes (e.g., text, number, boolean).
12. **product_attribute** - Stores custom attributes for each product (e.g., material, weight).

## Database Setup

### Prerequisites
- MySQL 5.7 or higher
- A MySQL client (e.g., MySQL Workbench, phpMyAdmin, or command-line tools)

### Installation Instructions

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/ecommerce-db-project.git
   cd ecommerce-db-project
