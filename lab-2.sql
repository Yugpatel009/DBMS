--practical-2--
select emp.emp_no,emp.emp_FullName,br.Branch_Name from Employee_Master as emp
inner join Branch_Master as br on emp.Branch_IFSC=br.Branch_IFSC;

--2.2--
select acc.Acc_No,acc.Cust_Id,cust.Cust_FullName 
from Account_Master as acc 
inner join Customer_Master as cust 
on acc.Cust_Id=cust.Cust_Id 

--2.3-
	select Trc.Tran_Id ,Acc.Acc_No ,Acc.Acc_Type ,Trc.Tran_Amount from 
	Transaction_Master as Trc
	inner join
	Account_Master as Acc
	on Trc.Tran_Acc_No=Acc.Acc_No

	--2.4--
	
select Acc.Acc_No,Acc.Acc_Type,Trc.Tran_Acc_No,Trc.Tran_Amount
	from Transaction_Master as Trc
	left outer join Account_Master as Acc
	on Acc.Acc_Type=Trc.Tran_Type
	
	--2.5
	select Acc.Acc_No,Acc.Acc_Type,Trc.Tran_Acc_No,Trc.Tran_Amount
	from Transaction_Master as Trc
	right outer join Account_Master as Acc
	on Acc.Acc_Type=Trc.Tran_Type

	--2.6--
	select cust_FullName,Cust_MobileNo
	from Customer_Master where Cust_Id=
	(select Cust_Id from Account_Master where Acc_No=
	(select Acc_No from Account_Master where Acc_No=
	(select Tran_Acc_No from Transaction_Master where Tran_Amount=
	(select max(Tran_Amount)from Transaction_Master)))) 

	--2.7--
	select brm.Branch_Name,brm.Branch_IFSC,brm.Branch_Id,em.Emp_Salary
	from Branch_Master as brm
	inner join Employee_Master as em
	on brm.Branch_IFSC=em.Branch_IFSC
	--2.8-
	select Emp_Designation,COUNT(*) as total_Count from Employee_Master group by Emp_Designation

	--2.9--
	select Acc_Type, count(*) as Saving_Account from Account_Master 
	group by Acc_Type having Acc_Type='SB'

	--2.10--
	select * from Branch_Master order by Branch_Name desc