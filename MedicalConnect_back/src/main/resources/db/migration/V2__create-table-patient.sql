create table patients(
    id BIGSERIAL not null,
    name varchar(120) not null,
    email varchar(100) not null,
    password varchar(300) not null,
    phone_number varchar(20) not null,
    birth_date DATE not null,
    status varchar(20) not null,
    allergies TEXT,
    primary key(id)

);