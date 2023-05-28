		-- Question 1 -- 
	-- Create Stored Procedure --
DROP PROCEDURE IF EXISTS new_film;
		
CREATE OR REPLACE PROCEDURE add_film(
	title VARCHAR, 
	description VARCHAR, 
	release_year INT, 
	language_id INT,
	rental_duration INT, 
	rental_rate NUMERIC (3,2), -- How did Brian decide ON (4,2)?
	length INT, 
	replacement_cost NUMERIC (4,2), -- How did Brian decide ON (5,2)?
 	rating MPAA_RATING -- NOT SURE of the data TYPE, why not VARCHAR, Brian has MPAA_RATING I understand what that is, but does that mean that it will store AS a string because of both letters and nums?
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END;
$$;

 	
SELECT *
FROM film;

CALL add_film('Air', 'Start of Jordan sneaker era', 2023, 1, 3, 5.99, 112, 24.99, 'R')

SELECT * 
FROM film f 
ORDER BY (title = 'Air')DESC , title;




		-- Question 2 -- 

CREATE FUNCTION CatFilmCount(category_id INT)
RETURN INT
LANGUAGE plpgsql   
AS $$
	DECLARE film_count INT;
BEGIN
	SELECT COUNT(*) INTO film_count
	FROM film
	WHERE category_id = CatFilmCount.category_id
	RETURN film_count;
END;
$$;

SELECT CatFilmCount()

