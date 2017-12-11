<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="core" %>
<html>
<head>
    <title>teacherslist</title>
</head>
<link rel="stylesheet" href="css/teacherlist.css">
<script  type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script language="JavaScript">
    var $a = jQuery.noConflict()
    //显示的方法，说明：前缀的div1、div2、body等，均为Id值
    function show() {
        div1.style.display = "inline";//设置层1显示
        div1.style.width = bigdiv.clientWidth;//设置层1宽度等于body宽度，width=100%也可以，不过有一些误差，所以最好用这个
        div1.style.height = bigdiv.clientHeight;//设置层1高度满屏
        div2.style.display = "inline";//设置层2的显示
        div2.style.top = bigdiv.clientHeight / 2 - div2.clientHeight / 2;//设置层2的距顶位置居中算法
        div2.style.left = bigdiv.clientWidth / 2 - div2.clientWidth / 2;//设置层2的距左位置居中算法
        pagediv.style.display="none";
    }
    //关闭显示
    function close() {
        div1.style.display = "none";
        div2.style.display = "none";
        pagediv.style.display="inline";
        xianshi();
    }
    function uppagenone() {
        uppagediv.style.display = "none";
    }
    function uppageinline() {
        uppagediv.style.display = "inline";
    }
    function nextpagenone() {
        nextpagediv.style.display = "none";
    }
    function nextpageinline() {
        nextpagediv.style.display = "inline";
    }
