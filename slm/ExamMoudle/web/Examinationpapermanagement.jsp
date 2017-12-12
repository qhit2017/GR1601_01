<%--
Created by IntelliJ IDEA.
User: Administrator
Date: 2017/11/20
Time: 10:41
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <title>会议列表</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/thems.css">
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
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
        $(function () {

            $("#suijizu").click(function () {

                $("#suiji").css('display','block')
            });
            $("#quxiao").click(function () {

                $("#suiji").css('display','none')
            });
        });
        $(function () {

            $("#kskaoshi2").click(function () {

                $("#kskaoshi").css('display','block')
            });
            $("#quxiao2").click(function () {

                $("#kskaoshi").css('display','none')
            });
        });
    </script>
    <!--框架高度设置-->
    <style>
        .text_sun{
            text-align: center;
        }
        #gl{
            height: 80px;
        }
        #suiji{
            width: 1000px;
            height: 520px;
            position: relative;
            background-color: grey;
            z-index: 10;
            box-shadow:0px 0px  10px 5px #aaa;
            top: 50px;
            left: 20px;
            display: none;
        }
        #text_y1{
            position: absolute;
            left: 400px;

        }
        .font_text{
            color: #ffffff;
            font-size: 20px;
            position: absolute;
            left: 50px;
        }
        #ts1{
            position: absolute;
            left: 300px;
            top: 30px;
        }
        #ts2{
            top: 70px;
            left: 300px;
        }
        #ts3{
            left: 300px;
            top: 110px;
        }
        #ts4{
            top: 150px;
            left: 260px;
        }
        #ts5{
            left: 300px;
            top: 190px;
        }
        #ts6{
            left: 300px;
            top: 230px;
        }
        #ts7{
            top: 270px;
            left: 300px;
        }
        #ts8{
            top: 310px;
            left: 300px;
        }
        #tss{
            top: 350px;
            left: 370px;
        }
        #kskaoshi{
            width: 1000px;
            height: 520px;
            position: relative;
            background-color: grey;
            z-index: 10;
            color:#000;
            box-shadow:0px 0px  10px 5px #aaa;
            top: 50px;
            left: 20px;
            display: none;
        }
        #ts_1{
            top: 50px;
        }
        #ts_2{
            top: 120px;
            left: 300px;
        }
    </style>
</head>

