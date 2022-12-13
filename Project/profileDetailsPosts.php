<?php
include './connect.php';
session_start();
$userEmail = $_SESSION['email'];


$query = $pdo->prepare("SELECT * FROM user where email = '$userEmail' ");
$query->execute();

$user = $query->fetch();
$userId = $user['id'];

$query2 = $pdo->prepare("SELECT * FROM posts  where postedById ='$userId' order by postDate DESC  ");
$query2->execute();
$posts = $query2->fetchAll();

$query5 = $pdo->prepare("SELECT * FROM notification");
$query5->execute();
$notification = $query5->fetchAll();
if (!empty($_POST)) {
  $postId = $_POST['postId'];
  echo $postId;
  $sql = "DELETE FROM posts WHERE id= '$postId'";
  $query2 = $pdo->prepare($sql);
  $query2->execute();
  $posts = $query2->fetchAll();

  $_SESSION['email'] = $userEmail;
  header('Location:profileDetailsPosts.php');
  exit;
}
$template = "profileDetailsPosts";
$pagetitle = "Bluedit";
include "./mainLayer.phtml";
