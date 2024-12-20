select * from client where length(client.FirstName) < 6;
select * from department where DepartmentCity = 'Lviv';
select * from client where Education = 'high' order by LastName;
select * from application order by application.idApplication desc limit 5;
select * from client where LastName like '%ov' or LastName like '%ova';
select * from client
join uliia17.department d on d.idDepartment = client.Department_idDepartment
where DepartmentCity = 'Kyiv';
select distinct FirstName from client;
select client.* from client
join uliia17.application a on client.idClient = a.Client_idClient
where Sum > 5000 and Currency = 'Gryvnia';
select (select count(*) from client
join department d on d.idDepartment = client.Department_idDepartment) as all_count,
(select count(*) from client
join department d on d.idDepartment = client.Department_idDepartment
where DepartmentCity = 'lviv') as lviv_count;
select max(Sum) as max_credit, client.* from client
join application a on client.idClient = a.Client_idClient
group by idClient;
select count(idApplication), client.* from client
join uliia17.application a on client.idClient = a.Client_idClient
group by idClient;
select min(Sum) as min, max(Sum) as max from application;
select count(idApplication), client.* from client
join uliia17.application a on client.idClient = a.Client_idClient
where Education = 'high' group by idClient;
select avg(Sum) as avg, client.* from client
join application a on client.idClient = a.Client_idClient
group by idClient order by avg desc limit 1;
select sum(Sum) as maxCredits, DepartmentCity from department
join uliia17.client c on department.idDepartment = c.Department_idDepartment
join uliia17.application a on c.idClient = a.Client_idClient
group by idDepartment order by maxCredits desc limit 1;
select max(Sum) as maxSum, DepartmentCity from department
join uliia17.client c on department.idDepartment = c.Department_idDepartment
join uliia17.application a on c.idClient = a.Client_idClient
group by idDepartment order by maxSum desc limit 1;
update application join client c on c.idClient = application.Client_idClient
set Sum=6000 where Education = 'high';
update client join uliia17.department d on client.Department_idDepartment = d.idDepartment
set City = 'Kyiv' where DepartmentCity = 'Kyiv';
delete from application where CreditState = 'Returned';
delete application from application
join client c on c.idClient = application.Client_idClient
where LastName like '_e%' or LastName like '_y%' or
LastName like '_u%' or LastName like '_o%' or LastName like '_a%';
select sum(Sum), DepartmentCity, idDepartment from department
join uliia17.client c on department.idDepartment = c.Department_idDepartment
join uliia17.application a on c.idClient = a.Client_idClient
where DepartmentCity = 'Lviv' group by DepartmentCity, idDepartment
having sum(Sum) > 5000;
select sum(Sum), client.* from client
join uliia17.application a on client.idClient = a.Client_idClient
where CreditState = 'returned' group by client.idClient, client.FirstName, client.LastName, client.Education, client.Passport, client.City, client.Age, client.Department_idDepartment
having sum(Sum) > 5000;
select application.* from application
where CreditState = 'not returned' order by Sum desc limit 1;
select client.*, Sum from client
join application a on client.idClient = a.Client_idClient
order by Sum limit 1;
select * from application
where Sum > (select avg(Sum) from application);
select * from client
where City = (select c.City from client c
join application a on c.idclient = a.client_idclient
group by idclient order by count(*) desc limit 1);