

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/thems.css"/>

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script  src="js/jquery-3.2.1.min.js"></script>
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



</head>

<body >




<!--登录-->
<form action="logininfo" method="post">
<div class="login">
	<div class="bg_img"><img src="../images/login_bg.jpg"/></div>
	<div class="logo">
    	<a href=""><img src="../images/logo.png" alt=""/></a>
    </div>
    <div class="login_m">

    	<ul>
        	<li class="wz">用户名</li>
            <li><input name="name" type="text" ></li>
            <li class="wz">密码</li>
            <li><input name="password" type="password"></li>
            <li class="wz">角色</li><br>
            <select name="select" id="select_k1" class="xla_k" style="width: 350px">
                <option value="0">管理员</option>
                <option value="1">教师</option>
                <option value="2">学生</option>
            </select>


            <li>   <input type="submit" value="登陆">


                <input type="reset"></li>


        </ul>

    </div>
</div>
</form>

</body>
</html>
