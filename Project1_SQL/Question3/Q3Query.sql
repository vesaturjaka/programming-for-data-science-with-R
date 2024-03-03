WITH
    t1
    AS

    (
        SELECT *
        FROM category c
            JOIN film_category fc
            ON c.category_id = fc.category_id
            JOIN film f
            ON f.film_id = fc.film_id
            JOIN inventory i
            ON i.film_id = f.film_id
            JOIN rental r
            ON r.inventory_id = i.inventory_id
        WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family','Music')
    )


SELECT t1.title film_title, t1.name category_name, COUNT(t1.title) rental_count
FROM t1
GROUP BY 1, 2
ORDER BY category_name, film_title