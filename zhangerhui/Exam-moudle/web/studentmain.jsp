<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20/020
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
<html>
<head>
    <title>教师主页面</title>
    <%@page contentType="text/html;charset=UTF-8" language="java" %>

    <link rel='stylesheet' type='text/css'
          href="https://account.metinfo.cn/templates/account/cache/account.css?20170919190632">
    <script src="js/jquery-3.2.1.js"></script>
</head>
<style>
    a {
        text-decoration-line: none;
    }

    a:hover {
        color: red;
        text-decoration-line: none;
    }

    .clickExam:hover{
        background-color: red;
    }

    .clickExam a:visited{
        color: red;
    }

</style>

<body background="img/timg.jpeg">
<script type="text/javascript">
    $(document).ready(function () {
        $(".owninfo").click(function () {
            $("#owninfodiv").show();
            $("#onlineExamdiv").hide();
            $("#beginonlineExamdiv").hide();

        });
    });

    $(document).ready(function () {
        $(".onlineexam").click(function () {
            $("#onlineExamdiv").show();
            $("#beginonlineExamdiv").hide();
            $("#owninfodiv").hide();
        });
    });

    $(document).ready(function () {
        $("#beginExam").click(function () {
            $("#beginonlineExamdiv").show();
            $("#onlineExamdiv").hide();
            $("#owninfodiv").hide();
        });
    });

    /*$(document).ready(function () {
        $(".clickExam").click(function () {
            $("#clickExam").backgroundColor;
            $("#onlineExamdiv").hide();
            $("#beginonlineExamdiv").hide();

        });
    });*/


