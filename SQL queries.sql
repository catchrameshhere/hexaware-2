/*create a database*/
create database xyz


use xyz

/* table creation */
create table [emp](first_name varchar(50), last_name varchar(50), mobile_number int, email varchar(20))

/*Drop the table*/
drop table user1

/*drop the database*/
drop database xyz



/**alter command**/
/*add the new column*/
alter table emp add location varchar(50)

/*modifying the existing data type*/
alter table emp alter column mobile_number varchar(50)

/*drop the coloumn*/
alter table emp drop column first_name



/** insert data to the table**/
insert into emp values('michelle', 'obama', 123456, 'michelle@gmail.com')

insert into emp(first_name, last_name, mobile_number) values('john', 'rambo', 55566645)
insert into emp(last_name, mobile_number, first_name) values('Hindustani', 89569, 'Raja')

/**update the existing record**/
update emp set email='john@gmail.com' where first_name = 'john'
update emp set email='john@gmail.com'


/**delete **/
delete from emp where first_name = 'Raja'
delete from emp


/** truncate **/
truncate table emp;

/** Foreign key**/
create table t1(id int primary key, name varchar(200))
create table t11(id int, name varchar(200), primary key (id))
create table t2(id int foreign key references t1(id), email varchar(10))
create table t3(test_id int, email varchar(10),  foreign key (test_id) references t1(id))

/**Select queries**/

use training

select 1, 2, 3

select 1 as first, 2 as second, 3 as third

select * from employees

select * from dbo.employees

select * from [dbo].employees

select * from dbo.[employees]

select * from [dbo].[employees]


select first_name from employees

select employee_id, first_name, last_name from employees

select employee_id as [EMPLOYEEE ID], first_name as FirstName, last_name as LastName from employees









