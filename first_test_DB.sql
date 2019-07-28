--[Udemy] Oracle SQL - Become A Certified SQL Developer From Scratch!
sqlplus / as sysdba
alter user hr identified by hr account unlock;

-- 3. Retrieving Data; 19 July 2019 -----------------------------------------------------
select first_name as "My $'* Name", last_name as "SurName", email from employees;
select first_name,last_name,salary*2 from employees;
select * from dual;
SELECT 'My name is Habib' FROM dual;
select q'[MY name is Omer]' my_name from dual;
SELECT distinct job_id, department_id, first_name FROM employees;
select 'My Name is '|| commission_pct, commission_pct from employees;
select 'My Name is '|| commission_pct "Column Habib" from employees;
select sysdate+4, from dual;
select employee_id, hire_date from employees;

--4. Restricting Data ; 20 July 2019 -------------------------------------------
--WHERE claus
Select first_name, last_name,job_id from Employees;
Select first_name, last_name,job_id,salary from Employees 
where
salary > 10000;
Select * from Employees 
where
job_id = 'IT_PROG';

--using comparison Operator
select * from employees where
hire_date < '01-JAN-05';

select * from employees where
manager_id = 100;

select * from employees where
manager_id <> 100;  -- = sign and <> are same

--Using Between .. And Operator
SELECT first_name, last_name, salary from employees
where salary between 12000 and 15000;
--Use of Between
SELECT * from employees
where hire_date between '07-JUN-02' and '01-MAr-03';

--v4. IN Operator; exact match not between..
select employee_id, first_name, last_name, salary, hire_date 
from employees
where employee_id IN (100,105,102,200);

select * from employees
where employee_id IN (50,100,105,102,210);

select * from employees
where first_name IN ('Steven','Peter','Adam');

select * from employees
where hire_date IN ('08-mar-08','30-jun-2',sysdate);

--v5. LIKE Operator.mp4 ; %,_ characters is used with LIKE Operator
-- -% means 0 or more charactors.
-- - _ means 1 charactor.
-- LIKE is Case sensitive 

select * from employees
where job_id = 'SA_REP';

SELECT * FROM employees
where job_id like 'SA_REP'; -- "LIKE" and "=" are same, but like is slower than = ; full name

SELECT first_name, last_name as "LAst" 
FROM employees
where first_name like 'A%';  --return value that's first name starts with "A"; Here must use LIKE not =

SELECT first_name, last_name as "LAst" 
FROM employees
where first_name like '_r%';  --return value that's first_name's second letter must be "r"

--v6. IS NULL Operator.mp4 ; used for searching NULL values; unknown,unavailable, but not inifnite or Zere(0) or space

select first_name as "First", last_name as "Last"
from employees
where manager_id = NULL;

select first_name as "First", last_name as "Last"
from employees
where manager_id is NULL;  -- no "=" sign!!  . . 

select * from employees where commission_pct = null;
select * from employees where commission_pct is null;

-- v7. Logical Operators (AND, OR, NOT); 
select * from employees where commission_pct is null 
and first_name like 'A%';
--use of OR
select first_name, last_name, salary, job_id
from employees where job_id = 'IT_PROG'
OR salary >= 5000;
--use of NOT
select * from employees
where job_id in ('SA_MAN','IT_PROG','ST_MAN');

select * from employees
where job_id NOT in ('SA_MAN','IT_PROG','ST_MAN');

select * from employees
where salary > 10000 
AND job_id NOT in ('SA_MAN','IT_PROG','ST_MAN');

--v8. Rules of Precedence.mp4; 
select first_name, last_name, salary, job_id
from employees where job_id = 'IT_PROG'
OR job_id = 'ST_CLERK' 
AND salary >= 5000;

select first_name, last_name, salary, job_id
from employees where (job_id = 'IT_PROG'
OR job_id = 'ST_CLERK') 
AND salary >= 5000;


-- 5. Sorting Data; 21 July 2019
--v1. ORDER BY Clause.mp4;
Select * from employees;
Select first_name, last_name from employees order by last_name;
Select first_name, last_name, Salary from employees order by salary;
-- v2. ASC and DESC Operators.mp4
Select first_name, last_name, Salary*12 as s from employees 
order by first_name asc, last_name desc, s;

select first_name, last_name, salary, commission_pct from employees 
order by commission_pct;  --NULL value is placed in the last

--v3. NULLS FIRST and NULLS LAST Operators.mp4;
select first_name, last_name, salary, commission_pct from employees 
order by commission_pct nulls first ;

select first_name, last_name, salary, commission_pct from employees 
order by commission_pct desc;

select first_name, last_name, salary, commission_pct from employees 
order by commission_pct asc nulls first;

select first_name, last_name, salary, commission_pct from employees 
order by 4 asc nulls last;

