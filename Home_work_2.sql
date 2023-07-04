CREATE TABLE sales (
    id INT PRIMARY KEY,
    quantity INT
);

INSERT INTO sales (id, quantity)
VALUES (1, 50),
       (2, 150),
       (3, 200),
       (4, 350),
       (5, 75),
       (6, 250),
       (7, 120);

SELECT * FROM mydatabase.sales;

SELECT
    quantity,
    IF(quantity < 100, 'Меньше 100',
       IF(quantity BETWEEN 100 AND 300, '100-300', 'Больше 300')) AS segment
FROM
    sales;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_status INT
);

INSERT INTO orders (order_id, order_status)
VALUES (1, 0),
       (2, 1),
       (3, 2),
       (4, 0),
       (5, NULL),
       (6, 1);
   
SELECT * FROM mydatabase.orders;
   
SELECT
    order_id, order_status,
    CASE
        WHEN order_status = 0 THEN 'Необработанный'
        WHEN order_status = 1 THEN 'В процессе'
        WHEN order_status = 2 THEN 'Завершенный'
        ELSE 'Неизвестный статус'
    END AS order_status_full
FROM
    orders;
    /*
Значение NULL:
	NULL представляет отсутствие значения или неопределенное значение в базе данных. 
  Это специальное значение, которое отличается от любого конкретного значения, включая 0. 
  NULL не является числом и не имеет никакого значения или типа данных. 
  Оно используется, когда значение отсутствует или неизвестно.
Значение 0:
	0, с другой стороны, является конкретным числовым значением. Оно представляет ноль как числовую величину. 
0 отличается от NULL, так как 0 имеет значение, а NULL представляет неопределенное значение или отсутствие значения.  
*/



    
    
