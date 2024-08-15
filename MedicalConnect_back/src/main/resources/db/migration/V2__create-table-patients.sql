create table patients(
    serial_id SERIAL PRIMARY KEY,
    patient_id UUID not null,
    name varchar(120) not null,
    email varchar(100) not null,
    password varchar(300) not null,
    phone_number varchar(20) not null,
    birthdate DATE not null,
    status varchar(20) not null,
    allergies TEXT,
    gender varchar(12) not null,
    type_of_user varchar(10) not null,

);