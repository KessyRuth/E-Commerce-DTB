USE Ecommerce;

-- Stores brand-related data
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL                
);

-- Classifies products into categories (e.g., Clothing, Electronics)
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(100) NOT NULL                   
);

-- Manages available color options for products
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(50) NOT NULL,               
    hex_code VARCHAR(7)                      
);

-- Groups sizes into categories (e.g., clothing sizes, shoe sizes)
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(100) NOT NULL                        
);

-- Lists specific size options (e.g., S, M, L, 42)
CREATE TABLE size_option (
    size_id INT AUTO_INCREMENT PRIMARY KEY,      
    size_category_id INT,                        
    label VARCHAR(20),                           
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Stores general product details
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(255) NOT NULL,                
    brand_id INT,                               
    category_id INT,                            
    base_price DECIMAL(10, 2),                  
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Stores product image URLs
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,  
    product_id INT,                          
    image_url VARCHAR(255),                   
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Links a product to its size and color variations
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY, 
    product_id INT,                               
    color_id INT,                                
    size_id INT,                                  
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

-- Represents purchasable items with variations
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,  
    variation_id INT,                        
    sku VARCHAR(100) UNIQUE,                 
    stock_quantity INT DEFAULT 0,            
    price DECIMAL(10, 2),                    
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- Groups attributes into categories (e.g., Physical, Technical)
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL                             
);

-- Defines the type of each attribute (e.g., text, number)
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(50) NOT NULL                          
);

-- Stores custom attributes for each product
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,        
    product_id INT,                                     
    attribute_category_id INT,                          
    attribute_type_id INT,                             
    name VARCHAR(100),                                  
    value TEXT,                                         
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- brand
INSERT INTO brand (name) VALUES 
('Nike'),
('Apple'),
('Samsung');

-- product_category
INSERT INTO product_category (name) VALUES 
('Clothing'),
('Electronics');

-- color
INSERT INTO color (name, hex_code) VALUES 
('Red', '#FF0000'),
('Black', '#000000'),
('White', '#FFFFFF');

-- size_category
INSERT INTO size_category (name) VALUES 
('Clothing Sizes'),
('Shoe Sizes');

-- size_option
INSERT INTO size_option (size_category_id, label) VALUES 
(1, 'S'),
(1, 'M'),
(1, 'L'),
(2, '42'),
(2, '43');

-- product
INSERT INTO product (name, brand_id, category_id, base_price) VALUES 
('T-Shirt', 1, 1, 25.00),
('iPhone 14', 2, 2, 999.00),
('Galaxy S22', 3, 2, 899.00);

-- product_image
INSERT INTO product_image (product_id, image_url) VALUES 
(1, 'https://example.com/images/tshirt-red.jpg'),
(2, 'https://example.com/images/iphone14.jpg'),
(3, 'https://example.com/images/galaxy-s22.jpg');

-- product_variation
INSERT INTO product_variation (product_id, color_id, size_id) VALUES 
(1, 1, 1),  -- Red, Small T-shirt
(1, 2, 2),  -- Black, Medium T-shirt
(2, 2, NULL),  -- Black iPhone (no size)
(3, 3, NULL);  -- White Galaxy (no size)

-- product_item
INSERT INTO product_item (variation_id, sku, stock_quantity, price) VALUES 
(1, 'TS-RED-S', 50, 25.00),
(2, 'TS-BLK-M', 30, 25.00),
(3, 'IP14-BLK', 20, 999.00),
(4, 'GS22-WHT', 15, 899.00);

-- attribute_category
INSERT INTO attribute_category (name) VALUES 
('Physical'),
('Technical');

-- attribute_type
INSERT INTO attribute_type (name) VALUES 
('Text'),
('Number'),
('Boolean');

-- product_attribute
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, name, value) VALUES 
(1, 1, 1, 'Material', 'Cotton'),
(2, 2, 1, 'Processor', 'A15 Bionic'),
(2, 2, 2, 'Battery Capacity (mAh)', '3279'),
(3, 2, 2, 'Battery Capacity (mAh)', '3700');