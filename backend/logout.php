<?php
include './common.php';

session_start();

$_SESSION['user_id']='1';
$_SESSION['user_name']='Guest';
$result_dest = session_destroy();

alert('成功登出');
goToPage("../index.php");

?>
