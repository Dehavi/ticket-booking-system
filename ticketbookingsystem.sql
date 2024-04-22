create database ticketbookingsystem;
use ticketbookingsystem;
create table venue(
    venue_id int,
    venue_name varchar(255),
    address varchar(255),
    primary key(venue_id));

create table event (
  event_id int,
  event_name varchar(225),
  event_date date,
  event_time time,
  total_seats int,
  available_seats int,
  ticket_price decimal,
  event_type enum('movie', 'sports', 'concert'),
  venue_id int,
  booking_id int,
  primary key (event_id)
);

create table customer(
customer_id int,
customer_name varchar(45),
email varchar(55),
phone_number bigint,
booking_id int,
primary key (customer_id)
);

create table booking(
booking_id int,
customer_id int,
event_id int,
num_tickets int,
total_cost decimal,
booking_date date,
primary key (booking_id));

INSERT INTO venue (venue_id,venue_name, address) VALUES 
(101,'alpha city', '123 Alpha Avenue'),
(102,'beta street', '456 Beta Street'),
(103,'came street', '789 Came Street'),
(104,'delta park', '101 Delta Park Lane'),
(105,'epsilon avenue', '202 Epsilon Avenue'),
(106,'foo square', '303 Foo Square'),
(107,'gamma gardens', '404 Gamma Gardens'),
(108,'hotel indigo', '505 Hotel Indigo Blvd'),
(109,'ivy lane', '606 Ivy Lane'),
(110,'jupiter plaza', '707 Jupiter Plaza');

INSERT INTO event (event_id, event_name, event_date, event_time, total_seats, available_seats, ticket_price, event_type, venue_id, booking_id)
 VALUES 
(1, 'Movie Night', '2024-04-15', '19:00:00', 100, 90, 800.00, 'movie', 101, 111),
(2, 'Football Match', '2024-04-16', '15:30:00', 200, 180, 900.00, 'sports', 102, 222),
(3, 'Concert Under the Stars', '2024-04-17', '20:00:00', 150, 140, 1000.00, 'concert', 103, 333),
(4, 'Comedy Show', '2024-04-18', '18:00:00', 120, 110, 1200.00, 'concert', 104, 444),
(5, 'Basketball Game', '2024-04-19', '17:45:00', 180, 160, 1400.00, 'sports', 105, 555),
(6, 'Movie Marathon', '2024-04-20', '12:00:00', 80, 70, 1600.00, 'movie', 106, 666),
(7, 'Rock Concert', '2024-04-21', '21:00:00', 250, 220, 3000.00, 'concert', 107, 777),
(8, 'Tennis Tournament', '2024-04-22', '10:00:00', 300, 250, 800.00, 'sports', 108, 888),
(9, 'Stand-up Comedy', '2024-04-23', '19:30:00', 100, 90, 900.00, 'concert', 109, 999),
(10, 'Movie Premiere', '2024-04-24', '20:30:00', 150, 130, 1000.00, 'movie', 110, 1010);

INSERT INTO customer (customer_id, customer_name, email, phone_number, booking_id) VALUES
(1, 'John Doe', 'john@example.com', 11111111, 111),
(2, 'Alice Smith', 'alice@example.com', 287654302, 222),
(3, 'Bob Johnson', 'bob@example.com', 32222114553, 333),
(4, 'Emily Davis', 'emily@example.com', 4151512314, 444),
(5, 'Michael Wilson', 'michael@example.com',5222211115, 555),
(6, 'Emma Brown', 'emma@example.com', 6111225566, 666),
(7, 'David Martinez', 'david@example.com', '755522277', 777),
(8, 'Sophia Garcia', 'sophia@example.com', 852426468, 888),
(9, 'Daniel Rodriguez', 'daniel@example.com', '9999999999', 999),
(10, 'Olivia Hernandez', 'olivia@example.com', '1010101010', 1010);

INSERT INTO booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date)
 VALUES
(111, 5, 1, 2, 2000.00, '2024-04-11'),
(222, 9, 2, 4, 2300.00, '2024-04-12'),
(333, 2, 3, 1, 1000.00, '2024-04-13'),
(444, 10, 4, 3, 2900.00, '2024-04-14'),
(555, 1, 5, 2, 3020.00, '2024-04-15'),
(666, 7, 6, 2, 5400.00, '2024-04-16'),
(777, 6, 7, 5, 2100.00, '2024-04-17'),
(888, 8, 8, 3, 2340.00, '2024-04-18'),
(999, 3, 9, 2, 2340.00, '2024-04-19'),
(1010, 4, 10, 4, 2500.00, '2024-04-20');

-- Alter the Event Table to add Foreign Key Constraint for venue_id
ALTER TABLE event
ADD CONSTRAINT fk_venue_id
FOREIGN KEY (venue_id) REFERENCES venue(venue_id);

-- Alter the Event Table to add Foreign Key Constraint for booking_id
ALTER TABLE event
ADD CONSTRAINT fk1_booking_id
FOREIGN KEY (booking_id) REFERENCES booking(booking_id);

-- Alter the Customer Table to add Foreign Key Constraint for booking_id
ALTER TABLE customer
ADD CONSTRAINT fk2_booking_id
FOREIGN KEY (booking_id) REFERENCES booking(booking_id);

-- Alter the Booking Table to add Foreign Key Constraint for customer_id
ALTER TABLE booking
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

-- Alter the Booking Table to add Foreign Key Constraint for event_id
ALTER TABLE booking
ADD CONSTRAINT fk_event_id
FOREIGN KEY (event_id) REFERENCES event(event_id);


