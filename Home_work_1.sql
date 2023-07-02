SELECT * FROM mydatabase.mobile_phones;

SELECT name, manufacturer, price 
FROM mobile_phones 
WHERE quantity > 2;

SELECT *
FROM mobile_phones
WHERE manufacturer = 'Samsung';

SELECT *
FROM mobile_phones
WHERE name REGEXP '[Ii]phone';

SELECT *
FROM mobile_phones
WHERE
  name LIKE '%8%' OR
  manufacturer LIKE '%8%' OR
  price LIKE '%8%' OR
  quantity LIKE '%8%';





