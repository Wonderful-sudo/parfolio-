INSERT INTO customers VALUES
 (1,'Anna','Moscow','2025-01-01'),
 (2,'Ivan','Kazan','2025-01-10'),
 (3,'Maria','Samara','2025-02-03'),
 (4,'Oleg','Moscow','2025-02-15'),
 (5,'Elena','Omsk','2025-03-01');

INSERT INTO products VALUES
 (1,'USB Cable','Accessories',5.50),
 (2,'Wireless Mouse','Peripherals',18.00),
 (3,'Laptop Stand','Accessories',24.90),
 (4,'Mechanical Keyboard','Peripherals',59.00),
 (5,'Headphones','Audio',35.00);

INSERT INTO orders VALUES
 (1,1,'2025-01-05'),
 (2,2,'2025-01-12'),
 (3,1,'2025-02-02'),
 (4,3,'2025-02-14'),
 (5,4,'2025-03-03'),
 (6,2,'2025-03-18');

INSERT INTO order_items VALUES
 (1,1,3),(1,2,1),
 (2,3,2),
 (3,4,1),(3,1,5),
 (4,5,2),
 (5,4,1),(5,5,1),
 (6,3,1),(6,2,2);
