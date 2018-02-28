<?php
include 'dbconnect.php';
include 'common.php';

function_exists(date_default_timezone_set);
date_default_timezone_set('PRC');

$follower_id=$_POST['reader_id'];
$follower_name=$_POST['reader_name'];
$befollowed_user_id=$_POST['user_id'];
$follow_time=date('Y-m-d H:i:s', time());

if($follower_id==1){
    alert("请先登录！");
    goBack();
}
else{
    $sql = "insert into followship(befollowed_user_id, follower_id) values('$befollowed_user_id','$follower_id')";
    $result=mysqli_query($conn, $sql);
    if(!$result){
        alert("关注失败！");
        goBack();
    }

    $sql="insert into message(msg_type_id, msg_content, msg_time, msg_sender, msg_receiver) values('1','<a href=\'./user.php?user_id=". $reader_id. "\'>". $follower_name. "</a>关注了您。','".$follow_time."','". $follower_id."','". $befollowed_user_id."')";
    echo $sql;
    $result=mysqli_query($conn, $sql);
    if($result){
        alert("关注成功！");
        goBack();
    }
    else{
        alert("关注失败。");
        goBack();
    }
}
if(!$result===NULL){
    mysqli_free_result($result);
}
$conn->close();
?>