<?php
include './connect.php';
session_start();
$userEmail = $_SESSION['email'];

$query = $pdo->prepare("SELECT * FROM user where email = '$userEmail' ");
$query->execute();

$user = $query->fetch();

$msg = "";
$query5 = $pdo->prepare("SELECT * FROM notification");
$query5->execute();
$notification = $query5->fetchAll();


if (!empty($_POST['changeDetails'])) {
  $username = $_POST['username'];
  $organisation = $_POST['organisation'];
  $location = $_POST['location'];
  $phone = $_POST['phone'];
  $sql = "UPDATE user
       SET username = '$username',
         organisation ='$organisation',
         location='$location',
         phone='$phone'
         WHERE 
         email ='$userEmail'";
  //session to send email from profileDetails.php -> index.php
  $_SESSION['email'] = $userEmail;

  $query = $pdo->prepare($sql);
  $query->execute();
  $user = $query->fetchAll();
  echo "sign in complete!";
  header('Location:index.php');
  exit;
}
if (!empty($_POST['changePassword'])) {
  $currentPassword = $_POST['currentPassword'];
  $newPassword = $_POST['newPassword'];
  if (password_verify($currentPassword, $user['password'])) {
    $newPassword = password_hash($newPassword, PASSWORD_DEFAULT);
    $sql = "UPDATE user
       SET password = '$newPassword'
       WHERE 
         email ='$userEmail'";
    $query = $pdo->prepare($sql);
    $query->execute();
    $user = $query->fetchAll();
    $_SESSION['email'] = $userEmail;
    echo "password CHANGED";
    header('Location:index.php');
    exit;
  } else {
    $msg = "Invalid password";
  }
}
if (!empty($_POST['changePhoto'])) {
  //image
  $pname = $_FILES["file"]["name"];
  if ($pname == NULL) {
    $pname = 'default_pic.png';
  }
  #temporary file name to store file
  $tname = $_FILES["file"]["tmp_name"];
  echo $tname;
  //  #upload directory path
  move_uploaded_file($tname, 'images/' . $pname);
  $sql = "UPDATE user
       SET picture = '$pname'
       WHERE 
         email ='$userEmail'
       ";

  $query = $pdo->prepare($sql);
  $query->execute();
  $user = $query->fetchAll();
  $_SESSION['email'] = $userEmail;
  header('Location:index.php');
  exit;
}
$template = "profileDetails";
$pagetitle = "Bluedit";
include "./mainLayer.phtml";
