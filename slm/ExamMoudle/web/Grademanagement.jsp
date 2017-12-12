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
        #btn2{
            display:inline-block;
            *display:inline;
            zoom:1;
            width:76px;
            height:36px;
            text-align:center;
            line-height:36px;
            color:#000;
            vertical-align:middle;
            background:url(images/btn1.png) no-repeat;
            margin-left:5px;
            left: 50px;
        }
        #achievement{
            width: 900px;
            height: 520px;
            position: relative;
            background-color: grey;
            z-index: 10;
            box-shadow:0px 0px  10px 5px #aaa;
            top: 50px;
            left: 20px;
            z-index: 201;
           /* display: none;*/
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
            <div class="search">
            	<span>方向</span>
                <select>
                    <option>请选择</option>
                </select>
                <span>阶段</span>
                <select>
                    <option>请选择</option>
                </select>
                <span>考试科目</span>
                <select>
                    <option>请选择</option>
                </select>
                <span>考试类型</span>
                <select>
                    <option>请选择</option>
                </select>
                <a href="" class="btn">查询</a>

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
                <th scope="col" class="text_sun">操作</th>

              </tr>

              <tr>
                <td>1</td>
                <td class="zt">笔试</td>
                <td>{SCCE G1}ps/flash</td>
                <td>JS考试</td>
                <td>G3T52</td>
                <td>60</td>
                <td><a href="Achievement.jsp">查看成绩</a> 查看试卷</td>

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
