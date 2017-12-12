<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/22/022
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset=utf-8"/>

    <title> 试卷管理</title>

    <style type="text/css">
        html, body {
            overflow: hidden;
            height: 100%;
            margin: 0;
            padding: 0;
            width: 1900px;
            font: 14px/1.8 Georgia, Arial, Simsun;

        }

        html {
            _padding: 110px 0;
        }

        /*整个大层*/
        #head {
            position: absolute;
            top: 0;
            left: 0;
            width: 1900px;
            height: 100px;
            background: gainsboro;

        }

        /*身体部分*/
        #body {
            position: absolute;
            top: 110px;
            right: 0;
            bottom: 110px;
            left: 0;
            overflow: hidden;
            width: 1900px;
            _height: 100%;
        }



        /*左边导航*/
        #side {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            overflow: auto;
            width: 370px;
            _height: 100%;
            background: gainsboro;
        }
        #left_head{
            position: absolute;

            margin:0 auto;
            width:300px;
            height:35px;
            background: gainsboro;


        }
        #table_left_div{
            position: absolute;
            width:300px;
            bottom: 20%;
            background: gainsboro;
            padding-top: -25px;


        }

        /*主界面*/
        #main {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 380px;
            width: 1500px;
            background: gainsboro;

        }


        .fontsixze {
            text-align: left;
            font-size: 30px;

        }

    </style>
</head>
<body>

<div id="head">
    <table  style="height: 8px; width: 1500px ; position: relative ; text-align: center ">
        <tr>
            <td >在线考试管理系统</td>
            <td >2017年11月20日&nbsp;星期一&nbsp;15:55</td>
            <td><input type="submit" value="注销">
                <input type="submit" value="退出登录"></td>
        </tr>


    </table>


</div>

<%--身体部分--%>
<div id="body">
    <%--身体左边导航--%>
    <div id="side" align="center">

        <div  id="left_head">
            后台功能
        </div>



        <div id="table_left_div">
            <table border="1" style="height: 60px;width: 300px;left: 30px; position: relative;bottom: 150px" >
                <tr><td><a href="teachermanager.jsp">教师管理</a></td></tr>
                <br>
                <tr><td><a href="classesmanager.jsp">班级管理</a></td></tr>
                <br>
                <tr><td><a href="studentmanage.jsp">学生管理</a></td></tr>
                <br>
                <tr><td><a href="questionbank.jsp">题库管理</a></td></tr>
                <br>
                <tr><td><a href="testmanager.jsp">试卷管理</a></td></tr>
                <br>
                <tr><td><a href="scoremanager.jsp">成绩管理</a></td></tr>
                <br>
                <tr><td><a href="">修改密码</a></td></tr>
                <br>
            </table>
        </div>
    </div>


        <div id="main">
            <table border="1"
                   style="width:1000px;height: 100px ; text-align: center"><%--position: relative;top: 20px;text-align: center--%>
                <tr>
                    <td colspan="6">试卷列表</td>
                </tr>
                <tr>
                    <td>
                        方向：<select>
                        <option>请选择</option>
                    </select>
                    </td>

                    <td>
                        阶段：<select>
                        <option>请选择</option>
                    </select>
                    </td>
                    <td>
                        考试科目：<select>
                        <option>请选择</option>
                    </select>
                    </td>

                    <td>
                        考试类型：<select>
                        <option>请选择</option>
                    </select>
                    </td>


                    <td>
                        状态：<select>
                        <option>请选择</option>
                    </select>
                    </td>

                    <td>
                        <input type="submit" value="查询">
                    </td>

                </tr>

                <tr>
                    <td colspan="6" style="text-align: left">
                       <a href="suijitopic.jsp"> <input type="submit" value="随机组卷"></a>
                        <a href="nexttitle.jsp"><input type="submit" value="选题组卷"></a>
                        <input type="submit" value="上机考试">
                    </td>
                </tr>
            </table>



            <table border="1px" style="width: 1000px;height: 30px ;position: relative;top: 20px">
                <tr>
                    <td>序号</td>
                    <td>类别    </td>
                    <td>科目</td>
                    <td>标题</td>
                    <td>考试班级</td>
                    <td>考试时长（分钟）</td>
                    <td>状态</td>
                    <td>操作</td>


                </tr>


            </table>





        </div>
</div>


</div>
</body>
</html>