select * from employees 
order by 4 asc nulls last;

--6. Single-Row Functions; 22 July 2019
--v2. Character Functions (Part 1).mp4
select upper(first_name), lower(last_name), initcap(email) from employees;

select upper(first_name), lower(last_name), initcap(email),upper('My name is Habib') from employees
where job_id = 'IT_PROG';

select upper(first_name), lower(last_name), initcap(email),upper('My name is Habib') from employees
where upper(first_name) = 'VALLI';

--v3. Character Functions (Part 2).mp4
select first_name, last_name,substr(first_name,4,6), length(last_name) from employees;
select first_name || ' ' || last_name from employees;  -- no double quote ""
select first_name, instr(first_name, 'a') from employees;

select trim('    My name is   ') as a from dual; 
select ltrim('   My name is   ') as a from dual;
select rtrim('   My name is   ') as a from dual;

select first_name, replace(first_name,'a','-') as a  from employees;
select first_name,lpad(first_name,6,'*') from employees;
select first_name,lpad(first_name,15,'*') as "Left Padded",rpad('My name is Habib',25,'*') as "Right Padded"  from employees;

--v4. Number Functions.mp4
select round(12.1359) as Num from dual;
select round(12.1359,2) from dual;
select trunc(12.1359,2) from dual;
select ceil(12.1359) from dual;
select floor(12.1359) from dual;
select mod(12,5) from dual;  -- return remainder; Just like 12%5

-- v5. Nesting Functions.mp4
-- Result of the innest function will be the input of the outer function
select first_name, last_name,
lpad(upper(concat(first_name,last_name)),20,'*')
as nesting from employees;

select instr('Omer Dagasan', ' ') name from dual;
select substr('Habibur Rahman',instr('Habibur Rahman',' ')+1,
length('Habibur Rahman')) as name from dual; -- split the last part of a string!!

select substr(first_name || ' ' || last_name, instr(first_name || ' ' || last_name,' ')+1,
length(first_name || ' ' || last_name)) as name, first_name || ' ' || last_name from employees;

--v6. Date Functions;
select sysdate from dual;
select sysdate, add_months(sysdate,20) from dual;
select sysdate, add_months(sysdate,-2) from dual;

select sysdate, months_between(sysdate,add_months(sysdate,20)) from dual;
select sysdate, round(sysdate-10,'month') from dual;
select sysdate, trunc(sysdate,'month') from dual;
select sysdate, trunc(sysdate,'year') from dual;
select sysdate, trunc(sysdate,'day') from dual;
select sysdate, next_day(sysdate,'Tuesday') from dual;
select sysdate, last_day(sysdate) from dual; -- last day of month

-- v7. Date Operations;
select * from employees;
select sysdate from dual;
select employee_id, sysdate, hire_date, trunc((sysdate-hire_date)/365) 
as "Working Period" from employees;

-- 7. Conversion Functions; 24 July 2019 --------------------------------------------------
-- v1. Conversion Functions
select first_name, last_name, hire_date from
employees where hire_date = '21-Sep-05';
select * from employees where hire_date = '21-Sep-05';

--v2. TO_CHAR, TO_DATE, TO_NUMBER Functions (Part 1)
select first_name, last_name,
to_char(Hire_date,'dd YYyY Mm mon month year'),
to_char(sysdate,'dd YYyY MoNtH * hh-mi- ss') as "Today"
from employees where to_char(employee_id) = 100; --
-- month--> mm, mon, month
-- day --> dd,day,dy
-- minuite --> mi, m

select first_name,hire_date,
to_char(hire_date,'year - Year hh mi ss')
from employees;

select first_name,hire_date,
to_char(sysdate,'DD : hh12 : mi : ss * Month,mm'),
to_char(hire_date,'DD : hh12:mi:ss * ')
from employees;

-- v3. TO_CHAR, TO_DATE, TO_NUMBER Functions (Part 2).mp4
select first_name,
to_char(sysdate,'dd : hh12 : mi : ss * month,mm'),
to_char(sysdate,'ddth- mm')
from employees;

-- sp--> spelling of number
select to_char(sysdate,'DDsp:MM:YYYY  - ddspth ddth ddsp') as date_1 from dual;
select to_char(to_date('17-JUN-2003'),'DDsp:MM:YYYY  - ddspth ddth ddsp') as date_1 from dual;

select to_char(salary,'$99,999.99'),
salary from employees;

select salary*commission_pct,
to_char(salary*commission_pct,'$99,999.99') as formated_form,
to_char(salary*commission_pct,'$099,999.99') as formated_form
from employees
where commission_pct is not null;

-- To_number function
select first_name, last_name, 
to_char(hire_date,'ddspth Month YYYY') "Hire Date"
from employees
where hire_date > to_date('jun, 12,2005','Mon DD,YYYY');

