<?php
//Connection to data base 
include './connect.php';
session_start();
$msg = "";
$query = $pdo->prepare("SELECT * FROM user order BY username , password , email ");
$query->execute();

$user = $query->fetchAll();
$RowCounter =  $query->rowCount();
$usedEmail = false;

if (!empty($_POST)) {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM user WHERE email ='$email'";
    $verify = $pdo->query($sql);
    //email verification
    if ($verify->rowCount() > 0) {
        $msg = "This Email is already used";
        //captcha verification
    } else if ($_POST['captcha'] != $_SESSION['CAPTCHA_CODE']) {
        $msg = "Invalid Captcha ";
    } else {
        $password = password_hash($password, PASSWORD_DEFAULT);

        $sql = "INSERT INTO 
        user (username , password , email)  
       VALUES ('$username','$password','$email')";

        //used $_session to send email from sign php to index.php 
        $_SESSION['email'] = $email;

        $usedEmail = false;

        $query = $pdo->prepare($sql);
        $query->execute();
        $user = $query->fetchAll();
        header('Location:index.php');
        exit;
    }
}
$template = "sign";
$pagetitle = "Sign in page";
include "./layer.phtml";
