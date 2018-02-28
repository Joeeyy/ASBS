# [ASBS - A_space blog system](https://github.com/Joeeyy/ASBS)

NUDT 2017 秋季学期MIS课程设计

## 0x01 依赖介绍

### 前台界面
- [Hexo](https://github.com/hexojs/hexo)博客框架的[Next](https://github.com/iissnan/hexo-theme-next)主题的样式。
- [AdminLTE](https://github.com/almasaeed2010/AdminLTE)的样式。

### 数据库相关
数据库版本：
``` bash
mysql --version
mysql  Ver 14.14 Distrib 5.7.18, for macos10.12 (x86_64) using  EditLine wrapper
```
数据库交互采用PHP，版本：
``` bash
php --version
PHP 7.1.7 (cli) (built: Jul 15 2017 18:08:09) ( NTS )
Copyright (c) 1997-2017 The PHP Group
Zend Engine v3.1.0, Copyright (c) 1998-2017 Zend Technologies
```

### 平台功能说明
系统内微信公众号爬取基于[搜狗微信API](https://github.com/Chyroc/WechatSogou)，需要验证码，可以通过商业鉴别验证码服务解决。
也可是设定爬取其他感兴趣的信息平台、自媒体平台，可以简单地使用python爬虫实现。
这里的python版本：
``` bash
python --version
Python 2.7.10
```

### 关于博文
系统内的博文默认采用Markdown语法书写，数据库中保存Markdown语法的博文。
博文在展示在前台的时候，采用[Highlight.js](https://github.com/isagalaev/highlight.js)进行渲染。


## 0x02 开发环境
- Python 2.7.10
- PHP 7.1.7
- MySql 5.7.18
- Apache/2.4.28 (Unix)
- 使用Chrome浏览器开发，对Safari浏览器兼容良好，Firefox浏览器在登录页面有瑕疵，其他浏览器也是登录页面在外观上存在问题
- 操作系统 macOS High Sierra 10.13.3

## 0x03 系统部署
### 数据库导入
将代码下载解压至本机Web服务器文件根目录，假设在服务器文件根目录中ASBS文件夹是本系统，依次执行以下命令完成数据库导入：
```
cd ASBS
mysql -u 你的数据库用户名 -p
输入你的数据库密码
mysql> source ./asbs.sql
```
### 数据库配置
修改目录`ASBS/backend/`下的`dbconfig.php`文件完成数据库配置

### 访问系统
浏览器地址栏输入`http://localhost/ASBS`可以开始使用该系统。

## 0x04 写在最后
作者email: joeeeee@foxmail.com
<br>开发过程中对安全因素考虑较少，可以拿来做靶机系统使用。
<br>开发水平不高，周期短，疏漏多，各位看客如果有建议的话欢迎指教！
