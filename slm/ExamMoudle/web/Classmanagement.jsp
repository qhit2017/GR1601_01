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
        var id ;
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

            $("#classgl").css('display','block')
    });
        $("#quxiao").click(function () {

            $("#classgl").css('display','none')
    });






});

/*查询班级表中所有数据放在界面上面*/
    $(function () {
        $.ajax({
        type:"get",
        url:"QueryClassesall",
        success:function (msg) {
           var obgj = eval(msg);
            var str="";
            for(var i = 0;i<obgj .length;i++){
          str = str+"<tr><td>"+obgj[i].cid+"</td><td class='zt'>"+obgj[i].cnumber+"</td><td>"+obgj[i].cname+"</td><td>"+obgj[i].cdirection+"</td><td>"+obgj[i].teachersh.tname+"</td><td>"+obgj[i].teachersl.tname+"</td><td>"+obgj[i].cbegin+"</td><td>"+obgj[i].cstate+"</td><td><a onclick='ashow("+obgj[i].cid+")'>编辑</a></td></tr>";
            }
            $("#rest").append(str);
        }
    });
        $.ajax({
            type:"get",
            url:"QueryTeachersTjob0",
            success:function (msg) {
               var obj = eval(msg);
               var str = "";
               var bt = "";
               for (var i = 0;i<obj.length;i++){
                   str = str +'<option value="'+obj[i].tid+'">'+obj[i].tname+'</option>';
               }
               $("#banzhuren").append(str);
                $("#form_banzhuren").append(str);
            }
        });
        $.ajax({
            type:"get",
            url:"QueryTeachersTjob1",
            success:function (msg) {
                var obj = eval(msg);
                var str = "";
                for (var i = 0;i<obj.length;i++){
                    str = str +'<option value="'+obj[i].tid+'">'+obj[i].tname+'</option>';
                }
                $("#jiangshi").append(str);
                $("#form_js").append(str);
            }
        });
});
$(function () {
    $("#query").click(function () {
         var yer = $("#data").val();
         var fx = $("#fx").val();
       var jiangshi = $("#jiangshi").val();

         var banzhuren = $("#banzhuren").val();
         $.ajax({
             type:"get",
             url:"QueryconditionClasses?cbegin="+yer+"&cdirection="+fx+
             "&teal="+banzhuren+"&teah="+jiangshi,
             success:function (msg) {
                 var obgj = eval(msg);
                 var str="";
                 var bt ="<tr><th scope='col' class='text_sun'>序号</th><th class='zt' scope='col' class='text_sun'>班级代码</th><th scope='col' class='text_sun'>班级名称</th><th scope='col' class='text_sun'>所属方向</th><th scope='col' class='text_sun'>讲师</th><th scope='col' class='text_sun'>班主任</th><th scope='col' class='text_sun'>开班日期</th><th scope='col' class='text_sun'>状态</th><th scope='col' class='text_sun'>操作</th></tr>";
                 for(var i = 0;i<obgj .length;i++){

                     str = str+"<tr><td>"+obgj[i].cid+"</td><td class='zt'>"+obgj[i].cnumber+"</td><td>"+obgj[i].cname+"</td><td>"+obgj[i].cdirection+"</td><td>"+obgj[i].teachersh.tname+"</td><td>"+obgj[i].teachersl.tname+"</td><td>"+obgj[i].cbegin+"</td><td>"+obgj[i].cstate+"</td><td><a onclick='ashow("+obgj[i].cid+");'>编辑</a></td></tr>";
                 }
                 $("#rest").html(bt)
                 $("#rest").append(str);
             }
         });

    });

    $("#save").click(function () {
        var a = $("#id").val();

        var bjdm =  $("#bjdm").val();
        var bname =  $("#bname").val();
        var bfx =  $("#bfx").val();
        var form_banzhuren =  $("#form_banzhuren").val();
        alert(form_banzhuren)
        var form_js =  $("#form_js").val();
        alert(form_js);
        var bdate =  $("#bdate").val();
        var g1 =  $("#g1").val();
        var g2 =  $("#g2").val();
        var g3 =  $("#g3").val();
        var zt =  $("#zt").val();
        var bz =  $("#bz").val();
        $.ajax({
            type:"get",
            url:"saveOrupdateClasses?cid="+a+"&cnumber="+bjdm+"&cname="+bname+
            "&cdirection="+bfx+"&cbegin="+bdate+"&cg1="+g1+"&cg2="+g2+"&cg3="+g3+
            "&cstate="+zt+"&cremark="+bz+"&teal="+form_banzhuren+"&teah="+form_js,
            success:function (msg) {
            alert("ok");
                $("#classgl").css('display','none');
                $.ajax({
                    type:"get",
                    url:"QueryClassesall",
                    success:function (msg) {
                        var obgj = eval(msg);
                        var str="";
                        var bt ="<tr><th scope='col' class='text_sun'>序号</th><th class='zt' scope='col' class='text_sun'>班级代码</th><th scope='col' class='text_sun'>班级名称</th><th scope='col' class='text_sun'>所属方向</th><th scope='col' class='text_sun'>讲师</th><th scope='col' class='text_sun'>班主任</th><th scope='col' class='text_sun'>开班日期</th><th scope='col' class='text_sun'>状态</th><th scope='col' class='text_sun'>操作</th></tr>";

                        for(var i = 0;i<obgj .length;i++){
                            str = str+"<tr><td>"+obgj[i].cid+"</td><td class='zt'>"+obgj[i].cnumber+"</td><td>"+obgj[i].cname+"</td><td>"+obgj[i].cdirection+"</td><td>"+obgj[i].teachersh.tname+"</td><td>"+obgj[i].teachersl.tname+"</td><td>"+obgj[i].cbegin+"</td><td>"+obgj[i].cstate+"</td><td><a onclick='ashow("+obgj[i].cid+")'>编辑</a></td></tr>";
                        }
                        $("#rest").html(bt)
                        $("#rest").append(str);
                    }
                });
            }

        });
    });

});
function ashow(a) {
    alert(a);
    var id =  $("#id").val(a);
    $.ajax({
        type:"get",
        url:"QueryClassesByid?cid="+a,
        success:function (msg) {
            var obj =$.parseJSON(msg);
            $("#bjdm").val(obj.classes.cnumber);
            $("#bname").val(obj.classes.cname);
             $("#bfx").val(obj.classes.cdirection);
            $("#bdate").val(obj.classes.cbegin);
           $("#g1").val(obj.classes.cg1);
            $("#g2").val(obj.classes.cg2);
            $("#g3").val(obj.classes.cg3);
            $("#zt").val(obj.classes.cstate);
             $("#bz").val(obj.classes.cremark);

        }

    });
    $("#classgl").css('display','block');
}
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
        #classgl{
            width: 900px;
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
            left: 320px;
        }
        #ts1{
            position: absolute;
            left: 320px;
            top: 30px;
        }
        #ts2{
            top: 70px;
        }
        #ts3{
            top: 110px;
        }
        #ts4{
            top: 150px;
        }
        #ts5{
            top: 190px;
        }
        #ts6{
            top: 230px;
            left: 280px;
        }
        #ts7{
            top: 270px;
            left: 250px;
        }
        #ts8{
            top: 310px;
            left: 250px;
        }
        #ts9{
            top: 350px;
            left: 250px;
        }
        #ts10{
            top: 390px;
            left: 250px;
        }
        #ts11{
            top: 430px;
            left: 250px;
        }
        #tss{
            top: 470px;

        }


    </style>

