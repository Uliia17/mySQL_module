create table usersMain
(
    id int primary key auto_increment,
    username varchar(7) not null,
    password varchar(10) not null
);

create table skills
(
    id int primary key auto_increment,
    skill varchar(6) not null
);

create table usersMain_skills
(
    user_id int,
    skill_id int,
    primary key (user_id, skill_id),
    foreign key (user_id) references usersMain(id),
    foreign key (skill_id) references skills(id)
);

create table `groups`
(
    id int primary key auto_increment,
    `group` varchar(10) not null
);

create table mentors
(
    id int primary key auto_increment,
    mentor varchar(10) not null
);

create table profileMain
(
    id int primary key auto_increment,
    name varchar(10) not null,
    surname varchar(10) not null
);

select u.id AS user_id, u.username, u.password, pM.id AS profile_id,
       case when pM.id = 1 then 1
            when pM.id = 2 then 2
            when pM.id = 3 then 1
            when pM.id = 4 then 2
            when pM.id = 5 then 2
            when pM.id = 6 then 1
            when pM.id = 7 then 2
           end as `group`,
       case
           when pM.id = 1 then 1
           when pM.id = 2 then 2
           when pM.id = 3 then 1
           when pM.id = 4 then 3
           when pM.id = 5 then 4
           when pM.id = 6 then 3
           when pM.id = 7 then 4
           end as mentor_id
from usersMain u
         join profileMain pM on u.id = pM.id left
        join `groups` g on pM.id = g.id left
             join mentors m on u.id = m.id;