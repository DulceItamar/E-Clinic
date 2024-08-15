create table doctors(
    id BIGSERIAL PRIMARY KEY,
    doctor_id UUID not null
    name varchar(120) not null,
    email varchar(100) not null,
    password varchar(300) not null,
    phone_number varchar(20) not null,
    status varchar(20) not null,
    medical_speciality varchar(120) not null,
    professional_license varchar(120) not null,
    job_description TEXT,
    work_days TEXT [] not null,
    services TEXT [] not null,
    service_price FLOAT not null


);