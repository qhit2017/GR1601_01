<%--suppress ALL --%>
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
<script type="text/javascript" src="js/hy_list.js"></script>
<!--框架高度设置-->
    <style>
        .text_sun{
            text-align: center;
        }
        #jiaoshigl{
            width: 900px;
            height: 450px;
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
            left: 320px;
        }
        #number{
            position: absolute;
            left: 320px;
            top: 30px;
        }
        #name{
            top: 70px;
        }
        #sex{
            top: 110px;
        }
        #age{
            top: 150px;
        }
        #xueli{
            top: 190px;
                 }
        #tel{
            top: 230px;
            left: 280px;
        }
        #gangwei{
            top: 270px;
        }
        #biezhu{
            top: 310px;
        }
        #butt{
            top: 410px;
        }


    </style>

</head>

<body onLoad="Resize();">

<div id="right_ctn">
	<div class="right_m">
		<!--教师列表-->
        <div class="hy_list">
        	<div class="box_t">
            	<span class="name">教师列表</span>
                <!--当前位置-->
                <div class="position">
                	<a href=""><img src="images/icon5.png" alt=""/></a>
                    <a href="">首页</a>
                    <span><img src="images/icon3.png" alt=""/></span>
                    <a href="">教师管理</a>
                    <span><img src="images/icon3.png" alt=""/></span>
                    <a href="">教师列表</a>
                </div>
                <!--当前位置-->

                <div id="jiaoshigl"  >

                    <div id="text_y1" class="font_text"><span>添加教师</span></div>
                    <input type="text" id="id" style="display: none">
                    <div class="font_text" id="number">账号：<input type="text" style="height: 25px;"  id="zh" class="sy"></div>
                    <div class="font_text" id="name">姓名：<input type="text" style="height: 25px;" id="tname" class="sy"></div>
                    <div class="font_text" id="sex">性别:&nbsp;&nbsp;&nbsp;<select style="width: 50px" id="tsex" class="sy"><option>男</option><option>女</option></select></div>
                    <div class="font_text" id="age">生日：<input type="text" style="height: 25px;" id="tage" class="sy"></div>
                    <div class="font_text" id="xueli">学历：<input type="text" style="height: 25px;" id="xl" class="sy"></div>
                    <div class="font_text" id="tel">联系电话：<input type="text" style="height: 25px;" id="ttel" class="sy"></div>
                    <div class="font_text" id="gangwei">岗位:&nbsp;&nbsp;&nbsp;<select style="width: 50px" id="gw" class="sy"><option value="0">班主任</option><option value="1">讲师</option></select></div>
                    <div class="font_text" id="biezhu">备注：<input type="text" style="height: 80px;width: 400px" id="bz" class="sy"></div>
                    <div class="font_text" id="butt"><input type="button" value="确定"  onclick="save();" style="width: 80px;height: 40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="quxiao" value="取消"style="width: 80px;height: 40px" onclick="deleteTeachers();" ></div>
                </div>
            </div>
            <!--查询-->
            <div class="search">
            	<span>账号：</span>
                <div class="s_text"><input name="tnumber" type="text" id="tnumber" ></div>
                <span>教师姓名：</span>
                <div class="s_text"><input name="tname" type="text" id="tnames"></div>
               岗位 <select id="tjob">

                     <option value="0">班主任</option>
                    <option value="1">讲师</option>
                </select>
                <a  class="btn" id="tjjs" onclick="ch();">添加教师</a>
                <a  class="btn" id="select">查询</a>
            </div>

            <!--查询-->
            <div class="space_hx" id="system">&nbsp;</div>
            <!--列表-->
            <form action="" method="post">
            <table cellpadding="0" cellspacing="0" class="list_hy"  id="students">
              <tr ><th scope="col" class="text_sun">序号</th><th class="zt" scope="col" class="text_sun">账号</th><th scope="col" class="text_sun">姓名</th><th scope="col" class="text_sun">性别</th><th scope="col" class="text_sun">生日</th><th scope="col" class="text_sun">学历</th><th scope="col" class="text_sun">联系电话</th><th scope="col" class="text_sun">岗位</th><th scope="col" class="text_sun">操作</th></tr>
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
                <div class="page" id="page">

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
