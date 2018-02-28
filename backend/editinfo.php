<?php
include 'dbconnect.php';
include 'common.php';

$user_id=$_POST['user_id'];
$user_email=$_POST['edit-email'];
$user_phone=$_POST['edit-phone'];
$user_gender=$_POST['edit-gender'];
$user_info=$_POST['edit-profile'];

$sql="update user set user_email='". $user_email. "', user_gender='". $user_gender. "', user_phone_number='". $user_phone. "', user_info='". $user_info. "' where user_id=". $user_id;
$result=mysqli_query($conn, $sql);
if(!$result){
    alert("用户信息修改失败！");
    goBack();
}else{
    alert("用户信息修改成功！");
    goBack();
}

if(!$result===NULL){
    mysqli_free_result($result);
}
$conn->close();
?>
