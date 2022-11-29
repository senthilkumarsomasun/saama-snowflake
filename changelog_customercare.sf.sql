--liquibase formatted CREATE CUSTOMERCARE TABLE
--changeset cust_data:1
create table customercare (
	cust_mdm int primary key,
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50) not null
)


--liquibase formatted sql