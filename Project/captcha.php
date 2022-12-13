<?php
  session_start();
  // generate captcha code
  $random_num    = md5(random_bytes(64));
  $captcha_code  = substr($random_num, 0, 6);
  // assign captcha in session
  $_SESSION['CAPTCHA_CODE'] = $captcha_code;
  // create captcha image
  $layer = imagecreatetruecolor(168, 37);
  $captcha_bg = imagecolorallocate($layer, 255, 255, 255);
  imagefill($layer, 0, 0, $captcha_bg);
  $captcha_text_color = imagecolorallocate($layer, 0, 0, 0);
  imagestring($layer, 5, 55, 10, $captcha_code, $captcha_text_color);
  //we send the image to form
  header("Content-type: image/jpeg");
  imagejpeg($layer);
