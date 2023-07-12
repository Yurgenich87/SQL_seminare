CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

CREATE VIEW cars_under_25000 AS
SELECT *
FROM cars
WHERE cost <= 25000;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW cars_under_25000 AS
SELECT *
FROM cars
WHERE cost <= 30000;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
CREATE VIEW skoda_audi_cars AS
SELECT *
FROM cars
WHERE name IN ('Skoda', 'Audi');

-- Получить ранжированный список автомобилей по цене в порядке возрастания
SELECT *,
       RANK() OVER (ORDER BY cost) AS price_rank
FROM cars;

-- Получить топ-3 самых дорогих автомобилей, а также их общую стоимость
SELECT *,
       SUM(cost) OVER () AS total_cost
FROM cars
ORDER BY cost DESC
LIMIT 3;

-- Получить список автомобилей, у которых цена больше предыдущей цены
SELECT c1.*
FROM cars c1
JOIN cars c2 ON c1.id = c2.id + 1
WHERE c1.cost > c2.cost;

-- Получить список автомобилей, у которых цена меньше следующей цены
SELECT c1.*
FROM cars c1
JOIN cars c2 ON c1.id = c2.id - 1
WHERE c1.cost < c2.cost;

-- Получить список автомобилей, отсортированный по возрастанию цены, и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля
SELECT c1.*,
       c1.cost - LEAD(c1.cost) OVER (ORDER BY c1.cost) AS price_difference
FROM cars c1
ORDER BY c1.cost;
