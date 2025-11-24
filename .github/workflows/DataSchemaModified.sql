CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id)
);

CREATE TABLE mixtures (
    mixture_id INT AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL UNIQUE,
    base_type VARCHAR(50) NOT NULL,
    form VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (mixture_id)
);

CREATE TABLE ingredients (
    ingredient_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    nutrient_type VARCHAR(50),
    unit VARCHAR(20),
    PRIMARY KEY (ingredient_id)
);

CREATE TABLE recipes (
    recipe_id INT AUTO_INCREMENT,
    mixture_id INT NOT NULL,
    instructions TEXT NOT NULL,
    dosage VARCHAR(100),
    PRIMARY KEY (recipe_id),
    FOREIGN KEY (mixture_id) REFERENCES mixtures(mixture_id)
);

CREATE TABLE mixture_ingredients (
    id INT AUTO_INCREMENT,
    mixture_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    amount DECIMAL(10,3) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (mixture_id) REFERENCES mixtures(mixture_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivery_address VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(20) NOT NULL,
    status VARCHAR(20) DEFAULT 'created',
    eta TIMESTAMP NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
