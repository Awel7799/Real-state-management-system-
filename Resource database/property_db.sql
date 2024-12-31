git create database property_db;
use property_db;

 
create table property(
propertyID int  auto_increment primary key,
proprety_price int not null,
property_address varchar(200) not null,
property_size int not null,
bedroom_number int not null,
bathroom_number int not null,
property_status varchar(60) not null,
property_image1 mediumblob not null,
property_image2 mediumblob not null,
property_image3 mediumblob,
proprerty_description varchar(200) not null);


create table property_accept(
propertyID int  auto_increment primary key,
proprety_price int not null,
property_address varchar(200) not null,
property_size int not null,
bedroom_number int not null,
bathroom_number int not null,
property_status varchar(60) not null,
property_image1 mediumblob not null,
property_image2 mediumblob not null,
property_image3 mediumblob,
proprerty_description varchar(200) not null)AUTO_INCREMENT=100;




create table Admin(adminId int auto_increment primary key,admin_username varchar(30) not null,admin_password varchar(30)not null);
insert into Admin(admin_username,admin_password) values('ephrem','abc');


delimiter //
create procedure del(in id int)
begin
	delete from property where propertyID=id;	
end //
delimiter ;
 
 
alter table admin add column verfication varchar(10);


create table feedback(
fullname varchar(50),
email varchar(30),
phone int,
sub varchar(30),
msg varchar(255));



delimiter //
create procedure storefeedback(
fullname varchar(50),
email varchar(30),
phone int,
sub varchar(30),
msg varchar(255))
begin
	insert into feedback(fullname,email,phone,sub,msg) values (fullname,email,phone,sub,msg);
end //
delimiter ;



delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Copy_pro`(
in ID int )
	begin
		INSERT INTO property(
		proprety_price, 
		property_address,
		property_size,
		bedroom_number,
		bathroom_number, 
		property_status,
		property_image1,
		property_image2,
		property_image3,
		proprerty_description) 
			SELECT 
				proprety_price,
				property_address, 
				property_size,
				bedroom_number, 
				bathroom_number, 
				property_status, 
				property_image1, 
				property_image2, 
				property_image3, 
				proprerty_description
					FROM 
						property_accept WHERE propertyID =ID ;
	end
delimiter ;
