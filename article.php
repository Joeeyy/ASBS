<?php
include './backend/common.php';
include './backend/dbconnect.php';

session_start();
if (!isset($_SESSION['user_id'])){
    $_SESSION['user_id']='1';
    $_SESSION['user_name']='Guest';
}
if ($_SESSION['user_id']=='1'){
    $login_icon="<li class=\"menu-item menu-item-login\" style=\"opacity: 1; transform: translateY(0px);\">
                                <a href=\"javascript:;\" class=\"popup-trigger2\">
                                    <i class=\"menu-login-icon fa fa-fw fa-user\"></i>
                                    <br>
                                    登录
                                </a>
                            </li>";

}
else{
    $login_icon="<li class=\"menu-item menu-item-mine\" style=\"opacity: 1; transform: translateY(0px);\">
                                <a href=\"user?user_id=". $_SESSION['user_id']. "\" class=\"undefined\">
                                    <i class=\"menu-login-icon fa fa-fw fa-star\"></i>
                                    <br>
                                    我的
                                </a>
                            </li>";
}
$blog_id = $_GET['blog_id'];
if (!isset($blog_id)){
    alert('未设置文章id。');
    goToPage('index.php');//未设置文章id
}
$sql="select * from blog where blog_id=$blog_id";
$result=mysqli_query($conn, $sql);
if(!$result){
    alert('文章找不到。');
    goToPage('index.php');
}
$row=mysqli_fetch_assoc($result);

$blog_title=$row['blog_title'];
$author_id=$row['user_id'];
$blog_content=$row['blog_content'];
$blog_type_id=$row['blog_type_id'];
$blog_time=$row['release_time'];
$authentic=$row['authentic'];//考虑删除
$read_count=$row['read_count'];
$tags=$row['tags'];

$sql="select user_name from user where user_id=$author_id";
$result=mysqli_query($conn, $sql);
if(!$result){
    $author_name='Unknown';
}
else{
    $row=mysqli_fetch_assoc($result);
    $author_name=$row['user_name'];
}
$sql="select blog_type_name from blog_types where blog_type_id=$blog_type_id";
$result=mysqli_query($conn, $sql);
if(!$result){
    $blog_type_name='Unknown';
}
else{
    $row=mysqli_fetch_assoc($result);
    $blog_type_name=$row['blog_type_name'];
}

$tag_array=explode(';',$tags);
$tag_num=count($tag_array);

$sql="select * from comment where blog_id=$blog_id";
$result=mysqli_query($conn, $sql);
if(!$result){
    $comment_num=0;
}
else{
    $comment_num=$result->num_rows;
    $comment_array=array();
    for($i=0;$i<$comment_num;$i++){
        $row=mysqli_fetch_assoc($result);
        $comment_array[$i]=array();
        $comment_array[$i]['comment_id']=$row['comment_id'];
        $comment_array[$i]['comment_uid']=$row['comment_uid'];
        $comment_array[$i]['comment_content']=$row['comment_content'];
        $comment_array[$i]['comment_time']=$row['comment_time'];

        $sql2="select user_name from user where user_id=". $comment_array[$i]['comment_uid'];
        $result2 = mysqli_query($conn, $sql2);
        $row=mysqli_fetch_assoc($result2);
        $comment_array[$i]['comment_username']=$row['user_name'];
        if (!$result2===NULL)
            mysqli_free_result($result);
    }
}

$sql="select * from blog_added where blog_id=". $blog_id. " order by added_time asc";
$added_array=array();
$result=mysqli_query($conn, $sql);
$added_num=$result->num_rows;
if($added_num<>0){
    for($i=0;$i<$added_num;$i++){
        $added_array[$i]=mysqli_fetch_assoc($result);
    }
}

$sql="update blog set read_count=read_count+1 where blog_id=$blog_id";
$result=mysqli_query($conn, $sql);

if (!$result===NULL)
    mysqli_free_result($result);
$conn->close();
?>
<!DOCTYPE html>
<html class="theme-next muse use-motion">
<head>
    <meta charset="UTF-8">

    <link href="./frontend/lib/fancybox/source/jquery.fancybox.css?v=2.1.5" rel="stylesheet" type="text/css">
    <link href="./frontend/lib/font-awesome/css/font-awesome.min.css?v=4.6.2" rel="stylesheet" type="text/css">
    <link href="./frontend/css/main.css?v=5.1.3" rel="stylesheet" type="text/css">
    <link href="./frontend/lib/img-captcha/css/captcha.css" rel="stylesheet" type="text/css">

    <title> ASBS </title>
    <script type="text/javascript" src="./frontend/lib/marked.js"></script>
    <script type="text/javascript" src="./frontend/lib/highlight.js"></script>
    <script type="text/javascript" id="hexo.configurations">
        var NexT = window.NexT || {};
        var CONFIG = {
            root: '/ASBS/',
            scheme: 'Muse',
            version: '5.1.3',
            sidebar: {"position":"left","display":"post","offset":12,"b2t":false,"scrollpercent":false,"onmobile":false},
            fancybox: true,
            tabs: true,
            motion: {"enable":true,"async":false,"transition":{"post_block":"fadeIn","post_header":"slideDownIn","post_body":"slideDownIn","coll_header":"slideLeftIn","sidebar":"slideUpIn"}},
            duoshuo: {
                userId: '0',
                author: '博主'
            },
            algolia: {
                applicationID: '',
                apiKey: '',
                indexName: '',
                hits: {"per_page":10},
                labels: {"input_placeholder":"Search for Posts","hits_empty":"We didn't find any results for the search: ${query}","hits_stats":"${hits} results found in ${time} ms"}
            }
        };
    </script>
</head>

