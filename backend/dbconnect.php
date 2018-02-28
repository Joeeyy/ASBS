<?php
    include "dbconfig.php";

    $conn = mysqli_connect($host, $user, $password, $database) or die('连接数据库失败！');
?>