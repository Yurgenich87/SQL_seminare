Создание функции для форматирования секунд в дни, часы, минуты и секунды:

DELIMITER //
CREATE FUNCTION FormatSeconds(seconds INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;
    DECLARE result VARCHAR(255);

    SET days = seconds DIV 86400;
    SET seconds = seconds % 86400;
    SET hours = seconds DIV 3600;
    SET seconds = seconds % 3600;
    SET minutes = seconds DIV 60;
    SET remaining_seconds = seconds % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', remaining_seconds, ' seconds ');

    RETURN result;
END;
//
DELIMITER ;

Создание процедуры для вывода четных чисел от 1 до 10:

DELIMITER //
CREATE PROCEDURE PrintEvenNumbers()
BEGIN
    DECLARE i INT;
    SET i = 1;

    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            SELECT i;
        END IF;
        SET i = i + 1;
    END WHILE;
END;
//
DELIMITER ;
