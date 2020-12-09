<?php

$subject = "You have been contacted by ";
$success_message = "Your messege has been sent sucesfully!";
$fail_message = "Sorry, something went wrong! Please try again.";

// Configuration option.
// Enter the email address that you want to emails to be sent to.
// Example $admin_email = "example@yourdomain.com";

//$admin_email = "example@example.com";

$admin_email = 'example@example.com'; //Replace this with your email id

$validate = true;
$name = filter_var($_POST['name'], FILTER_SANITIZE_SPECIAL_CHARS);
$email = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);
$msg = filter_var($_POST['message'], FILTER_SANITIZE_SPECIAL_CHARS);

if (!($name && $email && $msg)) {
	$validate = FALSE;
}

if (!defined("PHP_EOL")) define("PHP_EOL", "\r\n");

// Message

$e_body = "You have been contacted by $name. Their additional message is as follows." . PHP_EOL . PHP_EOL;
$e_content = "\"$msg\"" . PHP_EOL . PHP_EOL;
$e_reply = "You can contact $name via email, $email";


$message = wordwrap( $e_body . $e_content . $e_reply, 70 );

$headers = "From: $email" . PHP_EOL;
$headers .= "Reply-To: $email" . PHP_EOL;
$headers .= "MIME-Version: 1.0" . PHP_EOL;
$headers .= "Content-type: text/plain; charset=utf-8" . PHP_EOL;
$headers .= "Content-Transfer-Encoding: quoted-printable" . PHP_EOL;

// Mail it
if ($validate && mail( $admin_email, "$subject by $name", $message, $headers)) {
	echo $success_message;
} else {
	echo $fail_message;
};