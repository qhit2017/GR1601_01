<%--
  Created by IntelliJ IDEA.
  User: zmg
  Date: 2017/11/20
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >





<head>


    <title>在线考试</title>
    <link rel="stylesheet" type="text/css" href="../css/main.css"/>
    <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/thems.css">
</head>
<body>
<div id="hd"style="background-color:#fcfff2">

    <div  style="text-align: left"> 在线考试管理系统</div>

    <div style="text-align: right"><a href="" style="text-decoration: none" id="kong" >注销</a>&nbsp&nbsp&nbsp<a href=""style="text-decoration: none">退出系统</a></div>

</div>

<div id="bd">
    <div id="side" style="background-color: #fcfff2">
        <table width="100%">
            <tr>
                <td>个人信息</td>
            </tr>
            <tr>
                <td>在线考试</td>
            </tr>
            <tr>
                <td>笔试成绩</td>
            </tr>
            <tr>
                <td>机试成绩</td>
            </tr>
            <tr>
                <td>修改密码</td>
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

                    <div class="hy_list">
                        <div class="box_t" style="text-align: center">
                            <span><b>请参加以下考试</b></span>

                        </div>
                        <!--查询-->
                        <div class="search">
                            <span>方向：</span>
                            <select name="select" id="select_k1" class="xla_k">
                                <option value="0"></option>
                                <option value="1"></option>
                                <option value="2"></option>
                            </select>
                            <span>阶段：</span>
                            <select name="select" id="select_k2" class="xla_k">
                                <option value="0"></option>
                                <option value="1"></option>
                                <option value="2"></option>
                            </select>
                            <span>考试科目：</span>
                            <select name="select" id="select_k3" class="xla_k">
                                <option value="0"></option>
                                <option value="1"></option>
                                <option value="2"></option>
                            </select>

                            <span style="margin-left: 250px">考试类型：</span>
                            <select name="select" id="select_k4" class="xla_k">
                                <option value="0"></option>
                                <option value="1"></option>
                                <option value="2"></option>
                            </select>

                            <input type="button" value="查询"/>

                        </div>
                        <!--查询-->
                        <div class="space_hx">&nbsp;</div>
                        <!--列表-->
                        <form action="" method="post">
                            <table cellpadding="0" cellspacing="0" class="list_hy" style="width: 80%" >
                                <tr style="">
                                    <th class="xz" scope="col">序号</th>
                                    <th scope="col">类别</th>
                                    <th class="zt" scope="col">科目</th>
                                    <th scope="col">标题</th>
                                    <th scope="col" style="text-align: center">考试班级</th>
                                    <th scope="col" style="text-align: center">考试时长（分钟）</th>
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

                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
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
                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
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

                                </tr>
                                <tr>
                                    <td class="xz"></td>
                                    <td></td>
                                    <td class="zt"></td>
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

