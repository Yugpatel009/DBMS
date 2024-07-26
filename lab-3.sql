declare @num int=10
print @num

if(@num=20)
print 'yes';

else
print 'no';

--3.1--
declare @n int
set @n=1

if(@n>0)
begin 
        print concat('Number is positiv=',@n);
end

else
 print concat('Num  ber is negativ=',@n);

 --3.2-
 declare @no1 int,@no2 int;
 set @no1=10
 set @no2=20

 if(@no1>@no2)
       
	   print concat('no1 is maximum=',@no1);

	   else
	   print concat('no2 is maximum=',@no2);

--3.3--

declare @n1 int,@n2 int ,@n3 int;
 set @n1=10
 set @n2=20
 set @n3=30

 if(@n1>@n2 and @n1>@n3)
       
	   print concat('no1 is maximum=',@n1);

   else if(@n2>@n1 and @n2>@n3 )
	   print concat('no2 is maximum=',@n2);

	   else
	   print concat ('no3 is maximum=',@n3);

--3.4--
declare @j int=1;

while(@j<=25)

begin 
print @j
 set @j+=1
 end

--3.5--
declare @i int=1;

while(@i<=100)
begin

 if(@i%2!=0)
 begin
 print @i
 end

 set @i+=1
 end


 --3.6--
 declare @k int=1,@sum int=0;
 
while(@k<=100)
begin
  set @sum+=@k
  set @k+=1
end

  print @sum

--3.7--
declare @num1 int=11;

if(@num1%2!=0)
begin
      print concat('Number is odd=',@num1);
end
else
begin
    print concat('Number is even=',@num1);
end

--3.8--

declare  @n9 int=50

while(@n9>=1)
begin

  if(@n9%2!=0)
      print @n9

      set @n9 -=1
 end

--3.9--

declare @mark int=80

if(@mark>70)
print '1st class'

else if(@mark>50 and @mark<=70)
print '2nd class'

else if(@mark >=35 and @mark <=50)
print '3rd class'

else if(@mark<35)
print 'Fail'

