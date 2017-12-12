<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑试题</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/thems.css"/>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <%@page contentType="text/html;charset=UTF-8" language="java" %>

    <!--框架高度设置-->
    <script type="text/javascript">
        $(function(){
            //自适应屏幕宽度
            window.onresize=function(){ location=location };

            var w_height=$(window).height();
            $('.bg_img').css('height',w_height+'px');

            var bg_wz=1920-$(window).width();
            $('.bg_img img').css('margin-left','-'+bg_wz/2+'px')

            $('.language .lang').click(function(){
                $(this).siblings('.lang_ctn').toggle();
            });
        })
    </script>
    <!--框架高度设置-->
</head>

<body>
<div class="login">
    <div class="bg_img"><img src="/images/login_bg.jpg"/></div>
    <div class="logo">
        <a href=""><img src="/images/logo.png" alt=""/></a>
    </div>
    <div class="login_m">
        <form action="" method="post">
            <ul>
                <li class="wz">科目名称</li>
                <li><input name="" type="text"></li>
                <li class="wz">密码</li>
                <li><input name="" type="password"></li>
                <div class="lang">
                    <li class="wz">科目类型</li>
                    <select name="select"id="select_kj4"class="xla_k">
                        <option value="0"></option>
                        <option value="1"></option>
                    </select>
                </div>
                <li class="wz">题目内容</li>
                <textarea name="" rows="4" cols="20"></textarea>
                <li class="wz">选项</li>
                <li><input name="" type="checkbox">A</li><br>
                <li><input name="" type="checkbox">B</li><br>
                <li><input name="" type="checkbox">C</li><br>
                <li><input name="" type="checkbox">D</li>
                <div class="lang">
                    <li class="wz">难度</li>
                    <select name="select"id="select_kj5"class="xla_k">
                        <option value="0">困难</option>
                        <option value="1">容易</option>
                    </select>
                </div>
                <li class="wz">对应章节</li>
                <li><input name="" type="password" value="T2"></li>

            </ul>
            </li>
            <li class="l_btn">
                <a href="teacher.jsp">修改</a>
            </li>
            <li class="2_btn">
                <input type="reset">
            </li>
            </ul>
        </form>
    </div>
</div>
<!--登录-->
</body>
</html>
