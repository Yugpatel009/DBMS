--syntex--
declare cursor_name cursor
static 
for select query
open cursor_name

declare variable if required
fetch next from cursor_name
if(@@CURSOR_ROWS>0)
begin
	while @@fetch_Status=0
	begin

	end
	end

	close cursor_name
	Deallocate cursor_name

	--9.1--
	declare Bank_master_cursor cursor
	static
	for select Bank_Id,Bank_Name,Bank_ShortName from Bank_Master

	open Bank_master_cursor

	declare @Bank_Id int,@Bank_Name varchar(50),@Bank_ShortName varchar(30)

	fetch next from Bank_master_cursor into @Bank_Id ,@Bank_Name ,@Bank_ShortName

	if(@@CURSOR_ROWS>0)
	begin
		while @@FETCH_STATUS=0
		begin
			print concat('Bank_ID:',@Bank_Id,'Bank_Name:',@Bank_Name,'Bank_Short:',@Bank_ShortName)

			fetch next from Bank_master_cursor into @Bank_Id ,@Bank_Name ,@Bank_ShortName
		end
	end

	close Bank_master_cursor
	deallocate Bank_master_cursor

	--9.2--
	declare Bank_master_cursor_2 cursor
	static
	for select Bank_Id,Bank_Name,Bank_ShortName from Bank_Master

	open Bank_master_cursor_2

	declare @Bank_Id int,@Bank_Name varchar(50),@Bank_ShortName varchar(30)

	fetch first  from Bank_master_cursor_2 into @Bank_Id ,@Bank_Name ,@Bank_ShortName
	
	print concat('Bank_ID:',@Bank_Id,'Bank_Name:',@Bank_Name,'Bank_Short:',@Bank_ShortName)
	fetch last  from Bank_master_cursor_2 into @Bank_Id ,@Bank_Name ,@Bank_ShortName
	print concat('Bank_ID:',@Bank_Id,'Bank_Name:',@Bank_Name,'Bank_Short:',@Bank_ShortName)
	
	close Bank_master_cursor_2
	deallocate Bank_master_cursor_2
	
	