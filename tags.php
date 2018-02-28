<?php
include './backend/common.php';
include './backend/dbconnect.php';

session_start();

if(!isset($_SESSION['user_id'])){
    $_SESSION['user_id']=1;
    $_SESSION['user_name']='Guest';
}

$max_font_size=30;
$min_font_size=12;
$font_color_array=array();
$font_color_array[1]='#111';
$font_color_array[2]='#222';
$font_color_array[3]='#333';
$font_color_array[4]='#444';
$font_color_array[5]='#555';
$font_color_array[6]='#666';
$font_color_array[7]='#777';
$font_color_array[8]='#888';
$font_color_array[9]='#999';
$font_color_array[10]='#aaa';
$font_color_array[11]='#bbb';
$font_color_array[12]='#ccc';

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
                                <a href=\"./user.php?user_id=". $_SESSION['user_id']. "\" class=\"undefined\">
                                    <i class=\"menu-login-icon fa fa-fw fa-star\"></i>
                                    <br>
                                    我的
                                </a>
                            </li>";
}

$sql="select * from tag";
$result=mysqli_query($conn, $sql);
$tag_array=array();
if(!$result){
    echo "没有标签";
    $tag_num=0;
}
else{
    $tag_num = $result->num_rows;
    for($i=0;$i<$tag_num;$i++){
        $tag_array[$i]=mysqli_fetch_assoc($result);
    }
    $sql="select max(tag_count) as max_tag_num from tag";
    $result=mysqli_query($conn, $sql);
    $row=mysqli_fetch_assoc($result);
    $max_tag_num=$row['max_tag_num'];
    $sql="select min(tag_count) as min_tag_num from tag";
    $result=mysqli_query($conn, $sql);
    $row=mysqli_fetch_assoc($result);
    $min_tag_num=$row['min_tag_num'];
}

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
    <link href="./frontend/lib/img-captcha/css/captcha.css" rel="stylesheet">

    <title> ASBS </title>

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
                    <li class="menu-item menu-item-tags menu-item-active" style="opacity: 1; transform: translateY(0px);">
                        <a href="#" rel="section">
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
                                    <button type="submit" disabled="true" name="login_btn" id="login_btn" class="btn btn-block btn-default" style="float: right;">验证并登录</button>
                                </div>
                            </div>
                        </form>
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
                                    <button type="submit" disabled="true" name="regis_btn" id="regis_btn" class="btn btn-block btn-default" style="float: right;">验证并注册</button>
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
                <div id="content" class="content">
                    <section id="posts" class="posts-expand">
                        <div class="post-block page" style="opacity: 1; display: block;">
                            <header class="post-header" style="opacity: 1; display: block; transform: translateY(0px);">
                                <h1 class="post-title" itemprop="name headline">All tags</h1>
                            </header>
                            <div class="post-body" style="opacity: 1; display: block; transform: translateY(0px);">
                                <div class="tag-cloud">
                                    <div class="tag-cloud-title">
                                        目前共计 <?php echo $tag_num;?> 个标签
                                    </div>
                                    <div class="tag-cloud-tags">
                                        <?php
                                        for($i=0;$i<$tag_num;$i++){
                                            $ratio=($tag_array[$i]['tag_count']-$min_tag_num)/($max_tag_num-$min_tag_num);
                                            $font_size=$min_font_size+($max_font_size-$min_font_size)*$ratio;
                                            $n = round(count($font_color_array)*$ratio);
                                            $font_color=$font_color_array[13-$n];
                                            echo "<a href=\"./articlesoftag.php?blog_tag=". $tag_array[$i]['tag_name']."\" style=\"font-size: ". $font_size. "px; color:". $font_color. "\">". $tag_array[$i]['tag_name']. "</a>";
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
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
        </div>
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