</script>
<script>
    var $a = jQuery.noConflict()
    $a(function () {
        //显示所有信息
        function xianshi(i) {
            if(i==null){
                i=1;
            }
            $a.ajax({
                url: "teachersinfo?pageindex="+i,
                type: "get",
                success: function (msg) {
                    var obj = eval(msg);
                    var str = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < obj.length; i++) {
                        str = str + "<tr style='background-color: darkgrey'> <td class='tablemargin'>" + obj[i].tid + "</td> <td class='tablemargin'>" + obj[i].tnumber + "</td> <td class='tablemargin'>" + obj[i].tname + "</td> <td class='tablemargin'>" + obj[i].tsex + "</td> <td class='tablemargin'>" + obj[i].tbirthday + "</td> <td class='tablemargin'>" + obj[i].teducation + "</td> <td class='tablemargin'>" + obj[i].ttel + "</td> <td class='tablemargin'>" + obj[i].tjob + "</td> <td class='tablemargin'><a onclick='edit(" + obj[i].tid + ")'>编辑</a> <a onclick='resetpwd(" + obj[i].tid + ")'> 重置密码</a> <a onclick='deleteway(" + obj[i].tid + ")'>删除</a> </td> </tr>";
                    }
                    $a("#teacherinfo").html(str);
                    getpageinfo();
                }
            })
        }
        xianshi();
        //根据条件查询教师信息
        $a("#select").click(function () {
            var i = $a("#pageindex").val();
            $a.ajax({
                url:"selectteachersinfo",
                type:"post",
                data:"pageindex="+i+"&number="+$a('#number').val()+"&name="+$a('#name').val() +"&job="+$a('#job').val() ,
                success:function (msg) {
                    var obj = eval(msg);
                    var str
                    if(obj==null){
                        var str = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                    }else {
                        str = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                        for(var i=0;i<obj.length;i++){
                            str = str + "<tr style='background-color: darkgrey'> <td class='tablemargin'>"+obj[i].tid+"</td> <td class='tablemargin'>"+obj[i].tnumber+"</td> <td class='tablemargin'>"+obj[i].tname+"</td> <td class='tablemargin'>"+obj[i].tsex+"</td> <td class='tablemargin'>"+obj[i].tbirthday+"</td> <td class='tablemargin'>"+obj[i].teducation+"</td> <td class='tablemargin'>"+obj[i].ttel+"</td> <td class='tablemargin'>"+obj[i].tjob+"</td> <td class='tablemargin'><a onclick='edit(" + obj[i].tid + ")'>编辑</a> <a onclick='resetpwd(" + obj[i].tid + ")'> 重置密码</a> <a onclick='deleteway(" + obj[i].tid + ")'>删除</a></td> </tr>"
                        }
                    }
                    $a("#teacherinfo").html(str);
                    getpageinfo();
                }
            })
        })
        //添加教师
        $a("#insertteachers").click(function () {
            $a.ajax({
                url: "generatetnumber",
                type: "get",
                success: function (msg) {
                    var obj = $a.parseJSON(msg)
                    $a("#tid").val(obj.t1);
                    $a("#tnumber").val(obj.t2);
                }
            })
        })
        //上一页
        $a("#uppagediv").click(function () {
            var i = $a("#pageindex").val();
            i--
            xianshi(i)
        })
        //下一页
        $a("#nextpagediv").click(function () {
            var i = $a("#pageindex").val();
            i++
            xianshi(i)
        })
    })
    //分页
    function getpageinfo() {
        $a.ajax({
            url: "getPage",
            type: "get",
            success:function (msg) {
                var page = $a.parseJSON(msg);
                $a("#pageindex").val(page.pageIndex);
                $a("#pagecount").val(page.pageCount);
                if(page.uppage==true){
                    uppageinline();
                }else {
                    uppagenone();
                }
                if(page.nextpage==true){
                    nextpageinline();
                }else {
                    nextpagenone();
                }
            }
        })}
    //点击编辑
    function edit(editinfo) {
        var tid = editinfo;
        $a.ajax({
            url: "editteacherinfo?id=" + tid,
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                var info = "<table border='1' id='teachertable1'><tr style='text-align: center;'><td colspan='2'><input type='text'style='display:none' id='tid' name='tid' ><b>添加教师</b></td></tr><tr> <td >账号:</td><td><input type='text' id='tnumber' name='tnumber' readonly='true' ></td> </tr> <tr> <td>姓名:</td> <td><input type='text'id='tname' name='tname' ></td> </tr> <tr> <td>性别:</td><td><select name='tsex' id='tsex'> <option value='男'>男</option> <option value='女'>女</option> </select></td> </tr> <tr> <td>生日:</td><td><input type='text' name='tbirthday' id='tbirthday'></td> </tr> <tr> <td>学历:</td><td><input type='text' name='teducation' id='teducation'></td> </tr> <tr> <td>联系电话:</td><td><input type='text' name='ttel' id='ttel'></td> </tr> <tr> <td>岗位:</td><td> <select name='tjob' id='tjob'> <option value='0'>讲师</option><option value='1'>班主任</option> </select></td> </tr> <tr> <td>备注</td> <td><textarea cols='40' rows='3' id='tremark' name='tremark' ></textarea></td> </tr> <tr> <td colspan='2' style='text-align: center'><input class='affirm1' type='submit' value='确认' >&nbsp;&nbsp;&nbsp;&nbsp; <input class='affirm1' type='button' value='取消' onClick='deleteshow()'></td> </tr></table>";
                $a("#bottomdiv").html(info);
                $a("#tid").val(obj.tid)
                $a("#tnumber").val(obj.tnumber)
                $a("#tname").val(obj.tname)
                $a("#tsex").val(obj.tsex)
                $a("#tbirthday").val(obj.tbirthday)
                $a("#teducation").val(obj.teducation)
                $a("#ttel").val(obj.ttel)
                $a("#tjob").val(obj.tjob)
                $a("#tremark").val(obj.tremark)
            }
        });
        show();
    }
