
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">

<link rel="stylesheet" type="text/css" href="/css/main.css"/>
<link rel="stylesheet" type="text/css" href="/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/css/thems.css">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>


    <title>教师管理</title>

</head>
<body>
<div id="hd">
    <h1 class="tit-layout">
        <div id="div1" ><a href="" style="text-decoration: none">注销</a>&nbsp&nbsp&nbsp<a href=""style="text-decoration: none">退出系统</a></div>
        <div id="div2">在线考试</div>
    </h1>
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
                        <div class="box_t">
                            <span class="name">试卷列表</span>

                        </div>
                        <!--查询-->
                        <div class="search">
                            <span>方向：</span>
                            <select name="select" id="select_k1fe" class="xla_k">
                                <option value="0"></option>
                                <option value="1"></option>
                                <option value="2"></option>
                            </select>
                            <span>阶段：</span>
                            <select name="select" id="select_k1tw" class="xla_k">
                                <option value="0"></option>
                                <option value="1"></option>
                                <option value="2"></option>
                            </select>
                            <span>考试科目：</span>
                            <select name="select" id="select_k1rq" class="xla_k">
                                <option value="0">管理员</option>
                                <option value="1">教师</option>
                                <option value="2">学生</option>
                            </select>&nbsp;&nbsp;
                            <span>考试类型：</span>
                            <select name="select" id="select_k1qq" class="xla_k">
                                <option value="0">管理员</option>
                                <option value="1">教师</option>
                                <option value="2">学生</option>
                            </select>
                            <span>状态：</span>
                            <select name="select" id="select_k1rqq" class="xla_k">
                                <option value="0">管理员</option>
                                <option value="1">教师</option>
                                <option value="2">学生</option>
                            </select>
                            <a href="" class="btn">查询</a>

                            <br/>
                            <a href="" class="btn">随机组卷</a>
                            <a href="" class="btn">选题组卷</a>
                            <a href="" class="btn">上机考试</a>

                        </div>
                        <br/>
                        <!--查询-->
                        <div class="space_hx">&nbsp;</div>
                        <!--列表-->
                        <form action="" method="post">
                            <table cellpadding="0" cellspacing="0" class="list_hy">
                                <tr>
                                    <th class="xz" scope="col">序号</th>
                                    <th scope="col">类别</th>
                                    <th class="zt" scope="col">科目</th>
                                    <th scope="col">标题</th>
                                    <th scope="col">考试班级</th>
                                    <th scope="col">考试时长(分钟)</th>
                                    <th scope="col">状态</th>
                                    <th scope="col">操作</th>
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
                                </tr>
                            </table>
                            <!--列表-->
                            <!--右边底部-->
                            <%--<div class="r_foot">
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
                            </div>--%>
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

