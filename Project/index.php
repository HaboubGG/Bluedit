<?php
//data base connection
include './connect.php';
session_start();
if (!isset($_SESSION['email'])) {
  header('Location:login.php');
  exit;
} else {
  $userEmail = $_SESSION['email'];
  //receive email from session 

  //****************user************/
  $query = $pdo->prepare("SELECT * FROM user where email = '$userEmail' ");
  $query->execute();
  //we used fetch() cause we only have one row 
  $user = $query->fetch();
  //****************Posts************/
  $query2 = $pdo->prepare("SELECT * FROM posts order by postDate DESC ");
  $query2->execute();
  $posts = $query2->fetchAll();
  //****************comments ************/
  $query3 = $pdo->prepare("SELECT * FROM comments");
  $query3->execute();
  $comments = $query3->fetchAll();
  //****************jaimeVerif************/
  $query4 = $pdo->prepare("SELECT * FROM jaimeverif");
  $query4->execute();
  $jaimeverif = $query4->fetchAll();
  //**********notifications */
  $query5 = $pdo->prepare("SELECT * FROM notification");
  $query5->execute();
  $notification = $query5->fetchAll();

  //update status
  if (!empty($_POST['postButton'])) {
    $description = $_POST['description'];

    $postedBy = $user['username'];
    $postedById = $user['id'];

    $postedByImage = $user['picture'];

    //image
    $pname = $_FILES["file"]["name"];

    #temporary file name to store file
    $tname = $_FILES["file"]["tmp_name"];

    //  #upload directory path
    move_uploaded_file($tname, 'images/' . $pname);
    $sql = "INSERT INTO posts (description,postPhoto,postedBy,postedById,postedByImage)  VALUES ('$description','$pname','$postedBy','$postedById','$postedByImage')";
    $query2 = $pdo->prepare($sql);
    $query2->execute();
    $posts = $query2->fetchAll();
    header('Location:index.php');
    exit;
  }

  //Comment

  if (!empty($_POST['commentButton'])) {
    //lezemna ncheckiw idha el comment mahoush feragh , khater el post deja fiha el id w commentedBy
    // we need to check $_POST['comment'] because in $_POST['commentButton'] we already have id and commentedBy hidden    
    if ($_POST['comment']) {
      $comment = $_POST['comment'];
      $postId = $_POST['postId'];
      $commentedBy = $_POST['commentedBy'];
      $commentedByImage = $user['picture'];
      $postedById = $_POST['postedById'];
      $notificationByy = $user['username'];
      $sql = "INSERT INTO comments (comment , postId , commentedBy,commentedByImage)  VALUES ('$comment' , '$postId' , '$commentedBy','$commentedByImage')";
      $query3 = $pdo->prepare($sql);
      $query3->execute();
      $comments = $query3->fetchAll();

      $sqlNotification = "INSERT INTO notification ( userIdNotification,notificationType,notificationByName ) 
                              VALUES ('$postedById' , 0, '$notificationByy')";
      $query5 = $pdo->prepare($sqlNotification);
      $query5->execute();
      $notification = $query5->fetchAll();
      header('Location:index.php');
      exit;
    }
  }
  //Like
  if (!empty($_POST['likeButton'])) {

    $postId = $_POST['postId'];
    $userId = $user['id'];
    $postedById = $_POST['postedById'];
    $notificationByy = $user['username'];
    $sqlVerif = "SELECT * FROM jaimeverif WHERE postId = '$postId' and userId = '$userId' ";
    $Verif = $pdo->prepare($sqlVerif);
    $Verif->execute();
    $Verifcount = $Verif->rowCount();
    //make sure that user can like only one time 
    //verification bch ncheckiw idha el lqina postId m3a userId fl tableau
    if ($Verifcount == 0) {
      //jaimeverif 
      $sqlJaime = "INSERT INTO jaimeverif (postId , userId) VALUES ('$postId' , '$userId') ";
      $query4 = $pdo->prepare($sqlJaime);
      $query4->execute();
      $jaimeverif = $query4->fetchAll();

      $sqlNotification = "INSERT INTO notification ( userIdNotification,notificationType,notificationByName ) 
                              VALUES ('$postedById' , 1, '$notificationByy')";
      $query5 = $pdo->prepare($sqlNotification);
      $query5->execute();
      $notification = $query5->fetchAll();

      //adding like to post
      $sql = "UPDATE posts
        SET jaime = jaime + 1
          WHERE 
          id ='$postId'";
      $query2 = $pdo->prepare($sql);
      $query2->execute();
      $posts = $query2->fetchAll();
      header('Location:index.php');
      exit;
    }
  }
  if (!empty($_POST['logout'])) {
    session_destroy();
    //destroy the session
    header('Location:login.php');
    exit;
  }
  $template = "index";
  $pagetitle = "Bluedit";
  include "./mainLayer.phtml";
}