//关闭添加页面
    function deleteshow() {
        //var info = "<table border='1' id='teachertable1'><tr style='text-align: center;'><td colspan='2'><input type='text'style='display:none' id='tid' name='tid' readonly='true' ><b>添加教师</b></td></tr><tr> <td >账号:</td><td><input type='text' id='tnumber' name='tnumber' readonly='true' ></td> </tr> <tr> <td>姓名:</td> <td><input type='text'id='tname' name='tname' ></td> </tr> <tr> <td>性别:</td><td><select name='tsex' id='tsex'> <option value='男'>男</option> <option value='女'>女</option> </select></td> </tr> <tr> <td>生日:</td><td><input type='text' name='tbirthday' id='tbirthday'></td> </tr> <tr> <td>学历:</td><td><input type='text' name='teducation' id='teducation'></td> </tr> <tr> <td>联系电话:</td><td><input type='text' name='ttel' id='ttel'></td> </tr> <tr> <td>岗位:</td><td> <select name='tjob' id='tjob'> <option value='0'>讲师</option><option value='1'>班主任</option> </select></td> </tr> <tr> <td>备注</td> <td><textarea cols='40' rows='3' id='tremark' name='tremark' ></textarea></td> </tr> <tr> <td colspan='2' style='text-align: center'><input class='affirm1' id='insertteacher' type='submit' value='确认' >&nbsp;&nbsp;&nbsp;&nbsp; <input class='affirm1' type='button' id='qvxiao' value='取消' onClick='closeShow()'></td> </tr></table>";
        var info = "<table border='1' id='teachertable1'> <tr style='text-align: center;'> <td colspan='2'><input type='text'id='tid' name='tid'  style='display:none'><b>添加教师</b></td> </tr> <tr> <td>账号:</td> <td><input type='text' id='tnumber' name='tnumber' readonly='true' ></td> </tr> <tr> <td>姓名:</td> <td><input type='text' id='tname' name='tname'></td> </tr> <tr> <td>性别:</td> <td><select id='tsex' name='tsex'> <option value='男'>男</option> <option value='女'>女</option> </select></td> </tr> <tr> <td>生日:</td> <td><input type='text' id='tbirthday' name='tbirthday'></td> </tr> <tr> <td>学历:</td> <td><input type='text' id='teducation' name='teducation'></td> </tr> <tr> <td>联系电话:</td> <td><input type='text' id='ttel' name='ttel'></td> </tr> <tr> <td>岗位:</td> <td> <select id='tjob' name='tjob'> <option value='0'>讲师</option> <option value='1'>班主任</option> </select></td> </tr> <tr> <td>备注</td> <td><textarea cols='40' rows='3' id='tremark' name='tremark'></textarea></td> </tr> <tr> <td colspan='2' style='text-align: center'><input class='affirm1' type='submit' id='insertteacher' value='确认' onClick=closeShow() >&nbsp;&nbsp;&nbsp;&nbsp;<input class='affirm1' type='button' value='取消' onClick='closeShow()'></td> </tr> </table>"
        $a("#bottomdiv").html(info);
        close();
    }
    //点击重置密码
    function resetpwd(resetpwdid) {
        var tid = resetpwdid;
        $a.ajax({
            url:"resetpwd?id="+tid,
            type:"get"
        })
        alert("重置成功")
    }
    //点击删除
    function deleteway(deletewayid) {
        $a.ajax({
            url:"delectteacher?id="+deletewayid,
            type:"get"
        })
        alert("删除成功")
        window.location.href="teacherlist.jsp"
       /* $a.ajax({
            url:"teachersinfo",
            type:"get",
            success:function (msg) {
                var obj = eval(msg);
                var str = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td> <td class='tablemargin'>操作</td> </tr>";
                for(var i=0;i<obj.length;i++){
                    str = str + "<tr style='background-color: darkgrey'> <td class='tablemargin'>"+obj[i].tid+"</td> <td class='tablemargin'>"+obj[i].tnumber+"</td> <td class='tablemargin'>"+obj[i].tname+"</td> <td class='tablemargin'>"+obj[i].tsex+"</td> <td class='tablemargin'>"+obj[i].tbirthday+"</td> <td class='tablemargin'>"+obj[i].teducation+"</td> <td class='tablemargin'>"+obj[i].ttel+"</td> <td class='tablemargin'>"+obj[i].tjob+"</td> <td class='tablemargin'><a onclick='edit(" + obj[i].tid + ")'>编辑</a> <a onclick='resetpwd(" + obj[i].tid + ")'> 重置密码</a> <a onclick='deleteway(" + obj[i].tid + ")'>删除</a> </td> </tr>";
                }
                $a("#teacherinfo").html(str);
            }
        })*/
    }
    //关闭添加div
    function closeShow() {
        var tid = $a("#tid").val();
        $a.ajax({
            url: "delectteacher",
            type: "post",
            data:"id="+tid,
        })
        close();
    }
</script>

