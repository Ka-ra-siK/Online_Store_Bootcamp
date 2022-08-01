/*Первый запрос:
  Составить sql запрос, который выведет все категории, даже с количеством товаров 0,
  но с указанием количества товара для каждой категории, как и в оригинальном задании.
*/
SELECT c.id,
       c.name,
       count(pc.product_id) as product_count
FROM categories c
         LEFT JOIN products_category pc on c.id = pc.category_id
GROUP BY c.id, c.name
ORDER BY product_count DESC, c.name ASC;


/*Второй запрос:
  Составить sql запрос, который выведет все категории товаров с указанием количество товаров,
  имеющих количество товаров больше либо равно 2
  */
SELECT c.id,
       c.name,
       count(*) as product_count
FROM products_category pc
         JOIN categories c
              ON c.id = pc.category_id
         JOIN products p
              ON p.id = pc.product_id
WHERE p.is_active = 1
GROUP BY c.name, c.id
HAVING count(*) >= 2
ORDER BY product_count DESC, c.name ASC;
