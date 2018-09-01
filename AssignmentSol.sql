
create table instructors 
(
Instractor_id int identity primary key ,
fname varchar(20) not null ,
lname varchar(20) , 
BD datetime ,
overtime int unique,
salary int default 3000,
hiredate date default getdate() ,
address varchar(50) ,
Netsalary as (isnull(salary,0)+isnull(overtime,0)) ,
Age as (getdate()-BD),
constraint c1 check(address in ('cairo' , 'alex')),
constraint c2 check(salary between 1000 and 5000),
)

create table courses
(
ID int identity primary key ,
cname varchar(30) , 
duration int unique 
)

create table teach 
(
ID int identity ,
Instractor_id int identity ,
constraint pk primary key(ID,Instractor_id),
constraint fk1 foreign key(ID) references courses(ID) on delete cascade on update cascade ,
constraint fk2 foreign key(Instractor_id) references instructors(Instractor_id) on delete cascade on update cascade
)

create table lab 
(
L_id int identity ,
ID int identity , 
location varchar(40) ,
capacity int ,
constraint k1 primary key(L_id , ID) , 
constraint k2 foreign key(ID) references courses(ID) on delete cascade on update cascade , 
constraint k3 check(capacity <20)
)



ramy_is@hotmail.com