<body onLoad="Resize();">
<div id="right_ctn">
    <div class="right_m">
        <!--教师列表-->
        <div class="hy_list">
            <div class="box_t">
                <span class="name">学生列表</span>
                <!--当前位置-->
                <div class="position">
                    <a href=""><img src="images/icon5.png" alt=""/></a>
                    <a href="">首页</a>
                    <span><img src="images/icon3.png" alt=""/></span>
                    <a href="">学生管理</a>
                    <span><img src="images/icon3.png" alt=""/></span>
                    <a href="">学生列表</a>
                </div>
                <div id="suiji"  >
                    <div id="text_y1" class="font_text"><span>随机组卷</span></div>
                    <div class="font_text" id="ts1">方向:<select><option>请选择</option></select>阶段:<select><option>请选择</option></select>方向:<select><option>科目</option></select></div>
                    <div class="font_text" id="ts2">标题：<input type="text" style="height: 25px; width: 265px"></div>
                    <div class="font_text" id="ts3">总分：<input type="text" style="height: 25px; width: 265px"></div>
                    <div class="font_text" id="ts4">考试时长：<input type="text" style="height: 25px; width: 265px"></div>
                    <div class="font_text" id="ts5">单选题：简单<input type="text" style="width: 40px;height: 25px">一般<input type="text" style="width: 40px;height: 25px">困难<input type="text" style="width: 40px;height: 25px"></div>
                    <div class="font_text" id="ts6">多选题：简单<input type="text" style="width: 40px;height: 25px">一般<input type="text" style="width: 40px;height: 25px">困难<input type="text" style="width: 40px;height: 25px"></div>
                    <div class="font_text" id="ts7">总题数：<input type="text" style="height: 25px;"></div>
                    <div class="font_text" id="ts8">每题分数：<input type="text" style="height: 25px;"></div>
                    <div class="font_text" id="tss"><input type="button" value="确定" style="width: 80px;height: 40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="quxiao" value="取消"style="width: 80px;height: 40px" ></div>
                    </div>
                <div id="kskaoshi">
                    <div class="font_text" id="ts_1"><a  class="btn"><font size="3">开始考试</font></a><a  class="btn" id="quxiao2"><font size="3">取消</font></a></div>
                    <div class="font_text" id="ts_2">请选择参加考试的班级及开考时间</div>
                    <table border="1"  style="color: #ffffff;text-align: center; height: 200px;width: 500px;position: absolute;top: 200px;left: 220px;">
                        <tr >
                            <td >班级</td>
                            <td>开考时间</td>
                            <td><a class="btn">添加</a></td>
                        </tr>

                        <tr>
                            <td><select style="width: 200px;"><option>请选择</option></select></td>
                            <td><select style="width: 200px;"><option>请选择</option></select></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><select style="width: 200px;"><option>请选择</option></select></td>
                            <td><select style="width: 200px;"><option>请选择</option></select></td>
                            <td><a class="btn">删除</a></td>
                        </tr>
                    </table>


                    </div>
                <!--当前位置-->
            </div>
            <!--查询-->
            <div class="search" id="gl">

                <span>方向</span>
                <select>
                    <option>请选择</option>
                </select>
                <span>阶段</span>
                <select>
                    <option>请选择</option>
                </select>
                考试科目 <select>
                <option>请选择</option>
            </select>
                考试类型 <select>
                <option>请选择</option>
            </select>
                状态 <select>
                <option>请选择</option>
            </select>
                <a href="" class="btn">查询</a>
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" value="随机组卷" id="suijizu">
               <a href="Selectedtopic.jsp"> <input type="button" value="选题组卷"></a>
                <input type="button" value="上机考试" id="kskaoshi2">


            </div>

            <!--查询-->
            <div class="space_hx">&nbsp;</div>
            <!--列表-->
            <form action="" method="post">
                <table cellpadding="0" cellspacing="0" class="list_hy">
                    <tr>

                        <th scope="col" class="text_sun">序号</th>
                        <th class="zt" scope="col" class="text_sun">类别</th>
                        <th scope="col" class="text_sun">科目</th>
                        <th scope="col" class="text_sun">标题</th>
                        <th scope="col" class="text_sun">考试班级</th>
                        <th scope="col" class="text_sun">考试时长(分钟)</th>
                        <th scope="col" class="text_sun" >状态</th>
                        <th scope="col" class="text_sun" >操作</th>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td class="zt">笔试</td>
                        <td>[SCCE G1]PS/falsh</td>
                        <td>JS考试</td>
                        <td>G3T52</td>
                        <td>60</td>
                        <td>考试中</td>
                        <td>结束考试 查看成绩 查看试卷</td>
                    </tr>

                </table>
                <!--列表-->
                <!--右边底部-->
                <div class="r_foot">
                    <div class="r_foot_m">
                        <%--<span>
                            <input name="" type="checkbox" value="">
                            <em>全部选中</em>
                        </span>
                        <a href="" class="btn">删除</a>
                        <a href="" class="btn">刷新</a>
                        --%>
                        <!--分页-->
                        <div class="page">
                            <a href="" class="prev"><img src="images/icon7.png" alt=""/></a>
                            <a class="now">1</a>
                            <a href="">2</a>
                            <a href="">3</a>
                            <a href="">4</a>
                            <a href="">5</a>
                            <a href="">6</a>
                            <a href="" class="next"><img src="images/icon8.png" alt=""/></a>
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
