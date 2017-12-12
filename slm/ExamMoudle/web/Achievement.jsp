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

    $("#tjjs").click(function () {

        $("#jiaoshigl").css('display','block')
    });
    $("#quxiao").click(function () {

        $("#jiaoshigl").css('display','none')
    });
});
</script>
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

#s1{
    height: 120px;
}
        #text1{
            position: absolute;
            font-size: 20px;
            left: 400px;

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

                <div id="jiaoshigl"  >
                    <div id="text_y1" class="font_text"><span>添加教师</span></div>
                    <div class="font_text" id="number">账号：<input type="text" style="height: 25px;" ></div>
                    <div class="font_text" id="name">姓名：<input type="text" style="height: 25px;"></div>
                    <div class="font_text" id="sex">性别:&nbsp;&nbsp;&nbsp;<select style="width: 50px"><option>男</option><option>女</option></select></div>
                    <div class="font_text" id="age">生日：<input type="text" style="height: 25px;"></div>
                    <div class="font_text" id="xueli">学历：<input type="text" style="height: 25px;"></div>
                    <div class="font_text" id="tel">联系电话：<input type="text" style="height: 25px;"></div>
                    <div class="font_text" id="gangwei">岗位:&nbsp;&nbsp;&nbsp;<select style="width: 50px"><option>男</option><option>女</option></select></div>
                    <div class="font_text" id="biezhu">备注：<input type="text" style="height: 80px;width: 400px"></div>
                    <div class="font_text" id="butt"><input type="button" value="确定" style="width: 80px;height: 40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="quxiao" value="取消"style="width: 80px;height: 40px" ></div>
                </div>
            </div>
            <!--查询-->
            <div class="search" id="s1">
                <div id="text1">Struts2考试</div><br>
            	<span>班级：</span>
                <div class="s_text"><select style="height: 30px;width: 210px"><option>请选择</option></select></div>
                <span>学生姓名：</span>
                <div class="s_text"><input name="" type="text"></div>
                <a  class="btn">查询</a><br>
                <span>查询结果：总人数1<span>及格人数0</span><span>及格率0.0%</span></span>
            </div>

            <!--查询-->
            <div class="space_hx">&nbsp;</div>
            <!--列表-->
            <form action="" method="post">
            <table cellpadding="0" cellspacing="0" class="list_hy">
              <tr>

                <th scope="col" class="text_sun">序号</th>
                <th class="zt" scope="col" class="text_sun">姓名</th>
                <th scope="col" class="text_sun">班级</th>
                <th scope="col" class="text_sun">开考时间</th>
                <th scope="col" class="text_sun">结束时间</th>
                <th scope="col" class="text_sun">分数</th>

                  <th scope="col" class="text_sun">操作</th>
              </tr>

              <tr>
                <td>1</td>
                <td class="zt">张三</td>
                <td>2016级计算机网络一班</td>
                <td>2017-11-21 20:26:02</td>
                <td>2017-11-21 20:26:02</td>
                <td>15</td>
                <td><a href="Details.jsp">查看详情</a></td>
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
