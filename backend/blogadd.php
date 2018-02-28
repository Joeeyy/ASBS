<?php
include 'common.php';
include 'dbconnect.php';

function_exists(date_default_timezone_set);
date_default_timezone_set('PRC');

$blog_id=$_POST['blog_id'];
$added_content=$_POST['added_content'];
$added_content=addslashes_deep($added_content);
$added_content=remove_xss($added_content);
$added_time=date('Y-m-d H:i:s', time());

$sql="insert into blog_added(blog_id, added_content, added_time) values('". $blog_id. "','". $added_content. "','". $added_time. "')";
$result=mysqli_query($conn, $sql);
if(!$result){
    alert("添加失败！");
    goBack();
}
else{
    alert("添加成功！");
    goBack();
}

if(!$result===NULL){
    mysqli_free_result($result);
}
$conn->close();
?>