<?php
include 'dbconnect.php';
include 'common.php';

function_exists(date_default_timezone_set);
date_default_timezone_set('PRC');

$comment_uid=$_POST['comment_uid'];
$blog_id=$_POST['blog_id'];
$comment_content=$_POST['comment_content'];
$comment_content=addslashes_deep($comment_content);
$comment_content=remove_xss($comment_content);
$comment_time=date('Y-m-d H:i:s', time());
$author_id=$_POST['author_id'];
$my_name=$_POST['my_name'];

$sql="insert into comment(blog_id, comment_uid, comment_content, comment_time) values('".$blog_id. "','". $comment_uid. "','". $comment_content. "','". $comment_time. "')";
$result=mysqli_query($conn, $sql);
if(!$result){
    alert("因未知原因评论失败，请重新尝试。");
    echo $sql;
    //goBack();
}

$sql="insert into message(msg_type_id, msg_content, msg_time, msg_sender, msg_receiver) values('1','<a href=\'./article.php?blog_id=". $blog_id. "\'>". $my_name. "评论了您。</a>','".$comment_time."','". $comment_uid."','". $author_id."')";
$result=mysqli_query($conn, $sql);
if(!$result){
    alert("因未知原因评论失败，请重新尝试。");
    echo $sql;
    //goBack();
}else{
    alert("评论成功！");
    goBack();
}
$conn->close();
?>
