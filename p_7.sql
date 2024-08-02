create table DDL_log(Log_ID int identity(1,1) primary key,
event_text XML,
event_data datetime
)

create trigger DDL_log_trigger 
on database
for Create_table,alter_table,drop_table
as
begin
	insert into DDL_log values
	(Eventdata(),getdate())
end

create table b220(id int)

alter Table b220
add Name varchar(50)

drop Table b220

select *from DDL_log
