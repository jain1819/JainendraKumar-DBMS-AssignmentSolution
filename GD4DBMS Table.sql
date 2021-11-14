create database if not exists Travel_OnTheGo;
use Travel_OnTheGo;

create table if not exists PASSENGER (
Passenger_name varchar(50),
Category varchar(50),
Gender varchar(10),
Boarding_City varchar(50),
Destination_City varchar(50),
Distance int,
Bus_Type varchar(50)
);

create table if not exists PRICE (
Bus_Type varchar(50),
Distance int,
Price int
);