-- v4. NVL, NVL2, NULLIF, COALESCE Functions.mp4
select job_id,first_name, last_name, 
NVL(commission_pct,0) as comm_pct,
commission_pct from employees
where job_id in('SA_REP','IT_PROG');

select salary,commission_pct, 
salary + salary*commission_pct as "C Salary"
from employees;

select salary,commission_pct, 
salary + salary*nvl(commission_pct,0) as "C Salary"
from employees;

-- nvl2: if Expression 1 is not NULL, then returns Expression2 else return E3
--      E2 and E3 must be same data type; char or number or date
select first_name, last_name,
nvl2(commission_pct,'has','has not' ) as COMM_PCT,
commission_pct from Employees
where job_id in('SA_REP','IT_PROG');

-- NULLIF(E1,E2): if E1=E2 return NULL; if E1 != E2 return E1;
select first_name, last_name, length(first_name) as "E1",
length(last_name) as "E2" from employees 
where NULLIF(length(first_name),length(last_name)) is null; -- if null is null

-- Coalesce(E1,E2,E3, . .. .Ex ): get me first unNull value; all E must same data type
select state_province,city, coalesce(state_province,city,'has not') from locations;

-- 8. Conditional Expressions; 25 July 2019 ----------------------------------------------------------------------=======++++++++++++++
-- v1. Conditional Expressions (CASE-DECODE).mp4
select first_name, last_name, hire_date, job_id, salary,
  case job_id when 'ST_MAN' then 1.20*salary
              when 'SH_MAN' then 1.30*salary
              When 'SA_MAN' then 1.40*salary
              else salary End "UPDAte_Salary"
from employees where job_id in ('ST_MAN','SH_MAN','SA_MAN');

select first_name, last_name, hire_date, job_id, salary,
  case job_id when 'ST_MAN' then 1.20*salary
              when 'SH_MAN' then 1.30*salary
              When 'SA_MAN' then 1.40*salary
              else 0 End "UPDAte_Salary"
from employees;
select * from employees where job_id in ('ST_MAN','SH_MAN','SA_MAN');

SELECT first_name, last_name, JOb_id, Salary From employees 
where
  (case
  when job_id='IT_PROG' and salary>5000 then 1
  when job_id = 'SA_MAN' and salary > 10000 then 1
  else 0 end ) = 1;

-- Decode function: used only in Oracle. column , 'value',Expression; as a pair.
SELECT first_name, last_name, hire_date, Job_id, Salary,
    decode(job_id, 'ST_MAN',1.20*salary,
                    'SH_MAN', 1.30*Salary,
                    'SA_MAN',1.40*salary,
                    salary) UPDate_Salary
from employees where job_id in ('ST_MAN','SH_MAN','SA_MAN');


SELECT first_name, last_name, hire_date, Job_id, Salary,
    decode(job_id,  'ST_MAN', 1.20*salary,
                    'SH_MAN', 1.30*Salary,
                    'SA_MAN', 1.40*salary
                    ) as UPDate_Salary
from employees;
-- 9. Group Functions; 26 July 2019;--------------------------------------------------------------------------------------------------------
---v1. Group Functions.mp4
-- avg,count,max,min,sum... .all grup function ignore NULL values by default.
-- v2. AVG Function.mp4
select avg(salary), avg(all salary), avg(distinct salary) from employees;
select avg(salary) as "AVG_salary", avg(all salary), avg(distinct salary) from employees
where job_id = 'IT_PROG';
select avg(salary) as "AVG_salary", avg(all salary), avg(distinct salary), salary from employees
where job_id = 'IT_PROG'; -- there is an error because group-function can use only with group function,(salary is error)

-- v3. COUNT Function.mp4
-- '*' repreasent all the rolls
select count(*), count(manager_id),count(all manager_id),count(distinct manager_id), count(job_id) from employees;

select count(*), count(commission_pct), count(distinct commission_pct),
count(distinct nvl(commission_pct,0)) from employees;

--v4. MAX Function.mp4;
select max(salary),max(hire_date),max(first_name) from employees;
select * from employees order by first_name,last_name;
--v5. MIN Function.mp4
select sum(salary), sum(all salary), sum(distinct salary) from employees;
--v7. Overview Of Group Functions.mp4
select sum(salary), avg(all salary), max(salary), max(hire_date) from employees;

-- 10. Grouping Data; 27 July 2019---------------------------------------------------------------------------------------------------------
--v1. GROUP BY Clause.mp4
select avg(salary) from employees
where job_id='IT_PROG';

select department_id, avg(salary) from employees group by department_id
order by avg(salary);

select job_id, avg(salary) from employees
group by job_id;

select distinct job_id from employees;

