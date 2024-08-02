--1--
create trigger Bank_master_insert
on Bank_Master
for insert
as
begin
print'new record insert';
end

insert into Bank_Master values(107,'my bank',' myk')

--2--
create trigger Bank_master_update
on Bank_Master
for update
as
begin
print'new record update';
end

update Bank_Master 
set Bank_Name='Bank of india'
where Bank_id=107

select * from Bank_master
--3--
create trigger Bank_master_delete
on Bank_Master
for delete
as
begin
print'table record delete';
end

delete from  Bank_master

--4--
create table Bank_master_log(
LogId int identity(1,1) primary key,
event_BankID int,
Bank_text varchar(100),
Event_date datetime)

create trigger Bank_master_log_trigger
on Bank_master
for insert,update,delete
as
begin
	Declare @ Bank_id int,@delete_id int 

	select @Bank_id=Bank_id from inserted
	select @delect_id=Bank_id from deleted

	if((@Bank_id is not null) and (@delete_id is not null))
	begin
	     
		 insert into Bank_Master_log values
		 (@Bank_id,'update log',getdate())

	end

	else if(@Bank_id is not null)
	begin
	 insert into Bank_Master_log values
		 (@Bank_id,'insert log',getdate())
	end

	else
	begin

	select @delete_id=Banl_id
	from deleted
	end
	if(@Bank_id is not null)
	begin
	insert into Bank_Master_log values
		 (@Bank_id,'insert log',getdate());
