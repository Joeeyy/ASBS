<?php
include './backend/common.php';
include './backend/dbconnect.php';

session_start();
if (!isset($_SESSION['user_id'])||$_SESSION['user_id'] ==1) {
    alert("请先登录！");
    goToPage("./index.php");
}

$sql = "select * from blog_types";
$result = mysqli_query($conn, $sql);
$blog_type_array = array();
if (!$result) {
    echo "没有博文类型。";
} else {
    $blog_type_num = $result->num_rows;
    for ($i = 0; $i < $blog_type_num; $i++) {
        $blog_type_array[$i] = mysqli_fetch_assoc($result);
    }
}

if (!$result === NULL)
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
                    <li class="menu-item menu-item-tags  menu-item-active"
                        style="opacity: 1; transform: translateY(0px);">
                        <a href="./my_articles.php?user_id=<?php echo $_SESSION['user_id'];?>" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-book"></i>
                            <br>
                            我的文章
                        </a>
                    </li>
                    <li class="menu-item menu-item-platform" style="opacity: 1; transform: translateY(0px);">
                        <a href="./platforms_following.php?user_id=<?php echo $_SESSION['user_id'];?>" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-th"></i>
                            <br>
                            已关注平台
                        </a>
                    </li>
                    <li class="menu-item menu-item-following" style="opacity: 1; transform: translateY(0px);">
                        <a href="./people_following.php?user_id=<?php echo $_SESSION['user_id'];?>" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-users"></i>
                            <br>
                            我关注的人
                        </a>
                    </li>
                    <li class="menu-item menu-item-search" style="opacity: 1; transform: translateY(0px);">
                        <a href="javascript:;" class="popup-trigger">
                            <i class="menu-item-icon fa fa-fw fa-search"></i>
                            <br>
                            搜索
                        </a>
                    </li>
                    <li class="menu-item menu-item-following" style="opacity: 1; transform: translateY(0px);">
                        <a href="./my_messages.php" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-phone"></i>
                            <br>
                            消息
                        </a>
                    </li>
                    <li class="menu-item menu-item-following" style="opacity: 1; transform: translateY(0px);">
                        <a href="aboutme.php?user_id=<?php echo $_SESSION['user_id'];?>" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-folder"></i>
                            <br>
                            关于我
                        </a>
                    </li>
                    <li class="menu-item menu-item-following" style="opacity: 1; transform: translateY(0px);">
                        <a href="#" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-pencil"></i>
                            <br>
                            写文章
                        </a>
                    </li>
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
            </nav>
        </div>
    </header>

    <main id="main" class="main">
        <div class="main-inner">
            <div class="content-wrap">
                <div id="content" class="content">
                    <div id="vcomments" class="valine">
                        <div class="vwrap">
                            <form action="./backend/write_article.php" method="post" onsubmit="return checkArticle()">
                                <div class="vcontrol">
                                    <div class="vident">
                                        标题：
                                        <input autocomplete="off" required type="text" style="width: 50%;"
                                               name="blog_title" id="blog_title" maxlength="32">
                                        分类：
                                        <select name="blog_type_id" id="blog_type_id">
                                            <?php
                                            for ($i = 0; $i < $blog_type_num; $i++) {
                                                echo "<option value=\"" . $blog_type_array[$i]['blog_type_id'] . "\">" . $blog_type_array[$i]['blog_type_name'] . "</option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="vright">
                                    </div>
                                </div>
                                <div class="vedit">
                                    <textarea autocomplete="off" class="veditor vinput" name="blog_content" id="blog_content" placeholder="请使用markdown语法编写文章。"></textarea>
                                    <input hidden name="user_id" id="user_id" <?php echo 'value="' . $_SESSION['user_id'] . '"'; ?>>
                                </div>
                                <div class="vcontrol">
                                    <div class="vident">
                                        标签：
                                        <input autocomplete="off" name="blog_tags" id="blog_tags" type="text" style="width: 45%;" maxlength="255" placeholder="标签之间使用英文分号(;)隔开">
                                    </div>
                                    <div class="vright">
                                        <button id="release_btn" name="release_btn" disabled="true" type="submit" class="btn btn-block btn-default" style="float: right;">
                                            发布文章
                                        </button>
                                    </div>
                                </div>
                                <div style="display:none;" class="vmark"></div>
                            </form>
                        </div>
                    </div>
                    <canvas id="canvas" width="250" height="200"></canvas>
                </div>
            </div>
            <?php
            if ($_SESSION['user_id'] <> '1') {
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
<style type="text/css">
    .valine {
        /************ Loading ************/
    }

    .valine * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        font-family: -apple-system, BlinkMacSystemFont, 'Mirages Custom', 'Merriweather', 'Open Sans', "Segoe UI", Roboto, "PingFang SC", "Microsoft Yahei", "WenQuanYi Micro Hei", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", Helvetica, Arial, sans-serif;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555;
        -webkit-transition: all .3s ease;
        transition: all .3s ease;
    }

    .valine .vwrap {
        border: 1px solid #dedede;
        border-radius: 4px;
        margin-bottom: 10px;
        overflow: hidden;
        position: relative;
    }

    .valine .vwrap .vcontrol {
        background: #fbfbfb;
        font-size: 0;
    }

    .valine .vwrap .vcontrol .vident {
        font-size: 14px;
        width: 85%;
        display: inline-block;
        padding: 5px;
        vertical-align: middle;
    }

    .valine .vwrap .vcontrol .vident .vinput {
        width: 33%;
    }

    .valine .vwrap .vcontrol .vright {
        font-size: 14px;
        padding: 5px;
        display: inline-block;
        width: 15%;
        text-align: right;
        vertical-align: middle;
    }

    @media screen and (max-width: 520px) {
        .valine .vwrap .vcontrol .vident {
            width: 70%;
        }

        .valine .vwrap .vcontrol .vident .vinput {
            width: 80%;
        }

        .valine .vwrap .vcontrol .vright {
            width: 30%;
        }
    }

    .valine .vwrap .vcontrol input {
        background: transparent;
    }

    .valine .vwrap .vmark {
        position: absolute;
        background: rgba(0, 0, 0, 0.65);
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
    }

    .valine .vwrap .vmark .valert {
        padding: 15px 0;
    }

    .valine .vwrap .vmark .valert .vtext {
        color: #fff;
        padding: 15px;
    }

    .valine .vwrap .vmark .valert .vcode {
        width: 75px;
        border-radius: 5px;
        background: #dedede;
    }

    .valine .vwrap .vmark .valert .vcode:focus {
        border-color: #3090e4;
        background-color: #fff;
    }

    @media screen and (max-width: 720px) {
        .valine .vwrap .vmark .valert {
            padding: 30px 0;
        }

        .valine .vwrap .vmark .valert .vtext {
            color: #fff;
            padding: 10px;
        }
    }

    .valine .info {
        font-size: 0;
        padding: 5px;
    }

    .valine .info .col {
        font-size: 14px;
        display: inline-block;
        width: 50%;
        vertical-align: middle;
    }

    .valine .power {
        color: #999;
    }

    .valine a {
        text-decoration: none;
        color: #555;
    }

    .valine a:hover {
        color: #222;
    }

    .valine ul,
    .valine li {
        list-style: none;
    }

    .valine .txt-center {
        text-align: center;
    }

    .valine .txt-right {
        text-align: right;
    }

    .valine .pd5 {
        padding: 5px;
    }

    .valine .pd10 {
        padding: 10px;
    }

    .valine .veditor {
        width: 100%;
        height: 400px;
    }

    .valine .vinput {
        border: none;
        resize: none;
        outline: none;
        padding: 8px 10px;
        max-width: 100%;
    }

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
        max-width: 100%;
    }

    .valine .vbtn + .vbtn {
        margin-left: 20px;
    }

    .valine .vbtn:active,
    .valine .vbtn:hover {
        color: #3090e4;
        border-color: #3090e4;
        background-color: #fff;
    }

    .valine .vlist {
        border-top: 1px solid #dedede;
        border-bottom: 1px solid #dedede;
        padding: 0 10px;
    }

    .valine .vlist .vcard {
        padding: 8px 0;
    }

    .valine .vlist .vcard + .vcard {
        border-top: 1px solid #dedede;
    }

    .valine .vlist .vcard .vhead a {
        font-size: 18px;
        font-weight: 300;
    }

    .valine .vlist .vcard .vhead .vtime {
        font-size: 12px;
        color: #a9a4a4;
        display: inline-block;
        padding: 0 5px;
    }

    .valine .vlist .vcard .vhead .vat {
        font-size: 14px;
        color: #999;
        display: inline-block;
        padding: 0 5px;
        cursor: pointer;
    }

    .valine .vlist .vcard .vhead .vat:hover {
        color: #111;
    }

    .valine .vlist .vcard .vcomment {
        word-wrap: break-word;
        white-space: pre-wrap;
        word-break: break-all;
        text-align: justify;
        line-height: 1.8;
    }

    .valine .vlist .vcard .vcomment pre,
    .valine .vlist .vcard .vcomment .code {
        overflow: auto;
    }

    .valine .vlist .vempty {
        padding: 20px;
        text-align: center;
        color: #999;
    }

    .valine .spinner {
        margin: 10px auto;
        width: 50px;
        height: 30px;
        text-align: center;
        font-size: 10px;
    }

    .valine .spinner > div {
        background-color: #9c9c9c;
        height: 100%;
        width: 6px;
        margin-right: 3px;
        display: inline-block;
        -webkit-animation: sk-stretchdelay 1.2s infinite ease-in-out;
        animation: sk-stretchdelay 1.2s infinite ease-in-out;
    }

    .valine .spinner .r2 {
        -webkit-animation-delay: -1.1s;
        animation-delay: -1.1s;
    }

    .valine .spinner .r3 {
        -webkit-animation-delay: -1.0s;
        animation-delay: -1.0s;
    }

    .valine .spinner .r4 {
        -webkit-animation-delay: -0.9s;
        animation-delay: -0.9s;
    }

    .valine .spinner .r5 {
        -webkit-animation-delay: -0.8s;
        animation-delay: -0.8s;
    }

    @-webkit-keyframes sk-stretchdelay {
        0%,
        40%,
        100% {
            -webkit-transform: scaleY(0.4);
        }
        20% {
            -webkit-transform: scaleY(1);
        }
    }

    @keyframes sk-stretchdelay {
        0%,
        40%,
        100% {
            transform: scaleY(0.4);
            -webkit-transform: scaleY(0.4);
        }
        20% {
            transform: scaleY(1);
            -webkit-transform: scaleY(1);
        }
    }
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
<script type="text/javascript" src="./frontend/lib/img-captcha/src/captcha.js"></script>
<script type="text/javascript">
    imgCaptcha('canvas', {
        imgurl: ['./frontend/lib/img-captcha/bgimg/demo.jpeg','./frontend/lib/img-captcha/bgimg/demo1.jpeg','./frontend/lib/img-captcha/bgimg/demo2.jpg','./frontend/lib/img-captcha/bgimg/demo3.jpg'],
        cw: 66,
        ch: 66,
        onSuccess: function() {
            $('#release_btn').attr('disabled',false);
        },
        onError: function() {
            console.log("error");
        }
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
    var searchFunc = function (path, search_id, content_id) {
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
            success: function (res) {
                // get the contents from search data
                isfetched = true;
                $('.popup').detach().appendTo('.header-inner');
                var datas = isXml ? $("entry", res).map(function () {
                    return {
                        title: $("title", this).text(),
                        content: $("content", this).text(),
                        url: $("url", this).text()
                    };
                }).get() : res;
                var input = document.getElementById(search_id);
                var resultContent = document.getElementById(content_id);
                var inputEventFunction = function () {
                    var searchText = input.value.trim().toLowerCase();
                    var keywords = searchText.split(/[\s\-]+/);
                    if (keywords.length > 1) {
                        keywords.push(searchText);
                    }
                    var resultItems = [];
                    if (searchText.length > 0) {
                        // perform local searching
                        datas.forEach(function (data) {
                            var isMatch = false;
                            var hitCount = 0;
                            var searchTextCount = 0;
                            var title = data.title.trim();
                            var titleInLowerCase = title.toLowerCase();
                            var content = data.content.trim().replace(/<[^>]+>/g, "");
                            var contentInLowerCase = content.toLowerCase();
                            var articleUrl = decodeURIComponent(data.url);
                            var indexOfTitle = [];
                            var indexOfContent = [];
                            // only match articles with not empty titles
                            if (title != '') {
                                keywords.forEach(function (keyword) {
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
                                    if (start < 0) {
                                        start = 0;
                                    }
                                    if (end < position + word.length) {
                                        end = position + word.length;
                                    }
                                    if (end > content.length) {
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
                    }
                    ;
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
    $('.popup-trigger').click(function (e) {
        e.stopPropagation();
        if (isfetched === false) {
            searchFunc(path, 'local-search-input', 'local-search-result');
        } else {
            proceedsearch();
        }
        ;
    });

    $('.popup-btn-close').click(onPopupClose);
    $('.popup').click(function (e) {
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