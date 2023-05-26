

		-- Question 2 -- 

CREATE FUNCTION CatFilmCount(category_id INT)
RETURN INT
LANGUAGE plpgsql
AS $$
	DECLARE film_count INT;
BEGIN
	SELECT COUNT(*) INTO film_count
	FROM film
	WHERE category_id = category_id
	RETURN film_count;
END;
$$;

SELECT CatFilmCount()