select job_id, department_id, avg(salary) from employees
group by department_id, job_id;

select job_id as job, department_id as department, manager_id, avg(salary) from employees
group by department_id, job_id,manager_id order by job;

select distinct job_id, department_id from employees order by job_id, department_id;

select department_id, avg(salary) from employees 
where job_id in ('ST_MAN','SH_CLEEK','ST_CLEEK')
group by job_id, department_id 
order by avg(salary);

select  avg(salary) from employees group by manager_id, job_id;

select count(distinct nvl2(manager_id,manager_id,0)) from employees;
select count(distinct nvl(manager_id,0)) from employees;

-- v2. HAVING Clause.mp4;
SELECT job_id, avg(salary) from employees -- it is not possible coz Where clause
where avg(salary) > 5000 group by job_id; -- donot use group by clause...

--best practice to use having clause after group by clause.
SELECT job_id, avg(salary) from employees 
group by job_id having avg(salary) > 5000; 

SELECT job_id, avg(salary) from employees 
where hire_date > '03-Jun-05'
group by job_id 
having avg(salary) > 5000; 

-- v3. Nesting Group Functions.mp4
select department_id, max(avg(salary)) from employees
group by department_id; -- Error coz nesting group function can not be used with group by

select max(avg(salary)) from employees
group by department_id;

-- 11. Joining Multiple Tables; 28 July 2019-----------------------------------------------------------------------
-- v2. Natural Joins.mp4
select * from employees;
select * from employees natural join departments;
select first_name, employees.last_name, departments.department_name from employees natural join departments; -- new things..!!
--v3. Join with USING Clause.mp4
select * from employees join departments using (department_id, manager_id); -- just as naturel join..
select * from employees join departments using ( manager_id); -- this is not like natural join. Here is Two Department_id !!
select * from employees join departments using ( department_id); -- this is not like natural join. two manager_id 
--v4. Handling Ambiguous Column Names.mp4
-- Aliases are used to temporarily rename a table name or a column name..
select first_name,last_name,department_name,manager_id from employees join departments using (department_id); -- Error. Coz ambiguous !!
select first_name,last_name,department_name from employees join departments using (department_id); -- here is go
 -- we use Table aliases are used for handling duplicate coulumn names in two tables.
 select e.first_name,last_name,department_name, d.manager_id from employees e join departments d using (department_id);
-- we can not give an alias to a column that is USING clause or NATURAL JOIN
select first_name, e.last_name, d.department_name from employees e natural join departments e; -- Erro !!

-- v 5. Join with ON Clause.mp4
-- we can join defferent name's column 
select l.first_name, l.last_name, d.manager_id, d.department_name 
from employees l join departments d
on (l.department_id = d.department_id
and l.manager_id = d.manager_id);
-- perform same task using USING clause..
select l.first_name, l.last_name, manager_id, d.department_name -- no aliases in manager_id
from employees l join departments d using (department_id,manager_id); 

select l.first_name, l.last_name, d.manager_id, d.department_name,d.location_id*10, l.salary 
from employees l join departments d
on (l.salary = d.location_id*10
and l.manager_id = d.manager_id);

-- v 6. Multiple Join Operations.mp4
select * from employees;
select * from departments;
select * from locations;

select first_name, last_name, d.department_name, l.city
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
on (l.location_id = d.location_id);

-- v 7. Restricting Joins.mp4
select first_name, last_name, d.department_name, l.city
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
on (l.location_id = d.location_id)
where d.department_id = 100;

select first_name, last_name, d.department_name, l.city
from employees e join departments d
on (e.department_id = d.department_id)
join locations l
on (l.location_id = d.location_id)
and e.job_id = 'IT_PROG';












select * from idd2h;





CREATE TABLE Employee1  
(  
EmployeeID number(10) primary key,  
FirstName varchar2(255),  
LastName varchar2(255),  
Email varchar2(255),  
AddressLine varchar2(255),  
City varchar2(255)
);   

INSERT INTO Employee1 VALUES( 41,'Habibur','Rahman','habib.hr95@gmail.com','Rampura','Dhaka' );
select * from employee1 order by EmployeeID asc; --  or DESC
DESC employee1;
drop table Employee1;

create table habib(
Name varchar2(30),
Roll varchar2(10) not null,
Mobile_no number(10,2),
primary key (Roll,Name) -- combination of roll and name must be unique. here is only one primary key.
);

insert into habib values('Habibul;kr Rahman', 'habib1',122);
insert into habib values('Habibur', 'habib2',122);
insert into habib values('Md. Habibur Rahman', 'habib3',122);
insert into habib values('Eng Rahman', 'habib4',122);
insert into habib values('Eng md Rahman', 'habib4',122);
drop table habib;
delete from habib where roll='habib3';
desc habib;

select * from habib;




