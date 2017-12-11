<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">

<head>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/thems.css">

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>教师管理</title>

    <script language="JavaScript" src="js/jquery.min.js"></script>

    <script>
        $$=jQuery.noConflict();
     $$(document).ready(function () {
             //显示主页面
             //发送ajax
             $$.ajax({
                 url:"show",
                 type:"get",
                 success:function (msg) {
                     var obj=eval(msg)
                     var str="";
                     var table ="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";

                     for(var i=0;i<obj.length;i++){

                         str = str + "<tr> <td class='tablemargin'>"+obj[i].tid+"</td><td class='tablemargin'>"+obj[i].tnumber+"</td> <td class='tablemargin'>"+obj[i].tname+"</td> <td class='tablemargin'>"+obj[i].tsex+"</td> <td class='tablemargin'>"+obj[i].tbirthday+"</td> <td class='tablemargin'>"+obj[i].tphone+"</td> <td class='tablemargin'>"+obj[i].ttel+"</td> <td class='tablemargin'>"+obj[i].tjob+"</td> <td class='tablemargin'><a onclick='bianji(" +obj[i].tid + ")' >编辑</a><a onclick='chong(" + obj[i].tid + ")'> 重置密码</a> <a onclick='shan(" + obj[i].tid + ")'> 删除</td></a> </tr>";

                     }
                     var allinfo=table+str;
                     $$("#wdd").html(allinfo);


                 }

             });
       //条件查询
         $$("#dd").click(function () {
             var tnumber = $$("#tnumber").val();
             var tname = $$("#tname").val();
             var tjob = $$("#tjob").val();
             $$.ajax({
                 url: "selectall?tnumber=" + tnumber + "&tname=" + tname + "&tjob=" + tjob,
                 type:"get",
                 success:function (msg) {
                    var obj= eval(msg)
                     var str="";
                     var table ="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                     for(var i=0;i<obj.length;i++){
                        str = str + "<tr> <td class='tablemargin'>"+obj[i].tid+"</td><td class='tablemargin'>"+obj[i].tnumber+"</td> <td class='tablemargin'>"+obj[i].tname+"</td> <td class='tablemargin'>"+obj[i].tsex+"</td> <td class='tablemargin'>"+obj[i].tbirthday+"</td> <td class='tablemargin'>"+obj[i].tphone+"</td> <td class='tablemargin'>"+obj[i].ttel+"</td> <td class='tablemargin'>"+obj[i].tjob+"</td> <td class='tablemargin'><a onclick='bianji(" +obj[i].tid + ")'> 编辑</a> <a onclick='chong(" + obj[i].tid + ")'> 重置密码</a> <a onclick='shan(" + obj[i].tid + ")'> 删除 </a></td></tr>";

                    }
                     var allinfo=table+str;
                     $$("#wdd").html(allinfo);

                 }

             });

         });
         //编辑
         function bianji(add) {
             var tid = add;
             $$.ajax({
                 url: "xiuteacherinfo?tid=" + tid,
                 type: "get",
                 success: function (msg) {
                     var result = $$.parseJSON(msg);
                     var info = " <tr style='text-align: center;'><td colspan='2' ><b>添加教师</b></td></tr><tr> <td >账号:</td><td >" + result.teachers.tnumber + "</td> </tr> <tr> <td>姓名:</td> <td><input type='text'id='tname' value='" + result.teachers.tname + "'></td> </tr> <tr> <td>性别:</td><td><select id='tsex'> <option value='男'>男</option> <option value='女'>女</option> </select></td> </tr> <tr> <td>生日:</td><td><input type='text' id='tbirthday' value='" + result.teachers.tbirthday + "'></td> </tr> <tr> <td>学历:</td><td><input type='text' id='tphone' value='" + result.teachers.tphone + "'></td> </tr> <tr> <td>联系电话:</td><td><input type='text'id='ttel' value='" + result.teachers.ttel + "'></td> </tr> <tr> <td>岗位:</td><td> <select id='tjob'> <option value='0'>讲师</option><option value='1'>班主任</option> </select></td> </tr> <tr> <td>备注</td> <td><textarea cols='40' rows='3' id='tremark' >" + result.teachers.tremark + "</textarea></td> </tr> <tr> <td colspan='2' style='text-align: center'><input type='button' value='确认' onclick='save(" + result.teachers.tid + ")' >&nbsp;&nbsp;&nbsp;&nbsp; <input type='button' value='取消' onclick='xiaoshi(),deletebytid(" + tid + "),refresh();'></td> </tr>";
                     $$("#quester").html(info);
                     $$("#quester").xiao();

                 }
             });
         }

         //重置密码
         function chong(b) {
             var tid = b;

             $$.ajax({
                 url:"resetpassword?tid="+tid,
                 type:"get",
                 success: function (msg) {
                     var obj = $$.parseJSON(msg);

                     if(obj.result=="true"){
                         alert("密码重置成功！！！");
                     }
                     else{
                         alert("密码重置失败！！！");
                     }
                 }
             });
         }

         //删除
         function shan(c) {
             var tid = c;
             $$.ajax({
                 url:"deleteinfo?tid="+tid,
                 type:"get",
                 success: function (msg) {
                     var obj = $$.parseJSON(msg);

                     if (obj.result == "true") {
                         alert("删除成功！！！");
                         //刷新界面
                         refresh();
                     }
                     else {
                         alert("删除失败！！！");
                     }
                 }
             });
         }

     });

    </script>

    <!--框架高度设置-->
    <script type="text/javascript">
        $(function(){
            //自适应屏幕宽度
            window.onresize=function(){ location=location };

            var w_height=$(window).height();
            $('.bg_img').css('height',w_height+'px');

            var bg_wz=1920-$(window).width();
            $('.bg_img img').css('margin-left','-'+bg_wz/2+'px')

            $('.language .lang').click(function(){
                $(this).siblings('.lang_ctn').toggle();
            });
        })
    </script>


