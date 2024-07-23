create table doctors(
    id BIGSERIAL not null,
    name varchar(120) not null,
    email varchar(100) not null,
    password varchar(300) not null,
    phone_number varchar(20) not null,
    status varchar(20) not null,
    medical_speciality varchar(120) not null,
    professional_license varchar(120) not null,
    job_description TEXT,
    primary key(id)

);