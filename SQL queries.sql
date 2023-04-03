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

/* odering the data */
select * from employees order by first_name /* ascending order, if order is not specified*/
select * from employees order by first_name asc /*ascending order*/
select * from employees order by first_name desc /*descending order*/
select * from employees order by salary, first_name, last_name asc
select * from employees order by hire_date
select * from employees order by hire_date desc

/* distinct */
select distinct salary from employees order by salary desc
select distinct first_name, last_name, salary from employees order by salary desc

/* limiting the rows display*/
select top 5 * from employees
select top 5 first_name, salary from employees

select * from employees order by employee_id  offset 3 rows


/*where*/
select first_name, last_name from employees where first_name = 'Lex'
select first_name, last_name, department_id from employees where department_id = '6'

/*or*/
select first_name, last_name, department_id from employees where department_id = '6' or department_id = '9'


 /*and*/
select * from employees where first_name = 'john' and last_name='chen'

/*between*/
select salary from employees
select salary from employees where salary between 5000 and 10000
select distinct salary from employees where salary between 5000 and 10000

/*not between*/
select distinct salary from employees where salary not between 5000 and 10000

/*in*/
select * from employees where department_id in (9, 6, 10)

/*regular expression ==> like */
select * from employees
select * from employees where first_name like 'd%' /*starting with*/
select * from employees where first_name like '%n' /*ending with*/
select * from employees where first_name like '%an%' /*in between*/
select * from employees where first_name like 'D_%'
select * from employees where first_name like '_an%'
select * from employees where first_name like '__an%'
select * from employees where first_name like '___an%'
select * from employees where first_name like 's%n'

/*null*/
select * from employees where phone_number is NULL
select * from employees where phone_number is null
select * from employees where phone_number is not NULL

/*functions*/
select * from employees
select max(salary) from employees
select min(salary) from employees
select avg(salary) from employees

select max(salary) from employees where department_id = 6
select min(salary) from employees where department_id = 6
select avg(salary) from employees where department_id = 6


select * from employees
select count(*) from employees
select count(phone_number) from employees

/*group by*/
select * from employees
select distinct  job_id, count(job_id) from employees group by job_id
select job_id, count(job_id) from employees group by job_id

select department_id, count(*) from employees group by department_id
select department_id, max(salary) from employees group by department_id
select department_id, avg(salary) from employees group by department_id


/*sub queries*/
select distinct salary from employees order by salary desc

select max(salary) from employees where salary < (select max(salary) from employees)

/*select max(salary) from employees offset 2 rows*/


select max(salary) from employees where salary <
(select max(salary) from employees where salary < (select max(salary) from employees))

/*nth max salary Assignment */
/*select salary from employees order by salary desc where rownumber = 5*/


/*joins*/
select * from fruits
select * from baskets


/* left join */
select fruits.fruit_name, baskets.basket_name
from fruits left join baskets
on fruits.basket_id = baskets.basket_id

/*right join*/
select fruits.fruit_name, baskets.basket_name
from fruits right join baskets
on fruits.basket_id = baskets.basket_id

/*inner join*/
select fruits.fruit_name, baskets.basket_name
from fruits inner join baskets
on fruits.basket_id = baskets.basket_id

select fruits.fruit_name, baskets.basket_name
from fruits join baskets
on fruits.basket_id = baskets.basket_id


/*full outer join*/
select fruits.fruit_name, baskets.basket_name
from fruits full outer join baskets
on fruits.basket_id = baskets.basket_id


/*self join*/
select * from employees
/* self join using join */
select e.first_name, e.last_name, m.first_name
from employees e join employees m
on e.manager_id = m.employee_id

/* self join using inner join */
select e.first_name, e.last_name, m.first_name
from employees e inner join employees m
on e.manager_id = m.employee_id

/* self join using left join */
select e.first_name, e.last_name, m.first_name
from employees e left join employees m
on e.manager_id = m.employee_id