<body>
<div class="container sidebar-position-left page-home">
    <div class="headband"></div>
    <header id="header" class="header" itemscope itertype="http://schema.org/WPHeader">
        <div class="header-inner">
            <div class="site-brand-wrapper">
                <div class="site-meta">
                    <div class="custom-logo-site-title">
                        <a href="./" class="brand" rel="start" style="opacity: 1;">
                                    <span class="logo-line-before">
                                        <i></i>
                                    </span>
                            <span class="site-title" style="opacity: 1; top: 0px;">ASBS</span>
                            <span class="logo-line-after">
                                        <i></i>
                                    </span>
                        </a>
                    </div>
                    <p class="site-subtitle" style="opacity: 1; top: 0px;"> This is subtitile</p>
                </div>
                <div class="site-nav-toggle">
                    <button>
                        <span class="btn-bar"></span>
                        <span class="btn-bar"></span>
                        <span class="btn-bar"></span>
                    </button>
                </div>
            </div>
            <nav class="site-nav">
                <ul id="menu" class="menu">
                    <li class="menu-item menu-item-home" style="opacity: 1; transform: translateY(0px);">
                        <a href="./index.php" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-home"></i>
                            <br>
                            首页
                        </a>
                    </li>
                    <li class="menu-item menu-item-data" style="opacity: 1; transform: translateY(0px);">
                        <a href="./statistics.php" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-area-chart"></i>
                            <br>
                            统计
                        </a>
                    </li>
                    <li class="menu-item menu-item-platform" style="opacity: 1; transform: translateY(0px);">
                        <a href="./platform.php" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-th"></i>
                            <br>
                            平台
                        </a>
                    </li>
                    <li class="menu-item menu-item-tags" style="opacity: 1; transform: translateY(0px);">
                        <a href="./tags.php" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-tags"></i>
                            <br>
                            标签
                        </a>
                    </li>
                    <li class="menu-item menu-item-following" style="opacity: 1; transform: translateY(0px);">
                        <a href="#" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-users"></i>
                            <br>
                            关注人
                        </a>
                    </li>
                    <li class="menu-item menu-item-search" style="opacity: 1; transform: translateY(0px);">
                        <a href="javascript:;" class="popup-trigger">
                            <i class="menu-item-icon fa fa-fw fa-search"></i>
                            <br>
                            搜索
                        </a>
                    </li>
                    <?php echo $login_icon;?>
                </ul>
                <div class="site-search">
                    <div class="popup search-popup local-search-popup">
                        <div class="local-search-header clearfix">
                                    <span class="search-icon">
                                        <i class="fa fa-search"></i>
                                    </span>
                            <span class="popup-btn-close">
                                        <i class="fa fa-times-circle"></i>
                                    </span>
                            <span class="local-search-input-wrapper">
                                        <input autocomplete="off" placeholder="搜索..." spellcheck="false" type="text" id="local-search-input">
                                    </span>
                        </div>
                        <div id="local-search-result"></div>
                    </div>
                </div>
                <div class="site-login">
                    <div class="popup2 login-popup local-login-popup">
                        <div class="local-login-header clearfix">
                                    <span class="login-icon">
                                        <i class="fa fa-user"></i>
                                    </span>
                            <span class="popup-btn-close">
                                        <i class="fa fa-times-circle"></i>
                                    </span>
                            <span class="local-login-input-wrapper">
                                        用户登录
                                    </span>
                        </div>
                        <form action="./backend/login.php" method="post" onsubmit="return loginCheck()">
                            <div class="local-login-body">
                                <div class="form-group">
                                    <i class="fa fa-user"></i>
                                    <span class="form-item">
                                                <input placeholder="请输入用户名" maxlength="12" id="login-username" name="login-username">
                                            </span>
                                </div>
                                <div class="form-group">
                                    <i class="fa fa-lock"></i>
                                    <span class="form-item">
                                                <input placeholder="请输入密码" required maxlength="16" type="password" id="login-pwd" name="login-pwd">
                                                <input type="hidden" id="login-pwd-md5" name="login-pwd-md5">
                                            </span>
                                </div>
                                <canvas id="canvas_login" width="250" height="200"></canvas>
                                <div class="form-group" style="margin-top:20px;">
                                    <button type="button" class="btn btn-block btn-default go-regis">注册新账户</button>
                                    <button type="submit" class="btn btn-block btn-default" name="login_btn" id="login_btn" disabled="true" style="float: right;">验证并登录</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="blod_add">
                    <div class="blogadd-popup login-popup local-login-popup" style="height:auto;width: 700px; left: 50%; margin-left: -350px">
                        <div class="local-login-header clearfix">
                                    <span class="login-icon">
                                        <i class="fa fa-pencil"></i>
                                    </span>
                            <span class="popup-btn-close">
                                        <i class="fa fa-times-circle"></i>
                                    </span>
                            <span class="local-login-input-wrapper">
                                博文内容追加
                                    </span>
                        </div>
                        <div id="vcomments" class="valine">
                            <div class="vwrap">
                                <form action="./backend/blogadd.php" method="post" onsubmit="return checkArticle()">
                                    <div class="vedit">
                                        <textarea autocomplete="off" required class="veditor vinput" name="added_content" id="added_content" placeholder="请使用markdown语法编写文章。" style="height: 320px;"></textarea>
                                        <input hidden name="blog_id" id="blog_id" <?php echo 'value="' . $blog_id . '"'; ?>>
                                    </div>
                                    <div class="vcontrol">
                                        <div class="vright" style="float: right;">
                                            <button id="release_btn" name="release_btn" type="submit" class="btn btn-block btn-default" style="font-size: 13px;">
                                                追加内容
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="site-register">
                    <div class="popup3 login-popup local-login-popup">
                        <div class="local-login-header clearfix">
                            <span class="login-icon">
                                <i class="fa fa-user"></i>
                            </span>
                            <span class="popup-btn-close">
                                <i class="fa fa-times-circle"></i>
                            </span>
                            <span class="local-login-input-wrapper">
                                用户注册
                            </span>
                        </div>
                        <form action="./backend/regis.php" method="post" onsubmit="return regisCheck()">
                            <div class="local-login-body">
                                <div class="form-group">
                                    <i class="fa fa-user"></i>
                                    <span class="form-item">
                                                <input placeholder="请输入用户名" required maxlength="12" id="regis-username" name="regis-username" oninput="checkUsername()">
                                            </span>
                                    <div id="regis-username-failinfo"></div>
                                </div>
                                <div class="form-group">
                                    <i class="fa fa-lock"></i>
                                    <span class="form-item">
                                                <input placeholder="请输入密码" required maxlength="16" type="password" id="regis-pwd" name="regis-pwd" oninput="checkPassword()">
                                                <input type="hidden" id="regis-pwd-md5" name="regis-pwd-md5">
                                            </span>
                                    <div id="regis-pwd-failinfo"></div>
                                </div>
                                <div class="form-group">
                                    <i class="fa fa-lock"></i>
                                    <span class="form-item">
                                                <input placeholder="请再次输入密码以确认" required maxlength="16" type="password" id="regis-re-pwd" name="regis-re-pwd" oninput="checkRePassword()">
                                            </span>
                                    <div id="regis-pwdre-failinfo"></div>
                                </div>
                                <div class="form-group">
                                    <input type="radio" value="0" id="regis-gender-man" checked="checked" name="regis-gender" style="margin-right: 5px">男
                                    <input type="radio" value="1" id="regis-gender-woman" name="regis-gender" style="margin-left: 20px;margin-right:5px">女
                                </div>
                                <div class="form-group">
                                    <i class="fa fa-mobile-phone"></i>
                                    <span class="form-item">
                                                <input placeholder="手机号码" maxlength="16" type="number" pattern="^1[345678][0-9]{9}$" id="regis-phone" name="regis-phone">
                                            </span>
                                </div>
                                <div class="form-group">
                                    <i class="fa fa-lock"></i>
                                    <span class="form-item">
                                                <input placeholder="邮箱" maxlength="50" type="email" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" id="regis-email" name="regis-email">
                                            </span>
                                </div>
                                <canvas id="canvas_regis" width="250" height="200"></canvas>
                                <div class="form-group" style="margin-top:20px;">
                                    <button type="button" class="btn btn-block btn-default go-login">已注册去登录</button>
                                    <button type="submit" class="btn btn-block btn-default" name="regis_btn" id="regis_btn" disabled="true" style="float: right;">验证并注册</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </header>

    <main id="main" class="main">
        <div class="main-inner">
            <div class="content-wrap">
                <div class="content" id="content">
                    <div id="posts" class="posts-expand">
                        <article class="post-type-normal" itemscope itemtype="http://schema.org/Article">
                            <div class="post-block" style="opacity: 1; display: block;">
                                <link itemprop="mainEntityOfPage" href="http://ainassine.top/blog/public/blog/public/2018/01/23/mac-pip-install">
                                <span hidden="" itemprop="author" itemscope="" itemtype="http://schema.org/Person">
                                    <meta itemprop="name" content="Ainassine">
                                    <meta itemprop="description" content="">
                                    <meta itemprop="image" content="/blog/public/images/1.png">
                                </span>
                                <span hidden="" itemprop="publisher" itemscope="" itemtype="http://schema.org/Organization">
                                    <meta itemprop="name" content="Ainassine's Blog">
                                </span>
                                <header class="post-header" style="opacity: 1; display: block; transform: translateY(0px);">
                                    <h1 class="post-title" itemprop="name headline"><?php echo $blog_title;?></h1>
                                    <div class="post-meta">
                                        <span class="post-time">
                                            <span class="post-meta-item-icon">
                                                <i class="fa fa-calendar-o"></i>
                                            </span>
                                            <a class="post-meta-item-text" href="./user.php?user_id=<?php echo $author_id;?>"><?php echo $author_name;?></a>
                                            <span class="post-meta-item-text">发表于</span>
                                            <time title="创建于" itemprop="dateCreated datePublished">
                                                <?echo $blog_time;?>
                                            </time>
                                        </span>
                                        <span class="post-category">
                                            <span class="post-meta-divider">|</span>
                                            <span class="post-meta-item-icon">
                                                <i class="fa fa-folder-o"></i>
                                            </span>
                                            <span class="post-meta-item-text">分类于</span>
                                            <span itemprop="about" itemscope="" itemtype="http://schema.org/Thing">
                                                <a href="./articlesofcategory.php?blog_type=<?echo $blog_type_name;?>"itemprop="url" rel="index">
                                                    <span itemprop="name"><?php echo $blog_type_name;?></span>
                                                </a>
                                            </span>
                                        </span>
                                        <span id="blog_name" class="leancloud_visitors" data-flag-title="mac-pip-install">
                                            <span class="post-meta-divider">|</span>
                                            <span class="post-meta-item-icon">
                                                <i class="fa fa-eye"></i>
                                            </span>
                                            <span class="post-meta-item-text">阅读次数:</span>
                                            <span class="leancloud-visitors-count"><?php echo $read_count;?></span>
                                        </span>
                                    </div>
                                </header>
                                <div class="post-body" id="post-body" itemprop="articleBody" style="opacity: 1; display: block; transform: translateY(0px);"></div>
                                <?php
                                    echo '<textarea id="article-md" hidden>'.
                                        $blog_content;
                                    for($i=0;$i<$added_num;$i++){
                                        echo '<br><br><br><br>----------以下内容追加于 '. $added_array[$i]['added_time']. '----------<br><br>'.
                                            $added_array[$i]['added_content'];
                                    }
                                    echo '</textarea>';
                                php?>
                                <footer class="post-footer">
                                    <div class="post-tags">
                                        <?php
                                        foreach($tag_array as $tag)
                                            echo '<a href="./articlesoftag.php?blog_tag='. $tag.'" rel="tag"><i class="fa fa-tag"></i> '. $tag. '</a>';
                                        ?>
                                    </div>
                                    <div class="post-nav">
                                        <div class="post-nav-next post-nav-item">
                                            <a href="#" rel="next" title="None">
                                                <i class="fa fa-chevron-left"></i> None
                                            </a>
                                        </div>
                                        <?php
                                        if($_SESSION['user_id']==$author_id){
                                            echo "<div class=\"post-nav-next post-nav-item\">
                                            <button class=\"blogadd-panel-trigger btn btn-primary btn-block\"><b>博文追加</b></button>
                                        </div>";
                                        }
                                        ?>
                                        <span class="post-nav-divider"></span>
                                        <div class="post-nav-prev post-nav-item">
                                            <a href="#" rel="prev" title="None">
                                                None <i class="fa fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </footer>
                            </div>
                        </article>
                        <div class="post-spread">
                        </div>
                    </div>
                </div>
                <div class="comments" id="comments" style="opacity: 1; display: block;">
                    <div id="vcomments" class="valine">
                        <div class="vwrap">
                            <form action="./backend/comment.php" method="post" onsubmit="return checkComment()">
                            <div class="vedit">
                                <textarea required class="veditor vinput" name="comment_content" id="comment_content" placeholder="想说点什么？"></textarea>
                                <input hidden name="blog_id" value="<?php echo $blog_id;?>" id="blog_id">
                                <input hidden name="author_id" value="<?php echo $author_id;?>" id="author_id">
                                <input hidden name="my_name" value="<?php echo $_SESSION['user_name'];?>" id="my_name">
                                <input hidden name="comment_uid" id="comment_uid" <?php echo 'value="'. $_SESSION['user_id']. '"';?>>
                            </div>
                            <div class="vcontrol">
                                <div class="vident">
                                </div>
                                <div class="vright">
                                    <button type="submit" class="btn btn-block btn-default" id="comment_btn" name="comment_btn" style="float: right;">回复</button>
                                </div>
                            </div>
                            <div style="display:none;" class="vmark"></div>
                            </form>
                        </div>

                        <div class="info">
                            <div class="count col">共<span class="num"><?php echo $comment_num;?></span>条评论</div>
                        </div>
                        <ul class="vlist">
                            <li class="vloading" style="display:none;">
                                <div class="spinner"><div class="r1"></div>
                                    <div class="r2"></div>
                                    <div class="r3"></div>
                                    <div class="r4"></div>
                                    <div class="r5"></div>
                                </div>
                            </li>
                            <?php
                            if ($comment_num==0){
                                echo '<li class="vempty" style="display:block;">还没有评论哦，快来抢沙发吧!</li>';
                            }
                            else{
                                foreach($comment_array as $comment){
                                    echo '<li class="vcard" id="'. $comment['comment_id'].'">'.
                                        '<div class="vhead">'.
                                        '<a href="javascript:void(0);" target="_blank">'. $comment['comment_username']. '</a>'.
                                        '<span class="vtime">'. $comment['comment_time']. '</span>'.
                                        '<span rid="'. $comment['comment_id']. '" at="@'. $comment['comment_username']. '" class="vat" onclick="comment2comment(this)">回复</span>'.
                                        '</div>'.
                                        '<div class="vcomment">'. $comment['comment_content']. '</div>'.
                                        '</li>';
                                }
                            }
                            ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <?php
        if($_SESSION['user_id']<>'1'){
            echo "<div class=\"sidebar-toggle\">
            <div class=\"sidebar-toggle-line-wrap\">
                <a class=\"fa fa-sign-out\" href=\"./backend/logout.php\"></a>
            </div>
        </div>";
        }
        ?>
    </main>

    <footer id="footer" class="footer">
        <div class="footer-inner">
            <div class="copyright">
                ©<span itemprop="copyrightYear">2018</span>
                <span class="with-love">
                            <i class="fa fa-heart"></i>
                        </span>
                <span class="author" itemprop="copyrightHolder">Ainassine</span>
            </div>
        </div>
    </footer>
    <div class="back-to-top">
        <i class="fa fa-arrow-up"></i>
    </div>
