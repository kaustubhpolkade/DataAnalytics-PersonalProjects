create database Bank;
use Bank;
create table Account_Type(
Account_no int not null primary key,
Type_Account varchar(50),
Manager_id int not null,
Department_name varchar(50),
Opening_Date date);
insert into Account_Type(account_no,type_account,manager_id,department_name,opening_date)
values(12345,'Saving',20,'Account','23-04-03'),
	  (67899,'loan',21,'Loan','24-05-04'),
	  (10112,'Saving',22,'HR','04-01-06'),
      (13145,'loan',23,'Admin','23-04-03'),
      (15167,'current',24,'Sales','24-05-04'),
	  (18190,'business',25,'Security','04-01-06'),
      (20210,'loan',26,'Account','23-04-03'),
      (22230,'Saving',27,'Loan','24-05-04'),
      (24250,'loan',28,'HR','04-01-06'),
      (26270,'current',29,'Admin','23-04-03'),
      (28290,'business',30,'Sales','24-05-04'),
      (30310,'current',31,'Security','04-01-06'),
      (32330,'Saving',32,'Account','23-04-03'),
	  (34350,'loan',33,'Loan','24-05-04'),
	  (36370,'current',34,'HR','04-01-06'),
      (38390,'current',35,'Admin','23-04-03'),
	  (40410,'business',36,'Sales','24-05-04'),
      (42430,'loan',37,'Security','04-01-06'),
      (44450,'Saving',38,'Account','23-04-03'),
      (46470,'loan',39,'Loan','24-05-04'),
	  (48490,'Saving',40,'HR','04-01-06');

 create table Department(
 Department_id int primary key not null,
 Department_name varchar(50),
 Manager_id int,
 Employee_id int,
 account_no int not null,
 foreign key (account_no ) references account_type(Account_no)on delete cascade);
 insert into Department(department_id,department_name,manager_id,employee_id,account_no)
 values(1,'Account',20,50,12345),
       (8,'Loan',21,51,67899),
       (11,'HR',22,52,10112),
       (16,'Admin',23,53,13145),
       (19,'Sales',24,54,15167),
       (21,'Security',25,55,18190);
       
create table Bank_Details(
Branch_code int primary key,
Address varchar (50),
Department_id int,
Branch_name varchar(50),
State varchar(50),
foreign key (department_id) references department (department_id) on delete cascade);
insert into bank_details(branch_code,address,department_id,branch_name,state)
values(100,'Nagpur',1,'ICIC_N','Maharashtra'),
      (101,'pune',1,'ICIC_P','Maharashtra'),
	  (102,'Mumbai',1,'ICIC_M','Maharashtra'),
      (103,'delhi',1,'ICIC_D','DEL'),
      (104,'Mumbai',1,'ICIC_M','Maharashtra'),
      (105,'delhi',1,'ICIC_D','DEL'),
      (106,'Nagpur',1,'ICIC_N','Maharashtra'),
      (107,'pune',8,'ICIC_P','Maharashtra'),
      (108,'Mumbai',8,'ICIC_M','Maharashtra'),
      (109,'Nagpur',8,'ICIC_N','Maharashtra'),
	  (110,'pune',11,'ICIC_P','Maharashtra'),
      (111,'Mumbai',11,'ICIC_M','Maharashtra'),
      (112,'delhi',11,'ICIC_D','DEL'),
      (113,'Nagpur',11,'ICIC_N','Maharashtra'),
      (114,'pune',11,'ICIC_P','Maharashtra'),
	  (115,'Mumbai',16,'ICIC_M','Maharashtra'),
      (116,'Nagpur',16,'ICIC_N','Maharashtra'),
      (117,'pune',16,'ICIC_P','Maharashtra'),
      (118,'Mumbai',19,'ICIC_M','Maharashtra'),
	  (119,'delhi',19,'ICIC_D','DEL'),
      (120,'Pune',21,'ICIC_P','Maharashtra');

