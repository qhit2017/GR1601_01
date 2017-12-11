<%@ taglib prefix="html" uri="/struts-tags" %>
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

</script>
<!--框架高度设置-->
    <style>
        .text_sun{
            text-align: center;
        }
     #top_t1{
         width: 100%;
         height: 100px;
         position: relative;
         font-size: 15px;
         color: black;
         /*background-color: grey;*/
     }

    </style>
</head>

<body onLoad="Resize();">

<div id="right_ctn">
	<div class="right_m">
		<!--教师列表-->
        <div class="hy_list">
        	<div class="box_t">
            	<span class="name">成绩列表</span>
                <!--当前位置-->
                <div class="position">
                	<a href=""><img src="images/icon5.png" alt=""/></a>
                    <a href="">首页</a>
                    <span><img src="images/icon3.png" alt=""/></span>
                    <a href="">成绩管理</a>
                    <span><img src="images/icon3.png" alt=""/></span>
                    <a href="">成绩列表</a>
                </div>
                <!--当前位置-->


            </div>
            <!--查询-->
            <div id="top_t1">
            <span style="position: absolute;left: 20px">科目：ps综合测试</span>
            <span style="position: absolute;left: 250px">开考时间：2017-11-21 20:26:02</span>
                <span>考试时长：60</span>

                <br><br>
                <span style="position: absolute;left: 20px">总分：100</span>
                <span style="position: absolute;left: 500px">总题数：41</span>
                <span style="position: absolute;left: 800px">倒计时：41</span>
                <a class="btn" style="position: absolute;left: 880px;top: 30px;" >完成考试</a>
                <br>
                <hr>
            </div>

            <!--查询-->
            <div class="space_hx">&nbsp;</div>
            <!--列表-->
            <form action="" method="post">
                <table cellpadding="0" cellspacing="0" class="list_hy" style="position: absolute;top: 120px">
                    <tr>

                        <th scope="col" class="text_sun">1</th>
                        <th  scope="col" class="text_sun">2</th>
                        <th scope="col" class="text_sun">3</th>
                        <th scope="col" class="text_sun">4</th>
                        <th scope="col" class="text_sun">5</th>
                        <th scope="col" class="text_sun">6</th>

                        <th scope="col" class="text_sun">7</th>
                        <th scope="col" class="text_sun">8</th>
                        <th scope="col" class="text_sun">9</th>
                        <th scope="col" class="text_sun">10</th>
                    </tr>

                    <tr>
                        <th scope="col" class="text_sun">1</th>
                        <th scope="col" class="text_sun">2</th>
                        <th scope="col" class="text_sun">3</th>
                        <th scope="col" class="text_sun">4</th>
                        <th scope="col" class="text_sun">5</th>
                        <th scope="col" class="text_sun">6</th>
                        <th scope="col" class="text_sun">7</th>
                        <th scope="col" class="text_sun">8</th>
                        <th scope="col" class="text_sun">9</th>
                        <th scope="col" class="text_sun">10</th>
                    </tr>
                    <tr>
                        <th scope="col" class="text_sun">1</th>
                        <th scope="col" class="text_sun">2</th>
                        <th scope="col" class="text_sun">3</th>
                        <th scope="col" class="text_sun">4</th>
                        <th scope="col" class="text_sun">5</th>
                        <th scope="col" class="text_sun">6</th>
                        <th scope="col" class="text_sun">7</th>
                        <th scope="col" class="text_sun">8</th>
                        <th scope="col" class="text_sun">9</th>
                        <th scope="col" class="text_sun">10</th>
                    </tr>
                    <tr>
                        <th scope="col" class="text_sun">1</th>
                        <th scope="col" class="text_sun">2</th>
                        <th scope="col" class="text_sun">3</th>
                        <th scope="col" class="text_sun">4</th>
                        <th scope="col" class="text_sun">5</th>
                        <th scope="col" class="text_sun">6</th>
                        <th scope="col" class="text_sun">7</th>
                        <th scope="col" class="text_sun">8</th>
                        <th scope="col" class="text_sun">9</th>
                        <th scope="col" class="text_sun">10</th>
                    </tr>
                    <tr>
                        <th scope="col" class="text_sun">1</th>
                        <th scope="col" class="text_sun">2</th>
                        <th scope="col" class="text_sun">3</th>
                        <th scope="col" class="text_sun">4</th>
                        <th scope="col" class="text_sun">5</th>
                        <th scope="col" class="text_sun">6</th>
                        <th scope="col" class="text_sun">7</th>
                        <th scope="col" class="text_sun">8</th>
                        <th scope="col" class="text_sun">9</th>
                        <th scope="col" class="text_sun">10</th>
                    </tr>


            </table>

                <table cellpadding="0" cellspacing="0" class="list_hy" style="position: absolute;top: 370px">
                    <tr>

                        <td>1.下列选项中，关于html:checkbox标签的使用正确的说明的是()[选两项]【A】<font color="red">正确答案【AC】</font></td>
                    </tr>

                    <tr>

                        <td><input type="radio">A.改标签必须配合隐藏域才能正确使用</td>
                    </tr>
                    <tr>
                        <td><input type="radio">B.改标签必须配合隐藏域才能正确使用</td>
                    </tr>
                    <tr>
                        <td><input type="radio">C.改标签必须配合隐藏域才能正确使用</td>
                    </tr>
                    <tr>
                        <td><input type="radio">D.改标签必须配合隐藏域才能正确使用</td>
                    </tr>
                </table>


                    <!--列表-->
            <!--右边底部-->
       <%--    &lt;%&ndash; <div class="r_foot">
            	<div class="r_foot_m">&ndash;%&gt;
            	&lt;%&ndash;<span>--%>
               <%-- 	<input name="" type="checkbox" value="">
                    <em>全部选中</em>
                </span>--%>
                <div style="position: absolute;left: 800px;top: 550px;">
                    <a  class="btn">上一题</a>
                    <a  class="btn">下一题</a>
                </div>

                <!--分页-->
              <%--  <div class="page">
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
                </div>--%>
            </div>
            </form>
            <!--右边底部-->
        </div>
        <!--会议列表-->
    </div>
</div>
</body>
</html>
