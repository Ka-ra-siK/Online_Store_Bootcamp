<?php include "db_connect.php"; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Интернет магазин</title>
    <link rel="stylesheet" type="text/css" href="./style/form.css">
</head>
<body>


<?php
$nameErr = $emailErr = $birthErr = $genderErr = $themeErr = $textErr = $checkErr = $succes = "";
$name = $email = $birth = $gender = $theme = $text = $check = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["userName"])) {
        $nameErr = "Введите имя";
    } else {
        if (!preg_match("/^([а-яё\s]+|[a-z\s]+)$/iu", test_input($_POST["userName"]))) {
            $nameErr = "Имя должно содержать только буквы и пробелы";
        }
        else{
            $name = test_input($_POST["userName"]);
            setcookie('userName', $name, time() + 60*60);
        }
    }

    if (empty($_POST["userEmail"])) {
        $emailErr = "Введите Email";
    } else {
        if (!filter_var(test_input($_POST["userEmail"]), FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Неверный формат электронной почты";
        }
        else{
            $email = test_input($_POST["userEmail"]);
            setcookie('userEmail', $email, time() + 60*60);
        }
    }

    if (empty($_POST["userBirth"])) {
        $birthErr = "Введите дату рождения";
    } else {
        $birth = test_input($_POST["userBirth"]);
        setcookie('userBirth', $birth, time() + 60*60);
    }

    if (empty($_POST["gender"])) {
        $genderErr = "Пол не выбран!";
    } else {
        if (test_input($_POST['gender']) == 'male') {
            $gender = 1;
        } else {
            $gender = 0;
        }
        setcookie('gender', $gender, time() + 60*60);
    }

    if (empty($_POST["formTheme"])) {
        $themeErr = "Заполните заголовок";
    } else {
        $theme = test_input($_POST["formTheme"]);
    }

    if (empty($_POST["formText"])) {
        $textErr = "Заполните текстовое поле";
    } else {
        $text = test_input($_POST["formText"]);
    }

    if (empty($_POST["checkbox"])) {
        $checkErr = "Подтвердите!";
    } else {
        $check = test_input($_POST["checkbox"]);
    }

}

function test_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

if (!empty($_POST['userName']) &&
    !empty($_POST['userEmail']) &&
    !empty($_POST['userBirth']) &&
    !empty($_POST['gender']) &&
    !empty($_POST['formTheme']) &&
    !empty($_POST['formText']) &&
    !empty($_POST['checkbox'])) {
    try {
        $sql = "INSERT INTO feedback (person_name, 
                          email, 
                          birth, 
                          gender, 
                          theme, 
                          question)
                VALUE (?, ?, ?, ?, ?, ?)";

        $stmt = $conn->prepare($sql);

        $stmt->bind_param('sssiss', $name, $email, $birth, $gender, $theme, $text);
       /* $stmt->bind_param(1, $name);
        $stmt->bind_param(2, $email);
        $stmt->bind_param(3, $birth);
        $stmt->bind_param(4, $gender);
        $stmt->bind_param(5, $theme);
        $stmt->bind_param(6, $text);*/
        $stmt->execute();

        $succes = "Данные успешно сохранены!";
    } catch (PDOException $e) {
        echo 'Error!' . $e->getMessage();
    }
}


?>


<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <div class="background">
        <div class="form">
            <div class="form_title">
                <h1>Заполните форму</h1>
                <span class="succes"><?php echo $succes; ?></span>
            </div>
            <div class="form_fields">
                <div class="form_fields--name">
                    <p>Имя</p>
                    <p><input class="name_field" type="text" name="userName" size="18" value="<?php echo $name; ?>">
                        <span class="error"><?php echo $nameErr; ?></span>
                    </p>
                </div>

                <div class="form_fields--email">
                    <p>E-mail</p>
                    <p><input class="email_field" type="text" name="userEmail" size="18" value="<?php echo $email; ?>">
                        <span class="error"><?php echo $emailErr; ?></span>
                    </p>
                </div>

                <div class="form_fields--birth">
                    <p>Дата рождения</p>
                    <p><input class="birth_field" type="date" name="userBirth" placeholder="Дата рождения" size="18"
                              value="<?php echo $birth; ?>">
                        <span class="error"><?php echo $birthErr; ?></span>
                    </p>
                </div>

                <div class="form_fields--gender">
                    <p>Выберите пол:</p>
                    <div class="gender_field">
                        <input class="gender_field--male" type="radio" id="male"
                               name="gender" value="male">
                        <label for="male">Мужской</label>

                        <input class="gender_field--female" type="radio" id="female"
                               name="gender" value="female">
                        <label for="female">Женский</label>
                    </div>
                    <span class="error"><?php echo $genderErr; ?></span>

                </div>

                <div class="form_fields--theme">
                    <p>Тема обращения</p>
                    <p><input class="theme_field" type="text" name="formTheme" placeholder="Тема" size="18"/>
                    </p>
                    <span class="error"><?php echo $themeErr; ?></span>
                </div>

                <div class="form_fields--question">
                    <p><textarea class="question_text" rows="20" cols="45" name="formText" size="18"></textarea>
                    </p>
                    <span class="error"><?php echo $textErr; ?></span>
                </div>

                <div class="form_fields--checkbox">
                    <input id="isIntroduction" type="checkbox" name="checkbox">
                    <label for="isIntroduction">C контрактом ознакомлен</label>
                    <span class="error"><?php echo $checkErr; ?></span>
                </div>

                <div class="form_fields--button">
                    <input type="submit" class="button-send" value="Отправить">
                </div>
            </div>

        </div>
    </div>
</form>
<form action="/catalog.php">
    <button class="button-send" id="back">Назад</button>
</form>
</body>
</html>
