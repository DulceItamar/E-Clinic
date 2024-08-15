CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    amount NUMERIC(5,2) NOT NULL,
    payment_method VARCHAR(200) NOT NULL,
    doctor_id UUID NOT NULL

);