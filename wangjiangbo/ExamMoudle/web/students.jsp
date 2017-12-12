<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <title>学生管理模块!!</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/thems.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            //自适应屏幕宽度
            window.onresize=function(){ location=location };

            var main_h = $(window).height();
            $('.hy_list').css('height',main_h-45+'px');

            var search_w = $(window).width()-40;
            $('.search').css('width',search_w+'px');
            //$('.list_hy').css('width',search_w+'px');
        });
    </script>
    <!--框架高度设置-->
    <style>
        #all{
            padding-right: 1120px;
        }
    </style>
</head>

<body onLoad="Resize();">
<div id="right_ctn">
    <div class="right_m">
        <!--会议列表-->
        <div class="hy_list">
            <div class="box_t">
                <span class="name">学生列表</span>
            </div>
            <div id="all">
                <input type="button" value="添加学生">
                <input type="button" value="学生信息导出">
                <input type="button" value="学生信息导入">
                <input type="button" value="学生信息控模块下载">
            </div>
            <!--查询-->
            <div class="search">

                <span>学号：
                    <input type="text" style="width: 50px">
                </span>
                <span>姓名：
                    <input type="text" style="width: 50px">
                </span>
                <span>班级：
                    <select name="select" style="width: 55px">
                       <option style="height: 20px"></option>
                       <option ></option>
                    </select>
                </span>
                <span>入学年份：
                    <select name="select" style="width: 55px">
                       <option style="height: 20px"></option>
                       <option ></option>
                    </select>
                </span>
                <span>就读方向：
                    <select name="select" style="width: 55px">
                       <option style="height: 20px"></option>
                       <option ></option>
                    </select>
                </span>
                <a href="" class="btn">查询</a>
            </div>
            <!--查询-->
            <div class="space_hx">&nbsp;</div>
            <!--列表-->
            <form action="" method="post">
                <table cellpadding="0" cellspacing="0" class="list_hy">
                    <tr>
                        <th class="xz" scope="col">序号</th>
                        <th scope="col" style="text-align: center">学号</th>
                        <th class="zt" scope="col" style="text-align: center">班级</th>
                        <th scope="col" style="text-align: center">姓名</th>
                        <th scope="col" style="text-align: center">性别</th>
                        <th scope="col" style="text-align: center">联系电话</th>
                        <th scope="col" style="text-align: center">操作</th>
                    </tr>
                    <tr>
                        <td class="xz"></td>
                        <td></td>
                        <td class="zt"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="text-align: center">
                            <input type="button" value="查看">
                            <input type="button" value="编辑">
                            <input type="button" value="重置密码">
                            <input type="button" value="删除">
                        </td>
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

                        <!--分页-->
                        <div class="page">
                            <a href="" class="prev"><img src="Assets/images/icon7.png" alt=""/></a>
                            <a class="now">1</a>
                            <a href="">2</a>
                            <a href="">3</a>
                            <a href="">4</a>
                            <a href="">5</a>
                            <a href="">6</a>
                            <a href="" class="next"><img src="Assets/images/icon8.png" alt=""/></a>
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
</body>
</html>
