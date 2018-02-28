<?php
include './common.php';
include './dbconnect.php';

$user_id=$_GET['user_id'];
$news_platform_id=$_GET['news_platform_id'];

if($user_id=='1'){
    alert('请先登录');
    goBack();
}

$sql="select * from news_subscribtion where user_id=". $user_id. " and news_platform_id=". $news_platform_id;
$result=mysqli_query($conn, $sql);
if($result===NULL){
    alert('当前未订阅，取消失败。');
    goBack();
}
$sql="delete from news_subscribtion where user_id=\"". $user_id."\" and news_platform_id = \"".$news_platform_id. "\"";
$result=mysqli_query($conn, $sql);
if(!$result){
    alert("取消订阅失败，请重试。");
    goBack();
}
else{
    alert("取消订阅成功！");
    goBack();
}
if (!$result===NULL)
    mysqli_free_result($result);
$conn->close();
?>