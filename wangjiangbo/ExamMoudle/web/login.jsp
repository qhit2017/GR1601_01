<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<head>
    <title>登录界面！！！</title>
    <script src="js/jquery.min.js" language="JavaScript"></script>
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
    <div class="login_m">
        <form action="login" method="post">
            <ul>
                <li class="wz">用户名：</li>
                <li><input name="username" type="text"></li>
                <li class="wz">密码：</li>
                <li><input name="pwd" type="password"></li>
                <li>
                    <select name="role">
                        <option value="0">管理员</option>
                        <option value="1">教师</option>
                        <option value="2">学生</option>
                    </select>
                </li>
                <li class="l_btn">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="登录">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="重置">
                </li>
            </ul>
        </form>
    </div>
</div>
<!--登录-->
</body>
</html>
