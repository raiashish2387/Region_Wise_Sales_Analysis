CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    region VARCHAR(50),
    sale_date DATE,
    quantity INT,
    revenue DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, product_name, category)
VALUES
    (1, 'Product A', 'Category 1'),
    (2, 'Product B', 'Category 1'),
    (3, 'Product C', 'Category 2'),
    (4, 'Product D', 'Category 3'),
    (5, 'Product E', 'Category 3');

INSERT INTO sales (sale_id, product_id, region, sale_date, quantity, revenue)
VALUES
    (1, 1, 'Region 1', '2023-01-01', 10, 100.00),
    (2, 2, 'Region 1', '2023-01-02', 5, 75.00),
    (3, 3, 'Region 2', '2023-01-02', 8, 120.00),
    (4, 4, 'Region 2', '2023-01-03', 12, 150.00),
    (5, 5, 'Region 1', '2023-01-03', 6, 90.00),
    (6, 1, 'Region 2', '2023-01-04', 15, 200.00),
    (7, 3, 'Region 1', '2023-01-04', 10, 150.00),
    (8, 2, 'Region 2', '2023-01-05', 7, 105.00),
    (9, 4, 'Region 1', '2023-01-05', 9, 135.00),
    (10, 5, 'Region 2', '2023-01-05', 3, 45.00);