</head>

<body onLoad="Resize(); ">

<div id="right_ctn">
	<div class="right_m">
		<!--教师列表-->
        <div class="hy_list">
        	<div class="box_t">
            	<span class="name">班级列表</span>
                <!--当前位置-->
                <div class="position">
                	<a href=""><img src="images/icon5.png" alt=""/></a>
                    <a href="">首页</a>
                    <span><img src="images/icon3.png" alt=""/></span>
                    <a href="">班级管理</a>
                    <span><img src="images/icon3.png" alt=""/></span>
                    <a href="">班级列表</a>
                </div>
                <!--当前位置-->
                <div id="classgl"  >
                    <div id="text_y1" class="font_text"><span>添加班级</span></div>
                    <input type="text" id="id" style="display: none">
                    <div class="font_text" id="ts1">班级代码：<input type="text" style="height: 25px;" id="bjdm"></div>
                    <div class="font_text" id="ts2">班级名称：<input type="text" style="height: 25px;" id="bname"></div>
                    <div class="font_text" id="ts3">所属方向:&nbsp;&nbsp;&nbsp;<select id="bfx"><option value="">请选择</option><option value="高软">高软</option><option value="3G4G">3G4G</option></select></div>
                    <div class="font_text" id="ts4">&nbsp;&nbsp;&nbsp;&nbsp;班主任：<select  id="form_banzhuren"><option value="">请选择</option></select></div>
                    <div class="font_text" id="ts5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;讲师：<select id="form_js"><option value="">请选择</option></select></div>
                    <div class="font_text" id="ts6">开班日期：<input type="text" style="height: 25px;" id="bdate"></div>
                    <div class="font_text" id="ts7">G1开班人数：<input type="text" style="height: 25px;" id="g1"></div>
                    <div class="font_text" id="ts8">G2开班人数：<input type="text" style="height: 25px;" id="g2"></div>
                    <div class="font_text" id="ts9">G3开班人数：<input type="text" style="height: 25px;" id="g3"></div>
                    <div class="font_text" id="ts10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态：<select id="zt" ><option value="">请选择</option><option value="0">启用</option><option value="1">启用</option></select></div>
                    <div class="font_text" id="ts11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注：<input type="text" style="height: 25px;" id="bz"></div>
                    <div class="font_text" id="tss"><input type="button" value="确定" style="width: 80px;height: 40px" id="save">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="quxiao" value="取消"style="width: 80px;height: 40px" ></div>
                </div>
            </div>
            <!--查询-->
            <div class="search">
            	<span>入学年份</span>
                <select id="data">
                    <option value="">请选择</option>
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                 </select>
                <span >所属方向</span>
                <select id="fx">
                    <option value="">请选择</option>
                    <option value="高软">高软</option>
                    <option value="3G4G">3G4G</option>
                </select>
                <span>讲师</span>
                <select id="jiangshi">
                    <option value="">请选择</option>
                </select>
                <span>班主任</span>
                <select id="banzhuren">
                    <option value="">请选择</option>
                </select>
                <a  class="btn" id="tjjs">新建班级</a>
                <a class="btn" id="query">查询</a>
                <a  id="btn2">重置</a>
            </div>

            <!--查询-->
            <div class="space_hx">&nbsp;</div>
            <!--列表-->
            <form action="" method="post">
            <table cellpadding="0" cellspacing="0" class="list_hy" id="rest">
                <tr><th scope='col' class='text_sun'>序号</th><th class='zt' scope='col' class='text_sun'>班级代码</th><th scope='col' class='text_sun'>班级名称</th><th scope='col' class='text_sun'>所属方向</th><th scope='col' class='text_sun'>讲师</th><th scope='col' class='text_sun'>班主任</th><th scope='col' class='text_sun'>开班日期</th><th scope='col' class='text_sun'>状态</th><th scope='col' class='text_sun'>操作</th></tr>

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