create table Job_Details(
job_id varchar(50) primary key,
department_id int,
Branch_code int,
foreign key(department_id) references department(department_id)on delete cascade,
foreign key (Branch_code) references bank_details(Branch_code)on delete cascade); 
insert into job_details(job_id,department_id,Branch_code)
values('ST_CLERK',1,101),
      ('ST_MAN',8,108),
      ('FI_ACCOUNT',11,113),
      ('SA_REP',19,118);
      
create table Employees(
Employee_id int primary key not null,
First_name varchar(50),
Department_id int,
Manager_id int,
Job_id varchar (50),
Email varchar(50),
Hire_Date date,
Phone_no varchar(50), 
Salary int,
foreign key (department_id) references department (department_id) on delete cascade,
foreign key (job_id) references job_details(job_id)on delete cascade);
insert into employees(employee_id,first_name,department_id,manager_id,job_id,email,hire_date,phone_no,salary)
values(50,'Samuel',1,20,'ST_CLERK','SMCCAIN','23-11-07','650.505.1876',3800),
(51,'Allan',8,21,'ST_CLERK','SSEWALL','30-01-04','650.505.2876',3600),
(52,'Irene',11,22,'ST_CLERK','SSTILES','04-03-04','650.505.3876',2900),
(53,'Kevin',16,23,'ST_CLERK','STOBIAS','01-08-04','650.505.4876',2500),
(54,'Julia',19,24,'ST_CLERK','SVOLLMAN','10-03-05','650.501.1876',4000),
(55,'Donald',21,25,'ST_CLERK','TFOX','15-12-05','650.501.2876',3900),
(56,'Christopher',1,26,'ST_CLERK','TGATES','03-11-06','650.501.3876',3200),
(57,'TJ',8,27,'ST_MAN','TJOLSON','11-11-05','650.501.4876',2800),
(58,'Lisa',11,28,'ST_MAN','TRAJS','19-03-07','650.507.9811',3100),
(59,'Karen',16,29,'ST_MAN','VJONES','24-01-08','650.507.9822',3000),
(60,'Valli',19,30,'ST_MAN','VPATABAL','23-02-08','650.507.9833',2600),
(61,'Joshua',21,31,'ST_MAN','WGIETZ','01-05-03','650.507.9844',6400),
(62,'Randall',1,32,'FI_ACCOUNT','WSMITH','10-10-05','515.123.4444',6200),
(63,'Hazel',8,33,'FI_ACCOUNT','WTAYLOR','16-11-07','515.123.5555',11500),
(64,'Luis',11,34,'FI_ACCOUNT','JNAYER','16-07-05','603.123.6666',10000),
(65,'Trenna',16,35,'FI_ACCOUNT','JPATEL','28-09-06','515.123.7777',9600),
(66,'Den',19,36,'FI_ACCOUNT','JRUSSEL','14-01-07','515.123.8888',7400),
(67,'Michael',21,37,'SA_REP','JSEO','08-03-08','515.123.8080',7300),
(68,'John',1,38,'SA_REP','JTAYLOR','20-08-05','011.44.1346.329268',6100),
(69,'Nandita',8,39,'SA_REP','JWHALEN','30-10-05','011.44.1346.529268',11000),
(70,'Ismael',11,40,'SA_REP','KCHUNG','16-02-05','011.44.1346.52',8800);

