<?php
include 'dbconnect.php';
include 'common.php';

function_exists(date_default_timezone_set);
date_default_timezone_set('PRC');

$user_id=$_POST['user_id'];
$blog_title=$_POST['blog_title'];
$blog_content=$_POST['blog_content'];
$blog_content=addslashes_deep($blog_content);
$blog_content=remove_xss($blog_content);
$release_time=date('Y-m-d H:i:s', time());
$blog_type_id=$_POST['blog_type_id'];
$tags=$_POST['blog_tags'];

$tags_length=strlen($tags);
$last_char=substr($tags, $tags_length-1, 1);
if($last_char==";"){
    $tags=substr($tags, 0, $tags_length-1);
}

$tag_array=explode(';',$tags);
$tag_num=count($tag_array);
for($i=0;$i<$tag_num;$i++){
    $tag=$tag_array[$i];
    $sql="select * from tag where tag_name='".$tag ."'";
    $result=mysqli_query($conn, $sql);
    if($result->num_rows==0){
        $sql="insert into tag(tag_name, tag_count) values('". $tag. "','1')";
        $result=mysqli_query($conn, $sql);
    }else{
        $sql="update tag set tag_count=tag_count+1 where tag_name='". $tag. "'";
        $result=mysqli_query($conn, $sql);
    }
}

$sql="insert into blog(user_id, blog_title, blog_content, blog_type_id, release_time, tags) values('".$user_id. "','". $blog_title. "','". $blog_content. "','". $blog_type_id. "','". $release_time. "','". $tags."')";
$result=mysqli_query($conn, $sql);
if(!$result){
    alert("因未知原因保存文章，请重新尝试。");
    goBack();
}else{
    $sql="select * from blog natural join blog_types where blog_title='". $blog_title. "' and release_time='". $release_time. "'";
    $result=mysqli_query($conn, $sql);
    $row=mysqli_fetch_assoc($result);
    $blog_type_name=$row['blog_type_name'];
    $blog_id=$row['blog_id'];

    $xmlpatch = '../search.xml';

    $doc = new DOMDocument();
    $doc -> formatOutput = true;

    if($doc -> load($xmlpatch)) {
        $document = $doc -> documentElement;//获得根节点(root)

        $entry = $doc->createElement("entry");
        $entry = $document->appendChild($entry);

        $title = $doc->createElement("title");
        $title = $entry->appendChild($title);
        $title->appendChild($doc->createCDATASection($blog_title));

        $url = $doc->createElement("url");
        $url = $entry->appendChild($url);
        $url->appendChild($doc->createTextNode("http://localhost/ASBS/article?blog_id=". $blog_id));

        $content = $doc->createElement("content");
        $content = $entry->appendChild($content);
        $content->appendChild($doc->createCDATASection($blog_content));
        $type = $doc->createAttribute("type");
        $contenttype = $doc->createTextNode("text");
        $type->appendChild($contenttype);
        $content->appendChild($type);

        $category = $doc->createElement("category");
        $category = $entry->appendChild($category);
        $category->appendChild($doc->createTextNode($blog_type_name));

        $tags = $doc->createElement("tags");
        $tags = $entry->appendChild($tags);
        for($j=0;$j<$tag_num;$j++){
            $tag = $doc->createElement("tag");
            $tags->appendChild($tag);
            $tag->appendChild($doc->createTextNode($tag_array[$j]));
        }
        $document->appendChild($entry);
    }
    $doc -> save($xmlpatch);//保存文件

    alert("发布博客成功！");
    goBack();
}
$conn->close();
?>
