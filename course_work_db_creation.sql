CREATE DATABASE IF NOT EXISTS dantist_aggregator;

CREATE TABLE IF NOT EXISTS doctors (
	id serial,
	name VARCHAR(150) NOT NULL,
	age TINYINT UNSIGNED,
	clinic_id BIGINT UNSIGNED NOT NULL,
	
	INDEX doctor_name_idx (name),
	
	FOREIGN KEY (clinic_id) REFERENCES clinics (id)
);

CREATE TABLE IF NOT EXISTS clinics (
	id serial,
	title VARCHAR(255) NOT NULL,
	since SMALLINT UNSIGNED,
	address VARCHAR(255),
	phone_number VARCHAR(20),
	closest_metro VARCHAR(30) NOT NULL,
	
	INDEX clinic_title_idx (title)
);

CREATE TABLE IF NOT EXISTS services (
	id serial,
	title VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS doctor_clinic (
	doctor_id BIGINT UNSIGNED NOT NULL,
	clinic_id bigint UNSIGNED NOT NULL,
	
	INDEX doctor_clinic_idx (doctor_id, clinic_id),
	
	FOREIGN KEY (doctor_id) REFERENCES doctors (id),
	FOREIGN KEY (clinic_id) REFERENCES clinics (id)
);

CREATE TABLE IF NOT EXISTS clinic_services (
	clinic_id BIGINT UNSIGNED NOT NULL,
	service_id BIGINT UNSIGNED NOT NULL,
	price DECIMAL(8, 2) UNSIGNED NOT NULL,
	
	INDEX service_price_idx (service_id, price),
	
	FOREIGN KEY (clinic_id) REFERENCES clinics (id),
	FOREIGN KEY (service_id) REFERENCES services (id)
);

CREATE TABLE IF NOT EXISTS doctor_feedback (
	id serial,
	doctor_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(50) DEFAULT 'anonymus',
	body text NOT NULL,
	created_at DATETIME DEFAULT current_timestamp(),
	
	INDEX doctor_feedback_idx (doctor_id),
	
	FOREIGN KEY (doctor_id) REFERENCES doctors (id)
);

CREATE TABLE IF NOT EXISTS clinic_feedback (
	id serial,
	clinic_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(50) DEFAULT 'anonymus',
	body text NOT NULL,
	created_at DATETIME DEFAULT current_timestamp(),
	
	INDEX clinic_feedback_idx (clinic_id),
	
	FOREIGN KEY (clinic_id) REFERENCES clinics (id)
);

CREATE TABLE IF NOT EXISTS doctor_rating (
	id serial,
	doctor_id BIGINT UNSIGNED NOT NULL,
	value ENUM('1','2','3','4','5'),
	
	INDEX doctor_rating_idx (doctor_id),
	
	FOREIGN KEY (doctor_id) REFERENCES doctors (id)
);

CREATE TABLE IF NOT EXISTS clinic_rating (
	id serial,
	clinic_id BIGINT UNSIGNED NOT NULL,
	value ENUM('1','2','3','4','5'),
	
	INDEX clinic_rating_idx (clinic_id),
	
	FOREIGN KEY (clinic_id) REFERENCES clinics (id)
);

CREATE TABLE IF NOT EXISTS doctors_photos (
	id serial,
	doctor_id BIGINT UNSIGNED NOT NULL,
	description text NOT NULL,
	
	INDEX doctor_photo_idx (doctor_id),
	
	FOREIGN KEY (doctor_id) REFERENCES doctors (id)
);

create TABLE IF NOT EXISTS orders (
	id serial,
	clinic_id bigint unsigned not null,
	doctor_id bigint unsigned not null,
	service_id bigint unsigned not null,
	user_id bigint unsigned not null,
	user_name VARCHAR(100),
	created_at datetime default now(),
	service_date date,
	cost decimal(8,2) unsigned,
	
	foreign key (clinic_id) references clinics (id),
	foreign key (doctor_id) references doctors (id),
	foreign key (service_id) references services (id),
	foreign key (user_id) references users (id)
);

create TABLE IF NOT EXISTS users (
	id serial,
	login VARCHAR(20) not null,
	passwd VARCHAR(20) not null,
	phone VARCHAR(15),
	name VARCHAR(100) default 'anonimus',
	created_at DATETIME default now()
);
