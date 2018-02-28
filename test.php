<?php
function_exists(date_default_timezone_set);
date_default_timezone_set('PRC');
$comment_time=date('Y-m-d H:i:s', time());
echo $comment_time;
?>