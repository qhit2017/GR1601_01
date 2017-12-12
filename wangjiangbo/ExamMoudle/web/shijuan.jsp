<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <title>试卷列表!!</title>
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

    </style>
</head>

<body onLoad="Resize();">
<div id="right_ctn">
    <div class="right_m">
        <!--会议列表-->
        <div class="hy_list">
            <div class="box_t">
                <span class="name">试卷列表</span>
            </div>
            <!--查询-->
            <div class="search">

                <span>方向：
                    <select style="width: 55px">
                        <option style="height: 20px"></option>
                        <option></option>
                    </select>
                </span>
                <span>阶段：
                    <select style="width: 55px">
                        <option style="height: 20px"></option>
                        <option></option>
                    </select>
                </span>
                <span>考试题目：
                    <select style="width: 55px">
                        <option style="height: 20px"></option>
                        <option></option>
                    </select>
                </span>
                <span>考试类型：
                    <select style="width: 55px">
                        <option style="height: 20px"></option>
                        <option></option>
                    </select>
                </span>
                <span>状态：
                    <select style="width: 55px">
                        <option style="height: 20px"></option>
                        <option></option>
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
