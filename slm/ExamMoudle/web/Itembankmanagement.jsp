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
<title>题库管理</title>
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/thems.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

    var sy;
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
    $("#jieduan").bind( "change",function () {
        alert("ok");
      var fangxiang =   $("#fangxiang").val();
        var jieduan =   $("#jieduan").val();
        $.ajax({
            type:"get",
            url:"SubjectsudirectionAndsustage?jieduan="+jieduan+"&fangxiang="+fangxiang,
            success:function (msg) {
                var obj = eval(msg);

                var str="";
                for (var i=0;i<obj.length;i++){
                    alert(obj[i].suid+"123")
                    str = str+"<div class='Text_1' id='T'+i+1><a>"+obj[i].sucourse+"</a> <a>"+obj[i].sustage+"</a><br>机试题0<br><a href='Testlist.jsp'>笔试题<span id='"+obj[i].suid+"'></span></a>  </div>";
                    $.ajax({
                        type:"get",
                        url:"Questionbanknumber?id="+obj[i].suid,
                        success:function (msg) {
                            var obj = $.parseJSON(msg);
                            alert(obj.id);

                            $("#"+obj.id+"").html(obj.number);
                        }

                    });
                }
                $("#666").html(str);

            }
        });
    })
});
</script>
<!--框架高度设置-->
    <style>
        .text_sun{
            text-align: center;
        }
        .Text_1{
            width: 300px;
            height: 70px;
            position: absolute;
            border-style: solid;
            font-size: 15px;
            /*background-color: black;*/
         }
        #T1{
            left: 20px;
        }
        #T2{
            left: 400px;
        }
        #T3{
            left: 800px;
        }
        #T4{
            left: 20px;
            top: 210px;
        }
        #T5{
            top: 210px;
            left: 400px;
         }
        #T6{
            top: 210px;
            left: 800px;
        }
        #T7{
            top: 300px;
            left: 20px;
        }
        #T8{
            top: 300px;
            left: 400px;
        }
        #T9{
            top: 300px;
            left: 800px;
        }
        #T10{
            top: 390px;
            left: 20px;
        }
    </style>
</head>

<body onLoad="Resize();">
<div id="right_ctn">
	<div class="right_m">
		<!--教师列表-->
        <div class="hy_list">
        	<div class="box_t">
            	<span class="name">题库列表</span>
                <!--当前位置-->
                <div class="position">
                	<a href=""><img src="images/icon5.png" alt=""/></a>
                    <a href="">首页</a>
                    <span><img src="images/icon3.png" alt=""/></span>
                    <a href="">题库管理</a>
                    <span><img src="images/icon3.png" alt=""/></span>
                    <a href="">题库列表</a>
                </div>
                <!--当前位置-->
            </div>
            <!--查询-->
            <div class="search">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <select id="fangxiang">
             <option value="">请选择</option>
             <option value="高软">高软</option>
             <option value="3G4G">3G4G</option>
         </select>
                <select id="jieduan">
                    <option value="">请选择</option>
                    <option value="G1">G1</option>
                    <option value="G2">G2</option>
                    <option value="G3">G3</option>
                </select>
            </div>

            <!--查询-->
            <div class="space_hx">&nbsp;</div>
            <!--列表-->
            <div id="666">
     <%--           <div class="Text_1" id="T1">CBT G1<br>机试题0<br>笔试题6  </div>
                <div class="Text_1" id="T2">PS   G1<br>机试题0<br>笔试题0   </div>
                <div class="Text_1" id="T3"> HTML   G1<br>机试题0<br>笔试题0  </div>
                <div class="Text_1" id="T4"> HTML   G1<br>机试题0<br>笔试题0  </div>
                <div class="Text_1" id="T5"> HTML   G1<br>机试题0<br>笔试题0  </div>
               <div class="Text_1" id="T6"> HTML   G1<br>机试题0<br>笔试题0  </div>
                <div class="Text_1" id="T7"> HTML   G1<br>机试题0<br>笔试题0  </div>
                <div class="Text_1" id="T8"> HTML   G1<br>机试题0<br>笔试题0  </div>
                <div class="Text_1" id="T9"> HTML   G1<br>机试题0<br>笔试题0  </div>
                <div class="Text_1" id="T10"> HTML   G1<br>机试题0<br>笔试题0  </div>--%>
            </div>
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
