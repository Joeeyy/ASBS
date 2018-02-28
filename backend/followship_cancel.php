<?php
include 'dbconnect.php';
include 'common.php';


$befollowed_user_id=$_POST['befollowed_user_id'];
$user_id=$_POST['user_id'];

$sql="delete from followship where befollowed_user_id='". $befollowed_user_id. "' and follower_id='". $user_id. "'";
$result=mysqli_query($conn, $sql);
if (!$result){
    alert("取消关注失败。");
    goBack();
}else{
    alert("取消关注成功。");
    goBack();
}

if(!$result===NULL){
    mysqli_free_result($result);
}
$conn->close();
?>