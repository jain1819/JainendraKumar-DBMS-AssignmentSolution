use Travel_OnTheGo;
/*3.How many females and how many male passengers travelled for a minimum distance of 600 KM s?*/

select gender, count(*)
from passenger
where Distance>600
group by passenger.Gender;

/*4.Find the minimum ticket price for Sleeper Bus. */

select min(Price)
from price
where price.Bus_Type="Sleeper";

/*5.Select passenger names whose names start with character 'S*/
select Passenger_name
from passenger
where Passenger_name like 'S%';

/*6.Calculate price charged for each passenger displaying Passenger name, Boarding City, 
Destination City, Bus_Type, Price in the output*/

select ps.Passenger_Name, ps.Boarding_City, ps.Destination_City, ps.Bus_Type, pr.Price 
from PASSENGER ps left join PRICE pr on ps.Bus_Type = pr.Bus_Type 
where ps.Distance = pr.Distance;

/*7.What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KM s */

SELECT Passenger_Name, Price 
FROM PASSENGER ps JOIN PRICE pr ON ps.Distance = pr.Distance AND ps.Bus_Type = pr.Bus_Type
WHERE ps.Bus_Type = 'Sitting'
AND ps.DISTANCE >= 1000;

/*8.What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to 
Panaji?*/

select Bus_Type,price from price
where 
Distance = (select Distance from Passenger where Passenger_name ='Pallavi' 
and ((Boarding_City='Bengaluru' and Destination_City='Panaji' ) 
or ( Boarding_City='Panaji' and Destination_City='Bengaluru')) );

/*9.List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.*/

select Distance 
from PASSENGER 
group by Distance 
having COUNT(Distance) = 1 
order by Distance desc;

/*10.) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables.*/

select p.Passenger_name, p.Distance, (p.Distance)*100/t.s AS 'Percentage'
from passenger p
CROSS JOIN (SELECT SUM(Distance) AS s FROM passenger) t ;

/*11.) Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise*/

select Distance, price, 
 CASE
  WHEN price > 1000 THEN 'Expensive'
  WHEN price > 500 and price < 1000 THEN 'Average Cost'
  ELSE 'Cheap' 
END  as Category
from price;





