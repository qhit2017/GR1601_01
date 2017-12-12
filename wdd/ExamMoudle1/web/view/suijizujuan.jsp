<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加教师</title>
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
<!--登录-->
<div class="login">
    <div class="bg_img"><img src="/images/login_bg.jpg"/></div>
    <div class="logo">
        <a href=""><img src="/images/logo.png" alt=""/></a>
    </div>
    <div class="login_m">
        <div class="hy_list">
            <div class="box_t">
                <span class="name">随机组卷</span>

            </div>
            <form action="" method="post">
                <ul>
                    <span>方向：</span>
                    <select name="select" id="select_k1l" class="xla_k">
                        <option value="0"></option>
                        <option value="1"></option>
                    </select>
                    <span>阶段：</span>
                    <select name="select" id="select_k13p" class="xla_k">
                        <option value="0"></option>
                        <option value="1"></option>
                        <option value="2"></option>
                    </select>
                    <span>科目：</span>
                    <select name="select" id="select_k133" class="xla_k">
                        <option value="0"></option>
                        <option value="1"></option>
                        <option value="2"></option>
                    </select>
                    <br><br>
                    <span>标题：</span>
                    <input name="" type="text"><br><br>
                    <span>总分：</span>
                    <input name="" type="text"><br><br>
                    <span>考试时长：</span>
                    <input name="" type="text"><br><br>
                    <span>单选题：</span><br><br>
                    <span>简单：</span>
                    <input name="" type="text" size="2">
                    <span>一般：</span>
                    <input name="" type="text" size="2">
                    <span>困难：</span>
                    <input name="" type="text" size="2"><br><br>
                    <span>多选题：</span><br><br>
                    <span>简单：</span>
                    <input name="" type="text" size="2">
                    <span>一般：</span>
                    <input name="" type="text" size="2">
                    <span>困难：</span>
                    <input name="" type="text" size="2"><br><br>
                    <span>总题数：</span>
                    <input name="" type="text"><br><br>
                    <span>每题分数：</span>
                    <input name="" type="text"><br>
                </ul>
                </li>
                <li class="l_btn">
                    <a href="teacher.jsp">创建试卷</a>
                </li>
                <li class="2_btn">
                    <input type="button" value="取消">
                </li>
                </ul>
            </form>
        </div>
    </div>
</div>
</body>
</html>
