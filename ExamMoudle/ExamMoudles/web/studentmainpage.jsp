<%--
  Created by IntelliJ IDEA.
  User: 王英豪
  Date: 2017/11/21
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="zh-cn" />
    <title>div仿框架布局之典型的两栏布局Version2.0（Private） - Powered by 飘零雾雨</title>
    <meta name="Description" content="摆脱frameset的束缚，以div代替，通过css实现仿框架布局" />
    <meta name="Keywords" content="div布局, div仿框架布局, 两栏布局" />
    <meta name="author" content="Doyoe(飘零雾雨), dooyoe@gmail.com" />
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
            background: #999;
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
            background: #666;
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
            background: #666;
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
            background: #999;
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
        }

        #feature .ft {
            padding: 10px 15px 30px;
        }
    </style>
</head>
<body>

<div id="main">
    <div id="content">
        <div id="feature" class="feature">
            <div class="hd">
                <table border="1" >
                    <tr>
                        <td> <button>创建班级</button></td>
                    </tr>
                    <tr>
                        入学年份:<select name="ComboBox">
                        <option value="0" selected>2016</option>
                        <option value="1" selected>2017</option>
                        <option value="2" selected>2015</option>  </select>
                        所属方向:<select name="ComboBox">
                        <option value="0" selected>开发</option>
                        <option value="1" selected>运营</option>
                        <option value="2" selected>维护</option>  </select>
                        讲师:    <select name="ComboBox">
                        <option value="0" selected>管理员</option>
                        <option value="1" selected>教师</option>
                        <option value="2" selected>学生</option>
                    </select>
                        班主任:  <select name="ComboBox">
                        <option value="0" selected>管理员</option>
                        <option value="1" selected>教师</option>
                        <option value="2" selected>学生</option>
                    </select>
                        <button type="submit">查询</button>
                        <button type="submit">重置</button>
                    </tr>
                    <tr>
                        <td>序号</td>
                        <td>班级代码</td>
                        <td>班级名称</td>
                        <td>所属方向</td>
                        <td>班主任</td>
                        <td>讲师</td>
                        <td>开班日期</td>
                        <td>状态</td>
                        <td>操作</td>
                    </tr>
                    <tr>
                        <td>序号</td>
                        <td>账号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>生日</td>
                        <td>学历</td>
                        <td>联系电话</td>
                        <td>联系电话</td>
                        <td>操作</td>
                    </tr>
                    <tr>
                        <td>序号</td>
                        <td>账号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>生日</td>
                        <td>学历</td>
                        <td>联系电话</td>
                        <td>联系电话</td>
                        <td>操作</td></tr>
                    <tr>  <td>序号</td>
                        <td>账号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>生日</td>
                        <td>学历</td>
                        <td>联系电话</td>
                        <td>联系电话</td>
                        <td>操作</td></tr>

                    <tr>  <td>序号</td>
                        <td>账号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>生日</td>
                        <td>学历</td>
                        <td>联系电话</td>
                        <td>联系电话</td>
                        <td>操作</td></tr>

                    <tr>  <td>序号</td>
                        <td>账号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>生日</td>
                        <td>学历</td>
                        <td>联系电话</td>
                        <td>联系电话</td>
                        <td>操作</td></tr>

                    <tr>  <td>序号</td>
                        <td>账号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>生日</td>
                        <td>学历</td>
                        <td>联系电话</td>
                        <td>联系电话</td>
                        <td>操作</td></tr>

                    <tr>  <td>序号</td>
                        <td>账号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>生日</td>
                        <td>学历</td>
                        <td>联系电话</td>
                        <td>联系电话</td>
                        <td>操作</td></tr>

                    <tr>
                        <td>序号</td>
                        <td>账号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>生日</td>
                        <td>学历</td>
                        <td>联系电话</td>
                        <td>联系电话</td>
                        <td>操作</td>
                    </tr>
                    <tr>
                        <td>序号</td>
                        <td>账号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>生日</td>
                        <td>学历</td>
                        <td>联系电话</td>
                        <td>联系电话</td>
                        <td>操作</td>
                    </tr>
                    <tr>
                        <td>序号</td>
                        <td>账号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>生日</td>
                        <td>学历</td>
                        <td>联系电话</td>
                        <td>联系电话</td>
                        <td>操作</td>
                    </tr>






                </table>

            </div>

        </div>
    </div>
</div>

</body>
</html>
