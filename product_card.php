<?php include "db_connect.php"; ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Интернет магазин</title>
    <link rel="stylesheet" type="text/css" href="/style/style.css">
    <link rel="stylesheet" href="/fonts/stylesheet.css">
</head>

<body>

<?php
$id_product = $_GET['product'];
$sql = "SELECT p.id,
               p.name,
               TRIM(p.current_price)+0 AS current_price,
               TRIM(p.sale_price)+0 AS sale_price,
               TRIM(p.default_price)+0 AS default_price,
               p.description,
               p.category_id,
               p.img_id
            FROM products p
            WHERE id = $id_product
            AND is_active = 1";
$result = mysqli_query($conn, $sql);
$product = mysqli_fetch_array($result);

if ($product != NULL) {
    $sql = "SELECT c.id, 
                       c.name
                FROM products_category pc
                         JOIN categories c
                              ON c.id = pc.category_id
                WHERE pc.product_id = " . $product[0] . "";
    $result = mysqli_query($conn, $sql);
    $category = mysqli_fetch_all($result);

    $sql = "SELECT pi.product_id,
                        pi.img_id,
                        i.alt,
                        i.product_img FROM img i
                    JOIN products_img pi
                        on i.id = pi.img_id
                    WHERE pi.product_id = '.$product[0].'";
    $result = mysqli_query($conn, $sql);
    $img = mysqli_fetch_all($result);

    $sql = "SELECT s.name
            FROM products p
                     JOIN store s on p.store_name = s.id
            WHERE p.id = $id_product";
    $result = mysqli_query($conn, $sql);
    $store = mysqli_fetch_all($result);
} else {
    header('/404.php');
}
//print_r($product);

?>
<div class="layout">
    <div class="product">
        <!----Image-->
        <div class="product__preview">
            <div class="product__gallery">
                <div class="product__scroll">
                    <?php echo '
                    <img class="product__image" src="/' . $img[0][3] . ' " alt="Рубашка">
                    <img class="product__image" src="/' . $img[1][3] . '" alt="Рубашка">
                    <img class="product__image" src="/' . $img[2][3] . '" alt="Рубашка">
                    '?>
                </div>
                <?php echo '
                    <img class="product__image product__image--main" id="image--main" src="/' . $img[0][3] . '" alt="Предпоказ">
                '?>
            </div>
        </div>

        <!---Description-->
        <div class="product__description">
            <h2 class="product__title"><?php echo $product[1] ?></h2>

            <div class="product__categories">
                <?php for ($i = 0; $i < count($category); $i++) {
                    echo "<a class='product__categories-text' href = '/product.php/?cat_id=" . $category[$i][0] . "'>" . $category[$i][1] . "</a>";
                } ?>
            </div>

            <div class="product__prices">
                <div class="product__actual-price">
                    <span class="product__old-price"><?php echo $product[4] ?></span>
                    <span class="product__current-price"><?php echo $product[2] ?> &#8381;</span>
                </div>
                <div class="product__discount-price">
                    <span class="product__discount-current-price"><?php echo $product[3] ?> &#8381;</span>
                    <span class="product__discount-text">- с промокодом</span>
                </div>
            </div>


            <!--Delivery-->
            <div class="product__delivery">
                <div class="product__in-stock">
                    <img class="product__delivery-img" src="/img/icon/ok.png" alt="#"> В наличии в магазине
                    <a href="#"><?php echo $store[0][0]?></a>
                </div>
                <div class="product__delivery-price">
                    <img class="product__delivery-img" src="/img/icon/delivery.png" alt="#"> Бесплатная доставка
                </div>
            </div>


            <!--Counter-->
            <div class="product__counter">
                <div class="counter--minus">–</div>
                <div class="counter--count">0</div>
                <div class="counter--plus">+</div>
            </div>


            <!--Buttons-->
            <div class="product__buttons">
                <button class="product__to-store" id="buy">
                    Купить
                </button>
                <button class="product__to-favorites">
                    В избранное
                </button>

            </div>

            <!--Description-->
            <div class="product__text-description">
                <?php
                    echo "<p>$product[5]</p>";
                ?>
            </div>


            <!--Footer-->
            <div class="product__footer-info">
                <span class="product__footer-text">Поделиться:</span>
                <div class="product__footer-icon">
                    <a href="#"><img src="/img/icon/vk.png"></a>
                </div>
                <div class="product__footer-icon">
                    <a href="#"><img src="/img/icon/google.png"></a>
                </div>
                <div class="product__footer-icon">
                    <a href="#"><img src="/img/icon/facebook.png"></a>
                </div>
                <div class="product__footer-icon">
                    <a href="#"><img src="/img/icon/twitter.png"></a>
                </div>
                <div class="product__footer-reposts">123</div>

            </div>
        </div>
    </div>
    <footer>
        <?php
        echo '<form>
            <a href ="/product.php/?cat_id=' . $product[6] . '">Назад</a>
        </form>'
        ?>
    </footer>
</div>
<script src="/js/zoom.js"></script>
<script src="/js/jquery.js"></script>
<script src="/js/notify.js"></script>
<script src="/js/script.js"></script>

</body>

</html>
