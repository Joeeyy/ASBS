<?php
include 'dbconnect.php';
include 'common.php';

session_start();

function_exists(date_default_timezone_set);
date_default_timezone_set('PRC');

$user_name=$_POST['login-username'];
$user_pwd=$_POST['login-pwd-md5'];
$login_time=date('Y-m-d H:i:s', time());
$login_ip = get_client_ip(0,false);

$sql = "select * from user where user_name='".$user_name. "'";
$result = mysqli_query($conn, $sql);
if(!$result){
    alert('用户名或密码错误！');
    goBack();
}
$row = mysqli_fetch_assoc($result);
$user_id=$row['user_id'];
if(!$user_pwd==$row['user_pwd']){
    alert("用户名或密码错误！");
    goBack();
}else{
    $sql="update user set last_login_time='". $login_time. "', last_login_ip='". $login_ip. "' where user_id=". $user_id;
    $result=mysqli_query($conn, $sql);
    if($result){
        alert("登录成功！");
        $_SESSION['user_id']=$row['user_id'];
        $_SESSION['user_name']=$row['user_name'];
        goToPage('../index.php');
    }
    else{
        alert("登录失败！");
        goBack();
    }
}

if (!$result===NULL)
    mysqli_free_result($result);
$conn->close();
?>