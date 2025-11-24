-- DataSchema.sql (реляційна схема для теми "Фізіологія: їжа")
address VARCHAR(255) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,


CONSTRAINT pk_customers PRIMARY KEY (customer_id),
-- допустимий простий regex для перевірки email
CONSTRAINT chk_customers_email CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
-- телефон у форматі +380XXXXXXXXX або 0XXXXXXXXX або цифри з дефісами
CONSTRAINT chk_customers_phone CHECK (phone REGEXP '^((\\+\d{1,3})?[- ]?)?\d{7,15}$')
);


CREATE TABLE mixtures (
mixture_id INT AUTO_INCREMENT,
name VARCHAR(150) NOT NULL UNIQUE,
base_type VARCHAR(50) NOT NULL,
form VARCHAR(10) NOT NULL,
description TEXT,


CONSTRAINT pk_mixtures PRIMARY KEY (mixture_id)
);


CREATE TABLE ingredients (
ingredient_id INT AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
nutrient_type VARCHAR(50),
unit VARCHAR(20),


CONSTRAINT pk_ingredients PRIMARY KEY (ingredient_id)
);


CREATE TABLE recipes (
recipe_id INT AUTO_INCREMENT,
mixture_id INT NOT NULL,
instructions TEXT NOT NULL,
dosage VARCHAR(100),


CONSTRAINT pk_recipes PRIMARY KEY (recipe_id),
CONSTRAINT fk_recipes_mixture FOREIGN KEY (mixture_id) REFERENCES mixtures(mixture_id) ON DELETE CASCADE
);


CREATE TABLE mixture_ingredients (
id INT AUTO_INCREMENT,
mixture_id INT NOT NULL,
ingredient_id INT NOT NULL,
amount DECIMAL(10,3) NOT NULL,


CONSTRAINT pk_mixture_ingredients PRIMARY KEY (id),
CONSTRAINT fk_mixture_ings_mixture FOREIGN KEY (mixture_id) REFERENCES mixtures(mixture_id) ON DELETE CASCADE,
CONSTRAINT fk_mixture_ings_ingredient FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id) ON DELETE CASCADE
);


CREATE TABLE orders (
order_id INT AUTO_INCREMENT,
customer_id INT NOT NULL,
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
delivery_address VARCHAR(255) NOT NULL,
contact_phone VARCHAR(20) NOT NULL,
status VARCHAR(20) DEF