</script>
<div id="studentbiggestdiv" style="width: 100%;height: 750px;">

    <div id="headdiv" style="width: 100%;height: 120px;">
        <table width="100%" height="100px">
            <tr>
                <td width="18%" align="center"><h2>欢迎你，<%=session.getAttribute("username")%></h2></td>
                <td><h2>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp后台管理</h2></td>
            </tr>
        </table>
    </div>
    <div id="function" style="width:20%;height: 600px; position: absolute;" align="center">
        <h1>后台功能</h1>

        <h3><a class="owninfo">个人信息</a></h3>
        <h3><a class="onlineexam">在线考试</a></h3>
        <h3><a class="pengrade">笔试成绩</a></h3>
        <h3><a class="compytergrade">机试成绩</a></h3>
        <h3><a class="pword">修改密码</a></h3>

    </div>

    <div id="owninfodiv" style="width: 70%; height: 600px;
    position: absolute;left: 290px; display: block;">
        <table bgcolor="red" width="70%" height="500px">
            <tr>
                <td colspan="4" style="text-align: center;"><h3>学生信息</h3></td>
            </tr>
            <tr>
                <td align="right">学号：</td>
                <td><input type="text"></td>
                <td></td>
                <td><%--<input type="file" value="选择文件">--%></td>
            </tr>
            <tr>
                <td align="right">姓名：</td>
                <td><input type="text"></td>
                <td></td>
                <td><%--<a style="color: red">(支持jpg,gif,png格式)</a>
                    <input type="button" value="提交" onClick="closeShow()">--%></td>
            </tr>
            <tr>
                <td align="right">性别：</td>
                <td><select>
                    <option>请选择</option>
                </select></td>
                <td rowspan="4" align="right">照片：</td>
            </tr>
            <tr>
                <td align="right">入学年份：</td>
                <td><select>
                    <option>请选择</option>
                </select></td>
            </tr>
            <tr>
                <td align="right">所属班级：</td>
                <td><select>
                    <option>请选择</option>
                </select></td>

            </tr>
            <tr>
                <td align="right">生日：</td>
                <td><input type="text"></td>

            </tr>
            <tr>
                <td align="right">身份证号：</td>
                <td><input type="text"></td>
                <td align="right">政治面貌：</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td align="right">省份：</td>
                <td><select>
                    <option>请选择</option>
                </select></td>
                <td align="right">城市：</td>
                <td><select>
                    <option>请选择</option>
                </select></td>
            </tr>
            <tr>
                <td align="right">专业简称：</td>
                <td><select>
                    <option>请选择</option>
                </select></td>
                <td align="right">就读方向：</td>
                <td><select>
                    <option>请选择</option>
                </select></td>
            </tr>
            <tr>
                <td align="right">联系电话：</td>
                <td><input type="text"></td>
                <td align="right">家庭住址：</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td align="right">家长联系电话：</td>
                <td><input type="text"></td>
                <td align="right">监护人与学生关系：</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td align="right">宿舍：</td>
                <td>
                    <select>
                        <option>请选择</option>
                    </select></td>
                <td align="right">宿舍号：</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td align="right">基本情况：</td>
                <td colspan="3" rowspan="1"><textarea cols="80" rows="2"></textarea></td>
            </tr>
            <tr>
                <td align="right">教育背景：</td>
                <td colspan="3" rowspan="1"><textarea cols="80" rows="2"></textarea></td>
            </tr>

        </table>
    </div>

    <div id="onlineExamdiv" style="width: 70%; height: 600px;
    position: absolute;left: 290px; display: none;">
        <div width="100%" height="50px" align="center"><h3>请完成以下试题</h3></div>
        <table class="table">
            <thead>
            <tr>
                <th width="70px" style="vertical-align: middle !important;text-align: center;">序号</th>
                <th width="120px" style="vertical-align: middle !important;text-align: center;">类别</th>
                <th width="120px" style="vertical-align: middle !important;text-align: center;">科目</th>
                <th width="70px" style="vertical-align: middle !important;text-align: center;">标题</th>
                <th width="120px" style="vertical-align: middle !important;text-align: center;">考试班级</th>
                <th width="120px" style="vertical-align: middle !important;text-align: center;">开始时间</th>
                <th width="150px" style="vertical-align: middle !important;text-align: center;">考试时长(分钟)</th>
                <th style="vertical-align: middle !important;text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>

            <tr class="active" align="center" id="onlineExamtable">
                <td>1</td>
                <td>23/11/2013</td>
                <td>待发货</td>
                <td>产品1</td>
                <td>23/11/2013</td>
                <td>待发货</td>
                <td>产品1</td>
                <td><a id="beginExam">开始考试</a></td>
            </tr>

            <tr class="success" align="center">
                <td>2</td>
                <td>10/11/2013</td>
                <td>发货中</td>
                <td>产品1</td>
                <td>23/11/2013</td>
                <td>待发货</td>
                <td>23/11/2013</td>
                <td>待发货</td>
            </tr>
            </tbody>
        </table>
    </div>


    <div id="beginonlineExamdiv" style="width: 70%; height: 600px;
    position: absolute;left: 290px; display: none;">
        <table id="testdetailstable" width="80%">
            <tr>
                <td>科目:PS综合测试</td>
                <td>开考时间:2017-11-21 9:29:06</td>
                <td colspan="2">考试时长:60分钟</td>
            </tr>
            <tr>
                <td>总分:100分</td>
                <td>总题数:41</td>
                <td>倒计时:57分0秒</td>
                <td><input type="button" value="完成考试" onclick="closeShow()"></td>
            </tr>
        </table>
        <hr>

        <table border="1" id="titledetails"  width="900px" height="300px">
            <tr align="center">
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
            </tr>

            <tr align="center">
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
            </tr>

            <tr align="center">
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
            </tr>

            <tr align="center">
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
                <td class="clickExam"><a>1</a></td>
            </tr>
        </table>
        <hr>

        <div id="buttondiv">
            <input type="button" value="上一题">
            <input type="button" value="下一题">
        </div>
    </div>


    <div id="gradediv" style="width: 80%; height: 600px;position: absolute;
         left: 290px; display:none;">
        <div width="100%" height="50px" align="center"><h3>试卷列表</h3></div>
        <br>
        <span style="font-size: 20px;">

            方向：<select style="height: 30px; width:90px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            阶段：<select style="height: 30px; width:90px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            考试科目：<select style="height: 30px; width:150px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            考试类型：<select style="height: 30px; width:90px;">
                        <option value="1">请选择</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
             </select>

            <input type="button" value="查询" style="width: 100px;">
        </span><br>

        <div id="gradetable" style="width: 95%;height: 30px;">
            <table class="table">
                <thead>
                <tr>
                    <th width="50px" style="vertical-align: middle !important;text-align: center;">序号</th>
                    <th width="100px" style="vertical-align: middle !important;text-align: center;">类别</th>
                    <th width="220px" style="vertical-align: middle !important;text-align: center;">科目</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">标题</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">考试班级</th>
                    <th width="120px" style="vertical-align: middle !important;text-align: center;">考试时长(分钟)</th>
                    <th style="vertical-align: middle !important;text-align: center;">操作</th>

                </tr>
                </thead>
                <tbody>

                <tr class="active" align="center">
                    <td>1</td>
                    <td>23/11/2013</td>
                    <td>待发货</td>
                    <td>产品1</td>
                    <td>23/11/2013</td>
                    <td>待发货</td>
                    <td>23/11/2013</td>
                </tr>

                <tr class="success" align="center">
                    <td>2</td>
                    <td>10/11/2013</td>
                    <td>发货中</td>
                    <td>产品1</td>
                    <td>23/11/2013</td>
                    <td>待发货</td>
                    <td>23/11/2013</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!--
     <div id="selectgrade" style="width: 80%; height: 600px;
    position: absolute;left: 290px; display:none;">
        <br><br>
        <table id="subjecttitletable" border="1">
            <tr>
                <td colspan="3" ><h1>【struts考试1】成绩列表</h1></td>
            </tr>
            <tr>
                <td>班级:<select><option></option></select></td>
                <td>学生姓名:<input type="text"></td>
                <td><input type="button" value="查询"></td>
            </tr>
            <tr>
                <td colspan="3">查询结果:总人数1      及格人数0       及格率0.0%</td>
            </tr>
        </table>
        <table border="1" id="subjecttesttable" >
            <tr style="background-color: darkgrey">
                <td class="tablemargin">序号</td>
                <td class="tablemargin">姓名</td>
                <td class="tablemargin">班级</td>
                <td class="tablemargin">开考时间</td>
                <td class="tablemargin">结束时间</td>
                <td class="tablemargin">分数</td>
                <td class="tablemargin">操作</td>
            </tr>
        </table>
    </div>
     -->

</div>


</body>
</html>
