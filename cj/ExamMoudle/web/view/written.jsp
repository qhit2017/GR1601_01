<%--
  Created by IntelliJ IDEA.
  User: zmg
  Date: 2017/11/20
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">

<link rel="stylesheet" type="text/css" href="../css/main.css"/>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/thems.css">
<link rel="stylesheet" type="text/css" href="../css/teacher.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>


    <title>笔试管理</title>

</head>
<body>
<div id="hd" style="background-color:#fcfff2">

    <div  style="text-align: left"> 在线考试管理系统</div>

    <div style="text-align: right"><a href="" style="text-decoration: none" id="kong" >注销</a>&nbsp&nbsp&nbsp<a href=""style="text-decoration: none">退出系统</a></div>

</div>
<div id="bd">
    <div id="side" style="background-color: #fcfff2">
        <table width="100%">
            <tr>
                <td>教师管理</td>
            </tr>
            <tr>
                <td>班级管理</td>
            </tr>
            <tr>
                <td>学生管理</td>
            </tr>
            <tr>
                <td>题库管理</td>
            </tr>
            <tr>
                <td>试题管理</td>
            </tr>
            <tr>
                <td>成绩管理</td>
            </tr>
            <tr>
                <td>修改密码</td>
            </tr>

        </table>

    </div>
    <div id="main">
        <div id="content">


            <div id="right_ctn">
                <div class="right_m">
                    <!--会议列表-->
                    <div class="hy_list">
                        <div class="box_t" style="text-align: center">
                            <span >笔试试题列表</span>

                        </div>
                        <div class="search">
                            <a href="" class="btn">添加试题</a>
                            <a href="" class="btn">选择文件</a>
                            <a href="" class="btn">导入</a>
                            <a href=""class="btn" >下考题模板</a>
                        </div>
                        <!--查询-->
                        <div class="space_hx">&nbsp;</div>
                        <!--列表-->
                        <form action="" method="post">
                            <table cellpadding="0" cellspacing="0" class="list_hy" style="width:99%">
                                <tr>
                                    <th class="xz" scope="col"style="width: 100px">序号</th>
                                    <th scope="col"style="width: 100px">类型</th>
                                    <th class="zt" scope="col"style="width: 300px">题目内容</th>
                                    <th scope="col"style="width: 200px">选项A</th>
                                    <th scope="col"style="width: 200px">选项B</th>
                                    <th scope="col"style="width: 200px">选项C</th>
                                    <th scope="col"style="width: 200px">选项D</th>
                                    <th scope="col"style="width: 100px">答案</th>
                                    <th scope="col"style="width: 100px">难度</th>
                                    <th scope="col"style="width: 100px">对应章节</th>
                                    <th scope="col"style="width: 200px">操作</th>
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                            <!--列表-->
                            <!--右边底部-->
                            <div class="r_foot">
                                <div class="r_foot_m">
                                    <a href="" class="btn">删除</a>
                                    <a href="" class="btn">刷新</a>
                                    <!--分页-->
                                    <div class="page">
                                        <a href="" class="prev"><img src="/images/icon7.png" alt=""/></a>
                                        <a class="now">1</a>
                                        <a href="">2</a>
                                        <a href="">3</a>
                                        <a href="">4</a>
                                        <a href="">5</a>
                                        <a href="">6</a>
                                        <a href="" class="next"><img src="/images/icon8.png" alt=""/></a>
                                    </div>
                                    <!--分页-->
                                </div>
                            </div>
                        </form>
                        <!--右边底部-->
                    </div>
                    <!--会议列表-->
                </div>
            </div>





        </div>
    </div>
</div>

</body>
</html>

