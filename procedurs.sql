delimiter //
drop procedure if exists registry//
create procedure registry(in login VARCHAR(20), passwd VARCHAR(20), username VARCHAR(100), phone_number VARCHAR(15))
begin
	insert into users (login, passwd, phone, name) 
	values (login, passwd, phone_numer, username);
end//

drop procedure if exists login//
create procedure login (in login_ VARCHAR(20), passwd_ VARCHAR(20))
begin
	select id into @id_user from users where login = login_ and passwd = passwd_;
	if @id_user then
		select name into @name from users where id = @id_user;
	else signal sqlstate '45000' set message_text = 'Wrong login/password';
	end if;
end//

drop procedure if exists make_order//
create procedure make_order (in clinic INT, doctor INT, service INT, date_ DATE)
begin
	declare service_cost decimal(8,2) unsigned;
	declare user_name varchar(100);
	select name into user_name from users where id = @id_user;
	select price into service_cost from clinic_services cs where (clinic_id = clinic and service_id = service);
	if @id_user then
	insert into orders (clinic_id, doctor_id, service_id, user_id, user_name, service_date, cost) values
		(clinic, doctor, service, @id_user, user_name, date_, service_cost);
	end if;
end//
delimiter ;