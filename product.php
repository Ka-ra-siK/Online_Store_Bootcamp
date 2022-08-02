<?php include "db_connect.php"; ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Интернет магазин</title>
    <link rel="stylesheet" type="text/css" href="/style/products_style.css">
</head>
<body>
<div class="product_cards">
    <?php
    $id_catalog = $_GET['cat_id'];
    $page = !empty($_GET['page']) ? (int)$_GET['page'] : 1;
    $num = 12;
    $page_num = (($page - 1) * $num);
    $sql = "SELECT pc.category_id, 
                           p.id, 
                           p.img_id, 
                           p.name, 
                           p.category_id,
                           TRIM(p.current_price)+0 AS current_price
                FROM products_category pc
                JOIN products p
                ON  pc.product_id = p.id
                WHERE pc.category_id = $id_catalog
                AND is_active = 1
                LIMIT $page_num, $num";

    $result = mysqli_query($conn, $sql);
    $catalog = mysqli_fetch_all($result);

    $sql = "SELECT p.id
            FROM products_category pc
                     JOIN products p
                          ON pc.product_id = p.id
            WHERE pc.category_id = $id_catalog
              AND is_active = 1";
    $result = mysqli_query($conn, $sql);
    $catalog_num = mysqli_fetch_all($result);


    if ((count($catalog_num) / $num) == 1) {
        $page_count = 0;
    } else {
        $page_count = floor(count($catalog_num) / $num);
    }

    if ($catalog != NULL) {
        $sql = "SELECT c.name,
                           c.description
                        FROM categories c
                        WHERE c.id = $id_catalog";

        $result = mysqli_query($conn, $sql);
        $category_name = mysqli_fetch_array($result);
        echo '
        <header class = "card_category">
            <h2> ' . $category_name[0] . '</h2>
            <h4>' . $category_name[1] . '</h4>
        </header>';
        echo '<div class="cards">';
        for ($i = 0; $i < count($catalog); $i++) {
            for ($j = 2; $j < 5; $j++) {
                if ($j == 2) {
                    $sql = "SELECT i.alt, 
                                   i.product_img
                                FROM products p
                                         JOIN img i
                                              ON i.id = p.img_id
                                WHERE p.img_id = " . $catalog[$i][$j] . "";
                    //$catalog[$i][$j]
                    $img_result = mysqli_query($conn, $sql);
                    $img = mysqli_fetch_all($img_result);
                }
                if ($j == 3) {
                    $sql = "SELECT c.name
                                FROM categories c
                                WHERE c.id =  " . $catalog[$i][$j + 1] . "";
                    $result = mysqli_query($conn, $sql);
                    $catalog_name = mysqli_fetch_array($result);
                    echo '
                            <div class = "card_block">
                                <a href="/product_card.php/?product=' . $catalog[$i][1] . '">
                                    <img class="card_block--img" src="/' . $img[0][1] . '" alt="' . $img[0][0] . '">
                                    <p class="card_block--name">' . $catalog[$i][$j] . '</p>
                                    <p class="card_block--price">' . $catalog[$i][5] . '&#8381;</p>
                                    <p class="card_disc" style = "padding-left: 15px">Категория: ' . $catalog_name[0] . '</p>
                                </a>
                            </div>';
                }
            }
        }
        echo '</div>';

    } else {
        header('/404.php');
    }

    ?>

    <div class="navigation">
        <?php
        for ($p = 1; $p <= $page_count + 1; $p++) {
            $i = $p;
            echo '<a href = "/product.php/?cat_id=' . $id_catalog . '&page=' . $p . '">' . $i . '  </a>';
        }
        ?>
    </div>


    <footer>
        <form action="/catalog.php">
            <button class="back_button" id="back">Назад</button>
        </form>
    </footer>
</div>

</body>
</html>
