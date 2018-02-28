<?php
include 'dbconnect.php';
include 'common.php';

$user_name=$_POST['regis-username'];
$user_pwd=$_POST['regis-pwd-md5'];
$user_email=$_POST['regis-email'];
$user_phone=$_POST['regis-phone'];
$user_gender=$_POST['regis-gender'];

$sql="select user_name from user where user_name=$username";
$result=mysqli_query($conn, $sql);
if($result){
    alert("用户名已存在，请重新输入用户名！");
    goBack();
}
$sql="insert into user(user_name,user_pwd,user_email,user_phone_number,user_gender,user_type) values('". $user_name. "','". $user_pwd ."','". $user_email ."','". $user_phone. "','". $user_gender. "','1')";
$result=mysqli_query($conn, $sql);
if(!$result){
    alert("因未知原因注册失败，请重新尝试。");
    goBack();
}else{
    alert("注册成功！");
    goBack();
}

$conn->close();
?>
