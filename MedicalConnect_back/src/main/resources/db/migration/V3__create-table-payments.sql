CREATE TABLE payments (
    serial_id SERIAL,
    id UUID PRIMARY KEY,
    amount NUMERIC(5,2) NOT NULL,
    payment_method VARCHAR(200) NOT NULL



);