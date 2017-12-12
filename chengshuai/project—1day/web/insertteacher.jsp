<%--
  Created by IntelliJ IDEA.
  User: king
  Date: 12/7/2017
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="zh-cn"/>
    <title>在线考试管理系统</title>

    <style type="text/css">
        html,body {
            overflow: hidden;
            height: 100%;
            margin: 0;
            padding: 0;
            font: 14px/1.8 Georgia, Arial, Simsun;
        }

        html {
            _padding: 110px 0;
        }

        #hd {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100px;
            background:#2a5caa ;
        }

        #bd {
            position: absolute;
            top: 110px;
            right: 0;
            bottom: 110px;
            left: 0;
            overflow: hidden;
            width: 100%;
            _height: 100%;
        }

        #side {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 200px;
            _height: 100%;
            background:#f6f5ec;
        }

        #main {
            position: absolute;
            _position: static;
            top: 0;
            right: 0;
            bottom: 0;
            left: 210px;
            overflow: auto;
            _overflow: hidden;
            _height: 100%;
            _margin-left: 210px;
            background: ;
        }

        #content {
            _overflow: auto;
            _width: 100%;
            _height: 100%;
        }

        #ft {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100px;
            background: #94d6da;
        }
        /* 与布局无关，一些说明性内容样式 */
        .tit-layout {
            margin: 30px 0 0;
            font-size: 18px;
            text-align: center;
        }

        .copyright {
            font-weight: bold;
            text-align: center;
        }

        #feature {
            width: 200%;
            line-height: 4;
        }

        #feature .hd {
            padding: 20px 15px;
        }

        #feature .hd h2 {
            margin: 0;
            font-size: 16px;
        }

        #feature .bd ol {
            margin-top: 0;
        }

        #feature .bd h3 {
            margin: 0;
            padding: 0 15px;
            font-size: 14px;
            top: 50px;
        }
        #feature .tablediv  {

            padding: 130px ;
            font-size: 14px;


        }

        #feature .ft {
            padding: 10px 15px 30px;
        }
        a:link{                                      /*超链接正常状态下在样式*/
            color:red;                          /*红色*/
            text-decoration:none       /*无下划线*/
        }

    </style>
</head>
<body>
<form action="insertteacherinfo" method="post">
<div id="hd">
    <h1 class="tit-layout">在线考试管理系统</h1>
</div>
<div id="bd">

    <div id="main">
        <div id="content">
            <div id="feature" class="feature">

                <div class="bd">
                    <div class="tablediv">

                        <table width="500px" height="450px">

                            <tr>
                                <td align="right">姓名：</td>
                                <td><input type="text" name="mname"></td>

                            </tr>
                            <tr>
                                <td align="right">地址：</td>
                                <td><input type="text" name="maddr"></td>

                            </tr>
                            <tr>
                                <td align="right">年龄：</td>
                                <td><input type="text" name="mage"></td>

                            </tr>
                            <tr>
                                <td align="right">性别：</td>
                                <td><input type="text" name="msex"></td>
                            </tr>

                            <tr>
                                <td align="right">联系电话：</td>
                                <td><input type="text" name="mphone"></td>

                            </tr>

                            <tr>
                                <td align="right">
                                    <input type="submit" value="确认添加"></td>

                            </tr>
                        </table>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<div id="ft">

</div>
</form>
</body>
</html>