</head>
<body>
<div id="hd">
    <h1 class="tit-layout">
        <div id="div1" ><a href="" style="text-decoration: none">注销</a>&nbsp&nbsp&nbsp<a href=""style="text-decoration: none">退出系统</a></div>
        <div id="div2">在线考试</div>
    </h1>
</div>

<div id="bd">
    <div id="side" style="background-color: #fcfff2">
        <table width="100%">
            <tr>
                <td>教师管理</td>
            </tr>
            <tr>
                <td>班级管理</td>
            </tr>
            <tr>
                <td>学生管理</td>
            </tr>
            <tr>
                <td>题库管理</td>
            </tr>
            <tr>
                <td>试题管理</td>
            </tr>
            <tr>
                <td>成绩管理</td>
            </tr>
            <tr>
                <td>修改密码</td>
            </tr>

        </table>

    </div>
    <div id="main">
        <div id="content">

            <div id="right_ctn">
                <div class="right_m">
                    <!--会议列表-->
                    <div class="hy_list">
                        <div class="box_t">
                            <span class="name">教师列表</span>

                        </div>
                        <div class="search">
                            <a href="tianjiajiaoshi.jsp" class="btn" id="add" onclick="string()">添加教师</a>
                            <span>账号：</span>
                            <div class="s_text"><input id="tnumber" type="text"></div>
                            <span>教师姓名：</span>
                            <input name="" type="text" id="tname">
                            <span>岗位</span>
                            <select name="select" id="tjob" class="xla_k">
                                <option value="1">讲师</option>
                                <option value="2">班主任</option>
                            </select>
                            <input type="button" value="查询" id="dd">
                        </div>
                        <!--查询-->
                        <div class="space_hx">&nbsp;</div>
                        <!--列表-->
                        <form action="show" method="get">
                            <table cellpadding="0" cellspacing="0" class="list_hy" id="wdd">
                               <%-- <tr>
                                    <th class="xz" scope="col">序号</th>
                                    <th scope="col">账号</th>
                                    <th class="zt" scope="col">姓名</th>
                                    <th scope="col">性别</th>
                                    <th scope="col">生日</th>
                                    <th scope="col">学历</th>
                                    <th scope="col">联系电话</th>
                                    <th scope="col">岗位</th>
                                    <th scope="col">操作</th>
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
                                    <td></td>
                                </tr>--%>
                            </table>
                            <!--列表-->
                            <!--右边底部-->
                          <%--  <div class="r_foot">--%><br/><br/><br/>
                                <div class="r_foot_m">
                                    <a href="" class="btn" onclick="shan();">删除</a>
                                    <a href="" class="btn" onclick="refresh();">刷新</a>
                                    <!--分页-->
                                    <div class="page">
                                        <a href="" class="prev"><img src="/images/icon7.png" alt=""/></a>
                                        <a class="now">1</a>
                                        <a href="">2</a>
                                        <a href="">3</a>
                                        <a href="">4</a>
                                        <a href="">5</a>
                                        <a href="">6</a>
                                        <a href="" class="next"><img src="/images/icon8.png" alt=""/></a>
                                         </div>
                                    <!--分页-->
                                </div>

                     <%--</div>--%>
                        </form>
                        <!--右边底部-->
                    </div>
                    <!--会议列表-->
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

