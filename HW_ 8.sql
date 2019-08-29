/* Урок 9. Задание 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
 *  С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
 * с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

Delimiter //
drop function if exists hello//
create function hello( X time)
returns varchar(255) 
begin
declare var text not deterministic;
	if time(x) between "06:00:00" and "11:59:00" then set var="Доброе утро";
	elseif time(x) between "12:00:00" and "17:59:00"  then set var= "Добрый день";
	elseif time(X) between "18:00:00" and "23:59:00" then set var= "Добрый вечер";
	else set var= "Доброй ночи";
	return  var;	
	end if;
end//

select hello(now())//



/* Урок 9. Задание 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 * Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
 * Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
 * При попытке присвоить полям NULL-значение необходимо отменить операцию..
*/


Delimiter //
drop trigger if exists checklastcatalogs//
CREATE TRIGGER checklastcatalogs BEFORE INSERT ON products
FOR EACH ROW BEGIN
IF name is null or description is null THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled'; 
END IF;
END //


INSERT INTO products (name, description )
VALUEs(null, null)//



-- some comments

