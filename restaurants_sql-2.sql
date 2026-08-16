CREATE TABLE restaurant(
     restaurant_id INT,
    restaurant_Name Varchar(30),
     city varchar(50),
     rating Float
   ); 
   drop table restaurant;
     select * from  restaurant;
	select restaurant_name,rating from restaurant
	where rating =
	(select max(rating)  AS highers_rating
	from restaurant);



select restaurant_name,rating from restaurant
	where rating =
	(select min(rating)  AS lowers_rating
	from restaurant);




select max(rating)  AS higher_ratingcity
	from restaurant;
	
select restaurant_name,rating,city from restaurant
	where rating =
	(select  max(rating)  AS higher_ratingcity
	from restaurant);


	
	select restaurant_name,rating,city from restaurant
	where rating =
	(select  max(rating)  AS higher_ratingcity
	from restaurant);
	
	
select *from restaurant;
	select min(rating)  AS  lowers_ratingcity
	from restaurant;	
	
	
	select restaurant_name,rating,city from restaurant
	where rating =
	(select  min(rating)  AS lowers_ratingcity
	from restaurant);



	SELECT 
    r.*,
    CASE
        WHEN r.rating = (SELECT MAX(rating) FROM restaurant)
        THEN 'Higher Rating'
        ELSE 'Normal Rating'
    END AS rating_status
FROM restaurant r;

	SELECT 
    r.*,
    CASE
        WHEN r.rating = (SELECT MIN(rating) FROM restaurant)
        THEN 'Lowest Rating'
        ELSE 'Normal Rating'
    END AS rating_status
FROM restaurant r;


SELECT *
FROM (
    SELECT
        r.*,
        CASE
            WHEN r.rating = (SELECT MAX(rating) FROM restaurant)
                THEN 'Highest Rating'
            WHEN r.rating = (SELECT MIN(rating) FROM restaurant)
                THEN 'Lowest Rating'
            ELSE 'Medium Rating'
        END AS rating_status
    FROM restaurant AS r
) AS x
ORDER BY
    CASE rating_status
        WHEN 'Highest Rating' THEN 1
        WHEN 'Medium Rating' THEN 2
        WHEN 'Lowest Rating' THEN 3
    END;
select * from restaurant;