<body>
<div id="bigdiv">
    <div id="div1" class="div1"></div><!--这是要覆盖网页的层，不必写任何东西-->
    <div id="div2" class="div2">
        <form action="insertOrUpdateTeachers" method="post">
            <div id="bottomdiv">
                <table border="1" id="teachertable1">
                    <tr style="text-align: center;">
                        <td colspan="2"><input type="text"style="display: none" id="tid" name="tid" ><b>添加教师</b></td>
                    </tr>
                    <tr>
                        <td>账号:</td>
                        <td><input type="text" id="tnumber" name="tnumber" readonly="true" ></td>
                    </tr>
                    <tr>
                        <td>姓名:</td>
                        <td><input type="text" id="tname" name="tname"></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td><select id="tsex" name="tsex">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>生日:</td>
                        <td><input type="text" id="tbirthday" name="tbirthday"></td>
                    </tr>
                    <tr>
                        <td>学历:</td>
                        <td><input type="text" id="teducation" name="teducation"></td>
                    </tr>
                    <tr>
                        <td>联系电话:</td>
                        <td><input type="text" id="ttel" name="ttel"></td>
                    </tr>
                    <tr>
                        <td>岗位:</td>
                        <td>
                            <select id="tjob" name="tjob">
                                <option value="0">讲师</option>
                                <option value="1">班主任</option>
                            </select></td>

                    </tr>
                    <tr>
                        <td>备注</td>
                        <td><textarea cols="40" rows="3" id="tremark" name="tremark"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center"><input class="affirm1" type="submit" id="insertteacher" value="确认" onClick=closeShow() >&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="affirm1" <%--id="qvxiao"--%> type="button" value="取消" onClick="closeShow()"></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
    <div id="topdiv">
        <table width="1400px">
            <tr>
                <td width="1000px"><b style="font-size: 25px;position:relative;margin-left: 200px">在线考试管理系统</b></td>
                <td width="400px">
                    2014年7月31日 星期四 8:36
                    [<a id="zhuxiao" style="color: royalblue">注销</a>]
                    [<a id="" style="color: royalblue">退出系统</a>]
                </td>

            </tr>
        </table>
    </div>
    <div id="leftdiv">
        <table style="margin: auto;height: 420px">
            <tr>
                <td><a href="teacherlist.jsp">教师管理</a></td>
            </tr>
            <tr>
                <td><a href="classlist.jsp">班级管理</a></td>
            </tr>
            <tr>
                <td><a href="studentlist.jsp">学生管理</a></td>
            </tr>
            <tr>
                <td><a href="questionbankmanage.jsp">题库管理</a></td>
            </tr>
            <tr>
                <td><a href="examlist.jsp">试卷管理</a></td>
            </tr>
            <tr>
                <td><a href="gradelist.jsp">成绩管理</a></td>
            </tr>
            <tr>
                <td>修改密码</td>
            </tr>
        </table>
    </div>
    <div id="rightdiv">
        <table border="0" style="width: 1000px;height: 120px">
            <tr>
                <td colspan="4"><b id="title">教师列表</b></td>
            </tr>
            <tr>
                <td colspan="4"><input type="button" id="insertteachers" value="添加教师" onClick="show()"></td>
            </tr>
            <tr>
                <td>账号:<input type="text" id="number" ></td>
                <td>教师姓名:<input type="text" id="name"></td>
                <td>岗位:<select id="job">
                    <option value="">请选择</option>
                    <option value="0">讲师</option>
                    <option value="1">班主任</option>
                </select></td>
                <td><input type="button" id="select" value="查询"></td>
            </tr>
        </table>
        <table border="1" id="teacherinfo" style="position:relative;width: 1000px;top: 20px;background-color: darkgrey">
            <%-- <tr style="background-color: darkgrey">
                 <td class="tablemargin">序号</td>
                 <td class="tablemargin">账号</td>
                 <td class="tablemargin">姓名</td>
                 <td class="tablemargin">性别</td>
                 <td class="tablemargin">生日</td>
                 <td class="tablemargin">学历</td>
                 <td class="tablemargin">联系电话</td>
                 <td class="tablemargin">岗位</td>
                 <td class="tablemargin">操作</td>
             </tr>--%>
        </table>
    </div>
</div>
<div id="pagediv">
    <table border="1">
        <tr>
            <td>
                <div id="uppagediv"><a>上一页</a></div>
            </td>
            <td>第<input type="text"style="width: 20px" id="pageindex" name="pageindex" readonly="trune">页</td>
            <td>
                <div id="nextpagediv"><a>下一页</a></div>
            </td>
            <td><a>共<input type="text"style="width: 20px" id="pagecount" name="pagecount" readonly="trune">页</a></td>
        </tr>
    </table>
</div>
</body>
</html>
