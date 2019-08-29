/* ���� 9. ������� 1. �������� �������� ������� hello(), ������� ����� ���������� �����������, � ����������� �� �������� ������� �����.
 *  � 6:00 �� 12:00 ������� ������ ���������� ����� "������ ����", � 12:00 �� 18:00 ������� ������ ���������� ����� "������ ����", 
 * � 18:00 �� 00:00 � "������ �����", � 00:00 �� 6:00 � "������ ����".
*/

Delimiter //
drop function if exists hello//
create function hello( X time)
returns varchar(255) 
begin
declare var text not deterministic;
	if time(x) between "06:00:00" and "11:59:00" then set var="������ ����";
	elseif time(x) between "12:00:00" and "17:59:00"  then set var= "������ ����";
	elseif time(X) between "18:00:00" and "23:59:00" then set var= "������ �����";
	else set var= "������ ����";
	return  var;	
	end if;
end//

select hello(now())//



/* ���� 9. ������� 2. � ������� products ���� ��� ��������� ����: name � ��������� ������ � description � ��� ���������. 
 * ��������� ����������� ����� ����� ��� ���� �� ���. ��������, ����� ��� ���� ��������� �������������� �������� NULL �����������. 
 * ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� ��� ���� ���� ���������. 
 * ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������..
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

