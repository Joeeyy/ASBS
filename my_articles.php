<?php
include './backend/common.php';
include './backend/dbconnect.php';

session_start();
if(!isset($_SESSION['user_id'])){
    $_SESSION['user_id']=1;
    $_SESSION['user_name']='Guest';
}

$user_id=$_GET['user_id'];

$sql="select blog_id, blog_title, YEAR(release_time) as release_year, DATE_FORMAT(release_time, '%m-%d') as release_date, release_time from blog where user_id=". $user_id. " order by release_time desc";
$result=mysqli_query($conn, $sql);
$blog_array=array();
if(!$result){
    echo "没有文章。";
}
else{
    $blog_num = $result->num_rows;
    for($i=0;$i<$blog_num;$i++){
        $blog_array[$i]=mysqli_fetch_assoc($result);
    }

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
                    <li class="menu-item menu-item-tags  menu-item-active" style="opacity: 1; transform: translateY(0px);">
                        <a href="#" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-book"></i>
                            <br>
                            <?php if($_SESSION['user_id']==$user_id){echo "我";}else{echo "他";}?>的文章
                        </a>
                    </li>
                    <li class="menu-item menu-item-platform" style="opacity: 1; transform: translateY(0px);">
                        <a href="./platforms_following.php?user_id=<?php echo $user_id;?>" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-th"></i>
                            <br>
                            已关注平台
                        </a>
                    </li>
                    <li class="menu-item menu-item-following" style="opacity: 1; transform: translateY(0px);">
                        <a href="./people_following.php?user_id=<?php echo $user_id;?>" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-users"></i>
                            <br>
                            <?php if($_SESSION['user_id']==$user_id){echo "我";}else{echo "他";}?>关注的人
                        </a>
                    </li>
                    <li class="menu-item menu-item-search" style="opacity: 1; transform: translateY(0px);">
                        <a href="javascript:;" class="popup-trigger">
                            <i class="menu-item-icon fa fa-fw fa-search"></i>
                            <br>
                            搜索
                        </a>
                    </li>
                    <?php
                    if($_SESSION['user_id']==$_GET['user_id']){
                        echo "<li class=\"menu-item menu-item-following\" style=\"opacity: 1; transform: translateY(0px);\">
                        <a href=\"./my_messages.php\" rel=\"section\">
                            <i class=\"menu-item-icon fa fa-fw fa-phone\"></i>
                            <br>
                            消息
                        </a>
                    </li>";
                    }
                    ?>
                    <li class="menu-item menu-item-following" style="opacity: 1; transform: translateY(0px);">
                        <a href="./aboutme.php?user_id=<?php echo $user_id;?>" rel="section">
                            <i class="menu-item-icon fa fa-fw fa-folder"></i>
                            <br>
                            关于<?php if($_SESSION['user_id']==$user_id){echo "我";}else{echo "他";}?>
                        </a>
                    </li>
                    <?php
                    if($_SESSION['user_id']==$_GET['user_id']){
                        echo "<li class=\"menu-item menu-item-following\" style=\"opacity: 1; transform: translateY(0px);\">
                        <a href=\"./write_article.php\" rel=\"section\">
                            <i class=\"menu-item-icon fa fa-fw fa-pencil\"></i>
                            <br>
                            写文章
                        </a>
                    </li>";
                    }
                    ?>
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
                    <div class="post-block archive" style="opacity: 1; display: block;">
                        <div id="posts" class="posts-collapse">
                            <span class="archive-move-on"></span>
                            <span class="archive-page-counter">
                                嗯..! 目前共计 <?php echo $blog_num;?> 篇日志。 继续努力。
                            </span>
                            <?php
                            $year='0';
                            for ($i=0;$i<$blog_num;$i++){
                                $blog=$blog_array[$i];
                                $blog_year=$blog['release_year'];
                                if($year!=$blog_year){
                                    $year=$blog_year;
                                    echo "<div class=\"collection-title\" style=\"opacity: 1; display: block; transform: translateX(0px);\">
                                                <h1 class=\"archive-year\" id=\"archive-year-$year\" style=\"opacity: 1; display: block; transform: translateX(0px);\">$year</h1>
                                            </div>";
                                }
                                echo "<article class=\"post post-type-normal\" itemscope=\"\" itemtype=\"http://schema.org/Article\">
                                        <header class=\"post-header\" style=\"opacity: 1; display: block; transform: translateY(0px);\">
                                            <h2 class=\"post-title\">
                                                <a class=\"post-title-link\" href=\"./article.php?blog_id=". $blog['blog_id']. "\" itemprop=\"url\">
                                                    <span itemprop=\"name\">". $blog['blog_title']. "</span>
                                                </a>
                                            </h2>
                                            <div class=\"post-meta\">
                                                <time class=\"post-time\" itemprop=\"dateCreated\" datetime=\"". $blog['release_time']. "+08:00\" content=\"". $blog['release_year']. "-". $blog['release_date']."\">".
                                    $blog['release_date'].
                                    "</time>
                                            </div>
                                        </header>
                                    </article>";
                            }
                            ?>
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
<script>
    var code; //在全局定义验证码
    //产生验证码
    window.onload = function() {
        createCode();
    }

    function createCode() {
        code = "";
        var codeLength = 5; //验证码的长度
        var checkCode = document.getElementById("checkCode");
        var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
            'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //随机数
        for(var i = 0; i < codeLength; i++) { //循环操作
            var charIndex = Math.floor(Math.random() * 36); //取得随机数的索引
            code += random[charIndex]; //根据索引取得随机数加到code上
        }
        checkCode.value = code; //把code值赋给验证码
    }
    //校验验证码
    function validate() {
        var inputCode = document.getElementById("input").value.toUpperCase(); //取得输入的验证码并转化为大写
        if(inputCode.length <= 0) { //若输入的验证码长度为0
            alert("请输入验证码！"); //则弹出请输入验证码
        } else if(inputCode != code) { //若输入的验证码与产生的验证码不一致时
            alert("验证码输入错误！"); //则弹出验证码输入错误
            createCode(); //刷新验证码
            return false;
        } else { //输入正确时
            alert("^-^"); //弹出^-^
            return true;
        }
    }
</script>
</body>
</html>