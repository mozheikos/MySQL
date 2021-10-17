delimiter //
drop trigger if exists skill_calculator//
create trigger skill_calculator before insert on doctors
for each row
begin 
	if new.age like '__' then 
	set new.age = year(adddate(curdate(), -(new.age * 365.25)));
	end if;
end//

drop trigger if exists skill_calculator_update//
create trigger skill_calculator_update before update on doctors
for each row
begin 
	if new.age like '__' then 
	set new.age = year(adddate(curdate(), -(new.age * 365.25)));
	end if;
end//

drop trigger if exists order_login//
create trigger order_login before insert on orders
for each row 
begin 
	if not @id_user then
		signal sqlstate '45000' set message_text = 'You need to login first';
	end if;
end//

drop trigger if exists order_login_update//
create trigger order_login_update before insert on orders
for each row 
begin 
	if not @id_user then
		signal sqlstate '45000' set message_text = 'You need to login first';
	end if;
end//

delimiter ;