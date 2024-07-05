--1--
create view Bank_view 
as
select Bank_ID,Bank_Name from Bank_Master
select * from Bank_view

--2
create view  Customer_View 
as 
select Cust_FullName,Cust_MobileNo,Cust_EmailID from Customer_Master
select * from Customer_View

--3--
create view complex_view
as
select
acc.ACC_NO,
acc.Cust_ID,
branch.Branch_Name,
bank.Bank_Name
from
 Account_Master as acc
 inner join Branch_Master as branch
 on acc.Branch_IFSC=branch.Branch_IFSC
 inner join Bank_Master as bank
 on branch.Bank_Id=bank.Bank_Id

 select * from complex_view

 --4--
create view Cust_view as select Cust_FullName,
Cust_City from Customer_Master 
where Cust_City='Rajkot' with check option

select * from Cust_view

--5--

--6--
create Synonym T_master for Transaction_Master
select * from T_master

--7

create view Tr_view 
as
select Tran_Id, Tran_Acc_No from Transaction_Master
where Tran_Type='Online'

select * from Tr_view

--8--  
create view Whole_view 
as
select * from Customer_Master
where Cust_City='Baroda' with check option
insert into Whole_view
values (411, 'C N Kanani', '1985-08-20', 'Milap Nagar, University Road', 2134567890, 'cnk@gmail.com', 'Baroda')


--11--
alter view Tr_view 
as
select Tran_Id, Tran_Acc_No,Tran_Amount from Transaction_Master
select * from Tr_view

--12
drop view Customer_View