</div>

<style type="text/css">
    .valine {
        /************ Loading ************/ }
    .valine * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        font-family: -apple-system, BlinkMacSystemFont, 'Mirages Custom', 'Merriweather', 'Open Sans', "Segoe UI", Roboto, "PingFang SC", "Microsoft Yahei", "WenQuanYi Micro Hei", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", Helvetica, Arial, sans-serif;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555;
        -webkit-transition: all .3s ease;
        transition: all .3s ease; }
    .valine .vwrap {
        border: 1px solid #dedede;
        border-radius: 4px;
        margin-bottom: 10px;
        overflow: hidden;
        position: relative; }
    .valine .vwrap .vcontrol {
        background: #fbfbfb;
        font-size: 0; }
    .valine .vwrap .vcontrol .vident {
        font-size: 14px;
        width: 85%;
        display: inline-block;
        padding: 5px;
        vertical-align: middle; }
    .valine .vwrap .vcontrol .vident .vinput {
        width: 33%; }
    .valine .vwrap .vcontrol .vright {
        font-size: 14px;
        padding: 5px;
        display: inline-block;
        width: 15%;
        text-align: right;
        vertical-align: middle; }
    @media screen and (max-width: 520px) {
        .valine .vwrap .vcontrol .vident {
            width: 70%; }
        .valine .vwrap .vcontrol .vident .vinput {
            width: 80%; }
        .valine .vwrap .vcontrol .vright {
            width: 30%; } }
    .valine .vwrap .vcontrol input {
        background: transparent; }
    .valine .vwrap .vmark {
        position: absolute;
        background: rgba(0, 0, 0, 0.65);
        width: 100%;
        height: 100%;
        left: 0;
        top: 0; }
    .valine .vwrap .vmark .valert {
        padding: 15px 0; }
    .valine .vwrap .vmark .valert .vtext {
        color: #fff;
        padding: 15px; }
    .valine .vwrap .vmark .valert .vcode {
        width: 75px;
        border-radius: 5px;
        background: #dedede; }
    .valine .vwrap .vmark .valert .vcode:focus {
        border-color: #3090e4;
        background-color: #fff; }
    @media screen and (max-width: 720px) {
        .valine .vwrap .vmark .valert {
            padding: 30px 0; }
        .valine .vwrap .vmark .valert .vtext {
            color: #fff;
            padding: 10px; } }
    .valine .info {
        font-size: 0;
        padding: 5px; }
    .valine .info .col {
        font-size: 14px;
        display: inline-block;
        width: 50%;
        vertical-align: middle; }
    .valine .power {
        color: #999; }
    .valine a {
        text-decoration: none;
        color: #555; }
    .valine a:hover {
        color: #222; }
    .valine ul,
    .valine li {
        list-style: none; }
    .valine .txt-center {
        text-align: center; }
    .valine .txt-right {
        text-align: right; }
    .valine .pd5 {
        padding: 5px; }
    .valine .pd10 {
        padding: 10px; }
    .valine .veditor {
        width: 100%;
        height: 80px; }
    .valine .vinput {
        border: none;
        resize: none;
        outline: none;
        padding: 8px 10px;
        max-width: 100%; }
    .valine .vbtn {
        display: inline-block;
        margin-bottom: 0;
        font-weight: 400;
        text-align: center;
        vertical-align: middle;
        -ms-touch-action: manipulation;
        touch-action: manipulation;
        cursor: pointer;
        border: 1px solid transparent;
        white-space: nowrap;
        padding: 8px 10px;
        font-size: 14px;
        line-height: 1.42857143;
        border-radius: 4px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        outline: none;
        min-width: 60px;
        max-width: 100%; }
    .valine .vbtn + .vbtn {
        margin-left: 20px; }
    .valine .vbtn:active,
    .valine .vbtn:hover {
        color: #3090e4;
        border-color: #3090e4;
        background-color: #fff; }
    .valine .vlist {
        border-top: 1px solid #dedede;
        border-bottom: 1px solid #dedede;
        padding: 0 10px; }
    .valine .vlist .vcard {
        padding: 8px 0; }
    .valine .vlist .vcard + .vcard {
        border-top: 1px solid #dedede; }
    .valine .vlist .vcard .vhead a {
        font-size: 18px;
        font-weight: 300; }
    .valine .vlist .vcard .vhead .vtime {
        font-size: 12px;
        color: #a9a4a4;
        display: inline-block;
        padding: 0 5px; }
    .valine .vlist .vcard .vhead .vat {
        font-size: 14px;
        color: #999;
        display: inline-block;
        padding: 0 5px;
        cursor: pointer; }
    .valine .vlist .vcard .vhead .vat:hover {
        color: #111; }
    .valine .vlist .vcard .vcomment {
        word-wrap: break-word;
        white-space: pre-wrap;
        word-break: break-all;
        text-align: justify;
        line-height: 1.8; }
    .valine .vlist .vcard .vcomment pre,
    .valine .vlist .vcard .vcomment .code {
        overflow: auto; }
    .valine .vlist .vempty {
        padding: 20px;
        text-align: center;
        color: #999; }
    .valine .spinner {
        margin: 10px auto;
        width: 50px;
        height: 30px;
        text-align: center;
        font-size: 10px; }
    .valine .spinner > div {
        background-color: #9c9c9c;
        height: 100%;
        width: 6px;
        margin-right: 3px;
        display: inline-block;
        -webkit-animation: sk-stretchdelay 1.2s infinite ease-in-out;
        animation: sk-stretchdelay 1.2s infinite ease-in-out; }
    .valine .spinner .r2 {
        -webkit-animation-delay: -1.1s;
        animation-delay: -1.1s; }
    .valine .spinner .r3 {
        -webkit-animation-delay: -1.0s;
        animation-delay: -1.0s; }
    .valine .spinner .r4 {
        -webkit-animation-delay: -0.9s;
        animation-delay: -0.9s; }
    .valine .spinner .r5 {
        -webkit-animation-delay: -0.8s;
        animation-delay: -0.8s; }

    @-webkit-keyframes sk-stretchdelay {
        0%,
        40%,
        100% {
            -webkit-transform: scaleY(0.4); }
        20% {
            -webkit-transform: scaleY(1); } }

    @keyframes sk-stretchdelay {
        0%,
        40%,
        100% {
            transform: scaleY(0.4);
            -webkit-transform: scaleY(0.4); }
        20% {
            transform: scaleY(1);
            -webkit-transform: scaleY(1); } }
</style>
<script type="text/javascript">
    if (Object.prototype.toString.call(window.Promise) !== '[object Function]') {
        window.Promise = null;
    }
</script>
<script type="text/javascript" src="./frontend/lib/jquery/index.js?v=2.1.3"></script>
<script type="text/javascript" src="./frontend/lib/fastclick/lib/fastclick.min.js?v=1.0.6"></script>
<script type="text/javascript" src="./frontend/lib/jquery_lazyload/jquery.lazyload.js?v=1.9.7"></script>
<script type="text/javascript" src="./frontend/lib/velocity/velocity.min.js?v=1.2.1"></script>
<script type="text/javascript" src="./frontend/lib/velocity/velocity.ui.min.js?v=1.2.1"></script>
<script type="text/javascript" src="./frontend/lib/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
<script type="text/javascript" src="./frontend/js/src/utils.js?v=5.1.3"></script>
<script type="text/javascript" src="./frontend/js/src/motion.js?v=5.1.3"></script>
<script type="text/javascript" src="./frontend/js/src/bootstrap.js?v=5.1.3"></script>
<script type="text/javascript" src="./frontend/js/md5.js"></script>
<script type="text/javascript" src="./frontend/lib/img-captcha/src/captcha_login.js"></script>
<script type="text/javascript" src="./frontend/lib/img-captcha/src/captcha_regis.js"></script>
<script type="text/javascript" src="./frontend/lib/img-captcha/src/captcha_comment.js"></script>
<script type="text/javascript">
    imgCaptcha_login('canvas_login', {
        imgurl: ['./frontend/lib/img-captcha/bgimg/demo.jpeg','./frontend/lib/img-captcha/bgimg/demo1.jpeg','./frontend/lib/img-captcha/bgimg/demo2.jpg','./frontend/lib/img-captcha/bgimg/demo3.jpg'],
        cw: 66,
        ch: 66,
        onSuccess: function() {
            $('#login_btn').attr('disabled',false);
        },
        onError: function() {
            console.log("error");
        }
    });
    imgCaptcha_regis('canvas_regis', {
        imgurl: ['./frontend/lib/img-captcha/bgimg/demo.jpeg','./frontend/lib/img-captcha/bgimg/demo1.jpeg','./frontend/lib/img-captcha/bgimg/demo2.jpg','./frontend/lib/img-captcha/bgimg/demo3.jpg'],
        cw: 66,
        ch: 66,
        onSuccess: function() {
            $('#regis_btn').attr('disabled',false);
        },
        onError: function() {
            console.log("error");
        }
    });
    imgCaptcha_comment('canvas_comment', {
        imgurl: ['./frontend/lib/img-captcha/bgimg/demo.jpeg','./frontend/lib/img-captcha/bgimg/demo1.jpeg','./frontend/lib/img-captcha/bgimg/demo2.jpg','./frontend/lib/img-captcha/bgimg/demo3.jpg'],
        cw: 66,
        ch: 66,
        onSuccess: function() {
            $('#comment_btn').attr('disabled',false);
        },
        onError: function() {
            console.log("error");
        }
    });
</script>
<script type="text/javascript">
    function comment2comment(obj){
        var comment_content=document.getElementById('comment_content');
        comment_content.innerHTML = obj.getAttribute('at')+', ';
        comment_content.focus();
        window.location.hash='#vhead';
    }
</script>
<script type="text/javascript">
    hljs.initHighlightingOnLoad();
    marked.setOptions({
        renderer: new marked.Renderer(),
        gfm: true,
        tables: true,
        breaks: true,
        pedantic: false,
        sanitize: false,
        smartLists: true,
        smartypants: false,
        xhtml: true
    });
    marked.setOptions({
        highlight: function (code) {
            return hljs.highlightAuto(code).value;
        }
    });
    var article_md = document.getElementById('article-md').value;
    document.getElementById('post-body').innerHTML = marked(article_md);
</script>
<script type="text/javascript">
    function loginCheck(){
        var login_pwd=document.getElementById('login-pwd');
        var login_pwd_md5=document.getElementById('login-pwd-md5');

        login_pwd_md5.value = hex_md5(login_pwd.value);
        return true;
    }

    function checkRePassword() {
        var passwordre = document.getElementById("regis-re-pwd").value;
        var password = document.getElementById("regis-pwd").value;
        if(passwordre!=password){
            document.getElementById( "regis-pwdre-failinfo").innerHTML = "两次输入的密码不一致";
            document.getElementById( "regis-pwdre-failinfo").style.display = "";
            document.getElementById( "regis-pwdre-failinfo").style.fontSize = "5px";
            return false;
        }else{
            document.getElementById( "regis-pwdre-failinfo").innerHTML = "";
            document.getElementById( "regis-pwdre-failinfo").style.display = "";
            document.getElementById( "regis-pwdre-failinfo").style.fontSize = "5px";
            return true;
        }
    }
    function checkPassword() {
        var password = document.getElementById("regis-pwd").value;
        if(! /^.{6,16}$/.test( password )){
            document.getElementById( "regis-pwd-failinfo").innerHTML = "密码长度须在6-16之间";
            document.getElementById( "regis-pwd-failinfo").style.display = "";
            document.getElementById( "regis-pwd-failinfo").style.fontSize = "5px";
            return false;
        }else{
            document.getElementById( "regis-pwd-failinfo").innerHTML = "";
            document.getElementById( "regis-pwd-failinfo").style.display = "";
            document.getElementById( "regis-pwd-failinfo").style.fontSize = "5px";
            return true;
        }
    }
    function checkUsername() {
        var username = document.getElementById("regis-username").value;
        switch( isUsername( username ) ){
            case 0: {
                changeUsernamePrompt( "" );
                break;
            }
            case 1: {
                changeUsernamePrompt( "用户名格式不正确，用户名不能以数字开头" );
                return false;
            }
            case 2: {
                changeUsernamePrompt( "用户名字符长度有误，合法长度为6-12个字符" );
                return false;
            }
            case 3: {
                changeUsernamePrompt( "用户名含有非法字符，用户名只能包含_,英文字母，数字" );
                return false;
            }
            case 4: {
                changeUsernamePrompt( "用户名格式不正确，用户名只能包含_,英文字母，数字" );
                return false;
            }
        }
        return true;
    }
    function changeUsernamePrompt(cnt){
        document.getElementById( "regis-username-failinfo" ).innerHTML = cnt;
        document.getElementById( "regis-username-failinfo" ).style.display = "";
        document.getElementById( "regis-username-failinfo" ).style.fontSize = "5px";
    }
    function isUsername( username ){
        if( /^\d.*$/.test( username ) ){
            return 1;
        }
        if(! /^.{6,12}$/.test( username ) ){
            return 2;
        }
        if(! /^[\w_]*$/.test( username ) ){
            return 3;
        }
        if(! /^([a-z]|[A-Z])[\w_]{5,19}$/.test( username ) ){
            return 4;
        }
        return 0;
    }

    function regisCheck() {
        var flag=true;
        if (!checkUsername()){
            return false;
        }
        if (!checkPassword()){
            return false;
        }
        if (!checkRePassword()){
            return false;
        }
        var regis_pwd = document.getElementById('regis-pwd');
        var regis_pwd_md5 = document.getElementById('regis-pwd-md5');

        regis_pwd_md5.value = hex_md5(regis_pwd.value);
        return true;
    }
</script>
<script type="text/javascript">
    var onPopupClose3 = function (e) {
        $('.popup3').hide();
        //$('#login-username').val('');
        //$('#login-pwd').val('');
        $(".local-login-pop-overlay").remove();
        $('body').css('overflow', '');
    }

    $('.go-regis').click(function (e) {
        $('.popup2').hide();
        e.stopPropagation();
        $('.popup3').detach().appendTo('.header-inner');
        $('.popup3').toggle();
        var $localLoginInput = $('#regis-username');
        $localLoginInput.focus();

        $('.login-popup-overlay').click(onPopupClose3);
        $('.popup-btn-close').click(onPopupClose3);
        $('.regis-new').click(onPopupClose3);
        $('.popup3').click(function(e){
            e.stopPropagation();
        });
    })

    $('.go-login').click(function (e) {
        $('.popup3').hide();
        e.stopPropagation();
        $('.popup2').detach().appendTo('.header-inner');
        $('.popup2').toggle();
        var $localLoginInput = $('#login-username');
        $localLoginInput.focus();

        $('.login-popup-overlay').click(onPopupClose2);
        $('.popup-btn-close').click(onPopupClose2);
        $('.regis-new').click(onPopupClose2);
        $('.popup2').click(function(e){
            e.stopPropagation();
        });
    })
</script>
<script type="text/javascript">
    // blodadding popup window
    var onPopupCloseBlogadd = function(e){
        $('.blogadd-popup').hide();
        $('#blog_content').val('');
        $('.local-login-pop-overlay').remove();
        $('blody').css('overflow', '');
    }

    $('.blogadd-panel-trigger').click(function(e){
        e.stopPropagation();
        $("body")
            .append('<div class="login-popup-overlay local-login-pop-overlay"></div>')
            .css('overflow','hidden');
        $('.blogadd-popup').detach().appendTo('.header-inner');
        $('.blogadd-popup').toggle();
        var $localLoginInput = $('#blog_content');
        $localLoginInput.focus();

        $('.login-popup-overlay').click(onPopupCloseBlogadd);
        $('.popup-btn-close').click(onPopupCloseBlogadd);
        $('.blogadd-popup').click(function(e) {
            e.stopPropagation();
        });
    });
</script>
<script type="text/javascript">
    // login popup window
    // handle and trigger popup window;
    var onPopupClose2 = function (e) {
        $('.popup2').hide();
        $('#login-username').val('');
        $('#login-pwd').val('');
        $(".local-login-pop-overlay").remove();
        $('body').css('overflow', '');
    }

    $('.popup-trigger2').click(function(e) {
        e.stopPropagation();
        $("body")
            .append('<div class="login-popup-overlay local-login-pop-overlay"></div>')
            .css('overflow','hidden');
        $('.popup2').detach().appendTo('.header-inner');
        $('.popup2').toggle();
        var $localLoginInput = $('#login-username');
        $localLoginInput.focus();

        $('.login-popup-overlay').click(onPopupClose2);
        $('.popup-btn-close').click(onPopupClose2);
        $('.popup2').click(function(e){
            e.stopPropagation();
        });
    });
</script>
<script type="text/javascript">
    // Popup Window;
    var isfetched = false;
    var isXml = true;
    // Search DB path;
    var search_path = "search.xml";
    if (search_path.length === 0) {
        search_path = "search.xml";
    } else if (/json$/i.test(search_path)) {
        isXml = false;
    }
    var path = "./" + search_path;
    // monitor main search box;

    var onPopupClose = function (e) {
        $('.popup').hide();
        $('#local-search-input').val('');
        $('.search-result-list').remove();
        $('#no-result').remove();
        $(".local-search-pop-overlay").remove();
        $('body').css('overflow', '');
    }

    function proceedsearch() {
        $("body")
            .append('<div class="search-popup-overlay local-search-pop-overlay"></div>')
            .css('overflow', 'hidden');
        $('.search-popup-overlay').click(onPopupClose);
        $('.popup').toggle();
        var $localSearchInput = $('#local-search-input');
        $localSearchInput.attr("autocapitalize", "none");
        $localSearchInput.attr("autocorrect", "off");
        $localSearchInput.focus();
    }

    // search function;
    var searchFunc = function(path, search_id, content_id) {
        'use strict';

        // start loading animation
        $("body")
            .append('<div class="search-popup-overlay local-search-pop-overlay">' +
                '<div id="search-loading-icon">' +
                '<i class="fa fa-spinner fa-pulse fa-5x fa-fw"></i>' +
                '</div>' +
                '</div>')
            .css('overflow', 'hidden');
        $("#search-loading-icon").css('margin', '20% auto 0 auto').css('text-align', 'center');

        $.ajax({
            url: path,
            dataType: isXml ? "xml" : "json",
            async: true,
            success: function(res) {
                // get the contents from search data
                isfetched = true;
                $('.popup').detach().appendTo('.header-inner');
                var datas = isXml ? $("entry", res).map(function() {
                    return {
                        title: $("title", this).text(),
                        content: $("content",this).text(),
                        url: $("url" , this).text()
                    };
                }).get() : res;
                var input = document.getElementById(search_id);
                var resultContent = document.getElementById(content_id);
                var inputEventFunction = function() {
                    var searchText = input.value.trim().toLowerCase();
                    var keywords = searchText.split(/[\s\-]+/);
                    if (keywords.length > 1) {
                        keywords.push(searchText);
                    }
                    var resultItems = [];
                    if (searchText.length > 0) {
                        // perform local searching
                        datas.forEach(function(data) {
                            var isMatch = false;
                            var hitCount = 0;
                            var searchTextCount = 0;
                            var title = data.title.trim();
                            var titleInLowerCase = title.toLowerCase();
                            var content = data.content.trim().replace(/<[^>]+>/g,"");
                            var contentInLowerCase = content.toLowerCase();
                            var articleUrl = decodeURIComponent(data.url);
                            var indexOfTitle = [];
                            var indexOfContent = [];
                            // only match articles with not empty titles
                            if(title != '') {
                                keywords.forEach(function(keyword) {
                                    function getIndexByWord(word, text, caseSensitive) {
                                        var wordLen = word.length;
                                        if (wordLen === 0) {
                                            return [];
                                        }
                                        var startPosition = 0, position = [], index = [];
                                        if (!caseSensitive) {
                                            text = text.toLowerCase();
                                            word = word.toLowerCase();
                                        }
                                        while ((position = text.indexOf(word, startPosition)) > -1) {
                                            index.push({position: position, word: word});
                                            startPosition = position + wordLen;
                                        }
                                        return index;
                                    }

                                    indexOfTitle = indexOfTitle.concat(getIndexByWord(keyword, titleInLowerCase, false));
                                    indexOfContent = indexOfContent.concat(getIndexByWord(keyword, contentInLowerCase, false));
                                });
                                if (indexOfTitle.length > 0 || indexOfContent.length > 0) {
                                    isMatch = true;
                                    hitCount = indexOfTitle.length + indexOfContent.length;
                                }
                            }

                            // show search results

                            if (isMatch) {
                                // sort index by position of keyword

                                [indexOfTitle, indexOfContent].forEach(function (index) {
                                    index.sort(function (itemLeft, itemRight) {
                                        if (itemRight.position !== itemLeft.position) {
                                            return itemRight.position - itemLeft.position;
                                        } else {
                                            return itemLeft.word.length - itemRight.word.length;
                                        }
                                    });
                                });

                                // merge hits into slices

                                function mergeIntoSlice(text, start, end, index) {
                                    var item = index[index.length - 1];
                                    var position = item.position;
                                    var word = item.word;
                                    var hits = [];
                                    var searchTextCountInSlice = 0;
                                    while (position + word.length <= end && index.length != 0) {
                                        if (word === searchText) {
                                            searchTextCountInSlice++;
                                        }
                                        hits.push({position: position, length: word.length});
                                        var wordEnd = position + word.length;

                                        // move to next position of hit

                                        index.pop();
                                        while (index.length != 0) {
                                            item = index[index.length - 1];
                                            position = item.position;
                                            word = item.word;
                                            if (wordEnd > position) {
                                                index.pop();
                                            } else {
                                                break;
                                            }
                                        }
                                    }
                                    searchTextCount += searchTextCountInSlice;
                                    return {
                                        hits: hits,
                                        start: start,
                                        end: end,
                                        searchTextCount: searchTextCountInSlice
                                    };
                                }

                                var slicesOfTitle = [];
                                if (indexOfTitle.length != 0) {
                                    slicesOfTitle.push(mergeIntoSlice(title, 0, title.length, indexOfTitle));
                                }

                                var slicesOfContent = [];
                                while (indexOfContent.length != 0) {
                                    var item = indexOfContent[indexOfContent.length - 1];
                                    var position = item.position;
                                    var word = item.word;
                                    // cut out 100 characters
                                    var start = position - 20;
                                    var end = position + 80;
                                    if(start < 0){
                                        start = 0;
                                    }
                                    if (end < position + word.length) {
                                        end = position + word.length;
                                    }
                                    if(end > content.length){
                                        end = content.length;
                                    }
                                    slicesOfContent.push(mergeIntoSlice(content, start, end, indexOfContent));
                                }

                                // sort slices in content by search text's count and hits' count

                                slicesOfContent.sort(function (sliceLeft, sliceRight) {
                                    if (sliceLeft.searchTextCount !== sliceRight.searchTextCount) {
                                        return sliceRight.searchTextCount - sliceLeft.searchTextCount;
                                    } else if (sliceLeft.hits.length !== sliceRight.hits.length) {
                                        return sliceRight.hits.length - sliceLeft.hits.length;
                                    } else {
                                        return sliceLeft.start - sliceRight.start;
                                    }
                                });

                                // select top N slices in content

                                var upperBound = parseInt('1');
                                if (upperBound >= 0) {
                                    slicesOfContent = slicesOfContent.slice(0, upperBound);
                                }

                                // highlight title and content

                                function highlightKeyword(text, slice) {
                                    var result = '';
                                    var prevEnd = slice.start;
                                    slice.hits.forEach(function (hit) {
                                        result += text.substring(prevEnd, hit.position);
                                        var end = hit.position + hit.length;
                                        result += '<b class="search-keyword">' + text.substring(hit.position, end) + '</b>';
                                        prevEnd = end;
                                    });
                                    result += text.substring(prevEnd, slice.end);
                                    return result;
                                }

                                var resultItem = '';

                                if (slicesOfTitle.length != 0) {
                                    resultItem += "<li><a href='" + articleUrl + "' class='search-result-title'>" + highlightKeyword(title, slicesOfTitle[0]) + "</a>";
                                } else {
                                    resultItem += "<li><a href='" + articleUrl + "' class='search-result-title'>" + title + "</a>";
                                }

                                slicesOfContent.forEach(function (slice) {
                                    resultItem += "<a href='" + articleUrl + "'>" +
                                        "<p class=\"search-result\">" + highlightKeyword(content, slice) +
                                        "...</p>" + "</a>";
                                });

                                resultItem += "</li>";
                                resultItems.push({
                                    item: resultItem,
                                    searchTextCount: searchTextCount,
                                    hitCount: hitCount,
                                    id: resultItems.length
                                });
                            }
                        })
                    };
                    if (keywords.length === 1 && keywords[0] === "") {
                        resultContent.innerHTML = '<div id="no-result"><i class="fa fa-search fa-5x" /></div>'
                    } else if (resultItems.length === 0) {
                        resultContent.innerHTML = '<div id="no-result"><i class="fa fa-frown-o fa-5x" /></div>'
                    } else {
                        resultItems.sort(function (resultLeft, resultRight) {
                            if (resultLeft.searchTextCount !== resultRight.searchTextCount) {
                                return resultRight.searchTextCount - resultLeft.searchTextCount;
                            } else if (resultLeft.hitCount !== resultRight.hitCount) {
                                return resultRight.hitCount - resultLeft.hitCount;
                            } else {
                                return resultRight.id - resultLeft.id;
                            }
                        });
                        var searchResultList = '<ul class=\"search-result-list\">';
                        resultItems.forEach(function (result) {
                            searchResultList += result.item;
                        })
                        searchResultList += "</ul>";
                        resultContent.innerHTML = searchResultList;
                    }
                }

                if ('auto' === 'auto') {
                    input.addEventListener('input', inputEventFunction);
                } else {
                    $('.search-icon').click(inputEventFunction);
                    input.addEventListener('keypress', function (event) {
                        if (event.keyCode === 13) {
                            inputEventFunction();
                        }
                    });
                }

                // remove loading animation
                $(".local-search-pop-overlay").remove();
                $('body').css('overflow', '');

                proceedsearch();
            }
        });
    }

    // handle and trigger popup window;
    $('.popup-trigger').click(function(e) {
        e.stopPropagation();
        if (isfetched === false) {
            searchFunc(path, 'local-search-input', 'local-search-result');
        } else {
            proceedsearch();
        };
    });

    $('.popup-btn-close').click(onPopupClose);
    $('.popup').click(function(e){
        e.stopPropagation();
    });
    $(document).on('keyup', function (event) {
        var shouldDismissSearchPopup = event.which === 27 &&
            $('.search-popup').is(':visible');
        if (shouldDismissSearchPopup) {
            onPopupClose();
        }
    });
</script>
</body>
</html>