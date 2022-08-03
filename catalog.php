<?php include "db_connect.php"; ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Интернет магазин</title>
    <link rel="stylesheet" type="text/css" href="./style/catalog_style.css">
</head>

<body>
<div class="catalog" style="margin-left:110px">
    <div class="catalog_list">
        <h2 class="catalog_title">Категории</h2>
        <div class="catalog_list--db">
            <?php
            $sql = "SELECT c.id,
                           c.name,
                           count(*) as product_count
                    FROM products_category pc
                             JOIN categories c
                                  ON c.id = pc.category_id
                             JOIN products p
                                  ON p.id = pc.product_id
                    WHERE p.is_active = 1
                    GROUP BY c.name, c.id
                    ORDER BY product_count DESC, c.name ASC";
            $result = mysqli_query($conn, $sql);
            $category_value = mysqli_fetch_all($result);

            for ($i = 0; $i < count($category_value); $i++) {
                for ($j = 1; $j < 3; $j++) {
                    if ($j == 2) {
                        echo " - (", $category_value[$i][$j], ")</a></p>";
                    } else {
                        echo '<p id= "catalog__item" class = "catalog__item">
                        <a href = "product.php/?cat_id=' . $category_value[$i][0] . '">', $category_value[$i][$j], " ";
                    }
                }
                echo '<br>';
            }
            ?>
        </div>
    </div>
    <div class="catalog_img">
        <img class="catalog__image--main" id="image--main" src="/img/category_img/img1.png" alt="Предпоказ"
             WIDTH="550px" height="600px">
    </div>

    <footer>
        <form class="catalog_button" action="/form.php">
            <button class="ask_button" id="ask">Спросить</button>
        </form>
    </footer>
</div>


</body>
</html>
