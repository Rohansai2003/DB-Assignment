-- Product Table
CREATE TABLE Product (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    category_id INT,
    inventory_id INT,
    price DECIMAL,
    discount_id INT,
    description TEXT,
    SKU TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Product Category Table
CREATE TABLE Product_Category (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Product Inventory Table
CREATE TABLE Product_Inventory (
    id SERIAL PRIMARY KEY,
    quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Discount Table
CREATE TABLE Discount (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    description TEXT,
    discount_percent DECIMAL,
    active BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Foreign key constraints
ALTER TABLE Product ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES Product_Category(id);
ALTER TABLE Product ADD CONSTRAINT fk_inventory FOREIGN KEY (inventory_id) REFERENCES Product_Inventory(id);
ALTER TABLE Product ADD CONSTRAINT fk_discount FOREIGN KEY (discount_id) REFERENCES Discount(id);
