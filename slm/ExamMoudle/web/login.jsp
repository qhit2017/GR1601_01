<%--
Created by IntelliJ IDEA.
User: Administrator
Date: 2017/11/20
Time: 10:41
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/thems.css"/>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
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
    <script>
            $(function () {

                $("#loginht").click(function () {

                    var name= $("#loginname").val();
                    var password = $("#loginpassword").val();
                    var js = $("#js").val();
                    /*alert(name);*/
                    $.ajax({
                        type: "get",
                        url: "text?name="+name+"&password="+password+"&js="+js,
                        success: function(msg){
                           var rest = $.parseJSON(msg);
                           alert(rest.info);
                           if(rest.info=="0"){
                               alert("登录失败 账户或者密码错误")
                           }else {
                               window.location.href="index.jsp";
                           }
                        }
                    });
                });
            });




    </script>
<!--框架高度设置-->
</head>

<body>
<!--登录-->
<div class="login">

	<div class="bg_img"><img src="images/login_bg.jpg"/></div>
	<div class="logo">
    	<a href=""><img src="images/logo.png" alt=""/></a>
    </div>
    <div class="login_m">
    	<form action="text" method="post">
    	<ul>
        	<li class="wz">用户名</li>
            <li><input name="loginname" type="text" id="loginname"></li>
            <li class="wz" id="jjj">密码</li>
            <li><input name="loginpassword" type="password" id="loginpassword"></li>
            <li class="wz">角色</li>
            <li class="language">
            <select class="lang" style="border: 0; background: transparent;" name="js" id="js">
  			<option value ="0">管理员</option>
  			<option value ="1">教师</option>
  			<option value="2">学生</option>
  			
			</select>
            	<!--<div class="lang">
                	<span>管理员</span>
                    <em>&nbsp;</em>
                </div>
                <ul class="lang_ctn">
                	<li>
                    	<span>教师</span>
                    </li>
                    <li>
                    	<span>学生</span>
                    </li>
                </ul>
            </li>-->
            <li class="l_btn">
            	<a  id="loginht">登录</a>
            </li>
        </ul>
        </form>
    </div>
</div>
<!--登录-->
</body>
</html>