create table Customer(
Account_No int primary key,
First_Name varchar(50), 
City varchar(50),
Branch_code int,
Employee_id int,
Phone_no varchar(50), 
ATM_NO int unique key,
Exp_date date,
Pin_No int unique key,
foreign key(branch_code) references bank_details(branch_code) on delete cascade,
foreign key(employee_id) references employees(employee_id) on delete cascade);
insert into customer(account_no,first_name,city,branch_code,employee_id,phone_no,atm_no,exp_date,pin_no)
values(12345,'Samuel','Nagpur',100,50,'650.505.1876',423705689,'23-04-06',5689),
(67899,'Allan','pune',101,51,'650.505.2876',423568971,'24-05-07',8971),
(10112,'Irene','Mumbai',102,52,'650.505.3876',423432253,'04-01-08',12253),
(13145,'Kevin','delhi',103,53,'650.505.4876',423295535,'24-01-06',15535),
(15167,'Julia','Mumbai',104,54,'650.501.1876',423158817,'23-02-06',18817),
(18190,'Donald','delhi',105,55,'650.501.2876',423022099,'21-06-07',22099),
(20210,'Christopher','Nagpur',106,56,'650.501.3876',422885381,'03-02-08',25381),
(22230,'TJ','pune',107,57,'650.501.4876',422748663,'27-01-04',28663),
(24250,'Lisa','Mumbai',108,58,'650.507.9811',422611945,'20-02-05',31945),
(26270,'Karen','Nagpur',109,59,'650.507.9822',422475227,'24-06-06',35227),
(28290,'Valli','pune',110,60,'650.507.9833',422338509,'07-02-07',38509),
(30310,'Joshua','Mumbai',111,61,'650.507.9844',422201791,'13-01-08',41791),
(32330,'Randall','delhi',112,62,'515.123.4444',422065073,'17-09-03',45073),
(34350,'Hazel','Nagpur',113,63,'515.123.5555',421928355,'17-02-04',48355),
(36370,'Luis','pune',114,64,'603.123.6666',421791637,'17-08-05',51637),
(38390,'Trenna','Mumbai',115,65,'515.123.7777',421654919,'07-06-02',54919),
(40410,'Den','Nagpur',116,66,'515.123.8888',421518201,'07-06-02',58201),
(42430,'Michael','pune',117,67,'515.123.8080',421381483,'07-06-02',61483),
(44450,'John','Mumbai',118,68,'011.44.1346.329268',421244765,'07-06-02',64765),
(46470,'Nandita','delhi',119,69,'011.44.1346.529268',421108047,'21-04-08',68047),
(48490,'Ismael','Pune',120,70,'011.44.1346.52',420971329,'11-03-05',71329);

select employees.employee_id,employees.first_name, bank_details.branch_name
from employees
join bank_details
on employees.department_id = bank_details.department_id
where employee_id = 52 and branch_name = 'icic_p';

select (count(employees.employee_id)),account_type.department_name,account_type.opening_date,bank_details.address
from bank_details
join employees
on bank_details.department_id = employees.department_id
join account_type
on employees.manager_id = account_type.manager_id
where department_name = 'loan'
group by account_type.department_name,account_type.opening_date,bank_details.address;

select bank_details.branch_code,bank_details.department_id,bank_details.address,customer.account_no,customer.city,department.department_name
from bank_details
inner join customer
on bank_details.branch_code = customer.branch_code
inner join department
on department.employee_id = customer.employee_id
where customer.account_no= 18190;

select job_details.job_id,job_details.department_id,department.department_name,employees.first_name
from job_details
inner join department
on job_details.department_id = department.department_id
inner join employees
on department.manager_id = employees.manager_id
where department.department_name in ('hr','loan','admin');

select bank_details.state,customer.account_no,account_type.type_account
from bank_details
inner join customer
on bank_details.branch_code = customer.branch_code
inner join account_type
on account_type.account_no = customer.account_no
where atm_no = 422748663;

create view details as
select bank_details.address,bank_details.branch_name,employees.first_name,employees.phone_no,department.department_name
from bank_details
join employees
on bank_details.department_id = employees.department_id
join department
on employees.department_id = department.department_id;

select * from details;

create view date as
select customer.city,account_type.department_name,account_type.opening_date
from customer
join account_type
on customer.account_no = account_type.account_no
where opening_date < '24-05-04';

 select * from date;

create view employeejob_detail as 
select * from employees 
where job_id in ('st_clerk','st_man','fi_account');

      select * from employeejob_detail;
      
      alter table customer 
      drop index atm_no;
      desc customer;
      
      update job_details
	  join customer
      on customer.branch_code = job_details.branch_code
      set customer.atm_no = 42321992
      where customer.atm_no =  423295535;
      alter table customer
      add unique(atm_no);
      desc customer;
      select * from customer;
      
      update job_details
      join department
      on department.department_id = job_details.department_id
      join account_type
      on department.department_name = account_type.department_name
      set account_type.department_name = 'admin', account_type.type_account = 'saving'
      where account_type.department_name = 'sales';
      
      SET SQL_SAFE_UPDATES = 0;
      