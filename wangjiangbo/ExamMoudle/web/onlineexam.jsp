<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <title>教师管理</title>
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
</head>

<body onLoad="Resize();">
<div id="right_ctn">
    <div class="right_m">
        <!--会议列表-->
        <div class="hy_list">
            <div class="box_t">
                <span class="name">请参加下列考试</span>
            </div>


            <!--列表-->
            <form action="" method="post">
                <table cellpadding="0" cellspacing="0" class="list_hy">
                    <tr>
                        <th class="xz" scope="col" style="text-align: center">序号</th>
                        <th scope="col" style="text-align: center">类别</th>
                        <th class="zt" scope="col" style="text-align: center">科目</th>
                        <th scope="col" style="text-align: center">标题</th>
                        <th scope="col" style="text-align: center">考试班级</th>
                        <th scope="col" style="text-align: center">开始时间</th>
                        <th scope="col" style="text-align: center">考试时长（分钟）</th>
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

