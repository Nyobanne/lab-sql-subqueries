use sakila;
-- 1.Determine the number of copies of the film "Hunchback Impossible" of the inventory system
SELECT count(*) as number_of_copies from film f 
JOIN inventory i 
using(film_id)
WHERE film.title = 'Hunchback Impossible';
-- 2.List all films longer than the average length of all the films in Sakila
SELECT title, length FROM film
WHERE length > (
	SELECT AVG(length)
	FROM film f )
LIMIT 50;

-- 3.Use a subquery to display all actors who appear in the film "Alone Trip"

SELECT a.first_name, a.last_name from actor a
JOIN (
	SELECT actor_id from film_actor fa
	WHERE film_id= (
		SELECT film_id FROM film f
		WHERE title='Alone Trip')
	) 
ON  a.actor_id=fa.actor_id;
