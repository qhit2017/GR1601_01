<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" type="text/css" href="/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/css/thems.css"/>
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
     <script src="js/jquery-3.2.1.js"></script>
        <script>
           $(document).ready(function () {
                   $("#submit").click(function () {
                           var name=$("#name").val();
                            var password=$("#password").val();
                            var role=$("#role").val();
                            alert(name+" "+password+" "+role);
                           $.ajax({
                                   url:"texts?name="+name+"&password="+password+"&role="+role,
                                 type:"get",
                                  success:function (msg) {
                                      var result = $.parseJSON(msg);
                                         alert(result.info);
                                      if (result.info == "0") {
                                          alert("输入用户名或密码错误,请重新输入！");
                                      }
                                      else
                                          {
                                              window.location.href = "teacher.jsp";
                                          }
                                      }

                            });
                        });
               });
       </script>

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
    	<form action="texts" method="post">
    	<ul>
        	<li class="wz">用户名</li>
            <li><input name="name" type="text" id="name"></li>
            <li class="wz">密码</li>
            <li><input name="password" type="password" id="password"></li>
            <div class="lang">
                <select name="role"id="role"class="xla_k">
                    <option value="0">管理员</option>
                    <option value="1">教师</option>
                    <option value="2">学生</option>
                </select>
            </div>
                </ul>
            </li>

            <input name="th" type="button" id="submit" value="登陆">
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
