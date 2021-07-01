
CREATE TABLE space ( id SERIAL PRIMARY KEY,name VARCHAR(60),description VARCHAR(120),price INT,start_date DATE, finish_date DATE, guest_id INTEGER REFERENCES guest(id));
