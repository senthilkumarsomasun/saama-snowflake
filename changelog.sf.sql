-- liquibase formatted sql changeLogId:e7ab2004-eca7-4265-b25b-43b79c25c588

--changeset cust_data:1
create table customer_abstract (
	cust_mdm int primary key,
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50) not null
)

--changeset cust_data:2
create table address (
	address_key int primary key,
	address1 varchar(25),
	address2 varchar(25),
	zip	varchar(25),
	state varchar(20) ,
	city varchar(25)
		
)

--changeset cust_data.dev:3
alter table customer_abstract add column primary_insured_status varchar(1)

--liquibase formatted sql