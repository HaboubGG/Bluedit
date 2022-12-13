<?php
session_start();
$msg = "";
if (isset($_SESSION['email'])) {
    header('Location:index.php');
    exit;
}
//data base connection
include './connect.php';
$query = $pdo->prepare("SELECT * FROM user ORDER BY email, password");
$query->execute();

$user = $query->fetchAll();
$RowCounter =  $query->rowCount();



if (isset($_POST['ok'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];
    extract($_POST);
    $sql = "SELECT * FROM user WHERE email = :email";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'email' => $email,

    ]);
    $user = $stmt->fetch();
    //user check 
    if ($user == false) {
        $msg = "Invalid Email or Password";
    } else {
        //password check 
        if (!password_verify($password, $user['password'])) {
            $msg = "Invalid Password";
        }
        //captcha check
        else if ($_POST['captcha'] == $_SESSION['CAPTCHA_CODE']) {
            header('Location:index.php');
            $_SESSION['email'] = $email;
            exit;
        } else {
            $msg = "Invalid Captcha";
        }
    }
}
$template = "login";
$pagetitle = "Login page";
include "./layer.phtml";
