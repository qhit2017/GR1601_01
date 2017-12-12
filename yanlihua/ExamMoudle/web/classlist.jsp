<%@ taglib prefix="c" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 晏利花
  Date: 2017/11/20
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>classlist</title>
</head>
<style>
    #bigdiv{
        width: 100%;
        height: 700px;
        background-color: bisque;
        position: fixed;
    }
    #topdiv{
        width: 100%;
        height: 60px;
        background-color: gainsboro;
        border-bottom:1px solid black;
    }
    #leftdiv{
        width: 299px;
        height: 640px;
        position: relative;
        background-color: beige;
        border-right:1px solid black;
    }
    #rightdiv{
        width: 1300px;
        height: 640px;
        position: relative;
        bottom:640px;
        left: 300px;
        background-color: lavender;
    }
    .tablemargin{
        text-align: center;
    }
    #title{
        position:relative;
        left: 400px;
        font-size: 20px
    }
    #page {
        width: 320px;
        height: 40px;
        position: relative;
        top: 650px;
        left: 1050px;
        z-index: 10;

    }


    #affirm{
        width: 100px;
        height: 30px;
    }
    #newclasstable{
        height: 600px;
        width: 500px;
        position: fixed;
        left: 500px;

    }
    a{
        text-decoration: none;
    }

    #bottomdiv {
        width: 100%;
        height: 700px;
        position: fixed;
        display: none;
        background-color: gainsboro;
        margin: auto;
    }
</style>
<script type="text/javascript" language="JavaScript"></script>
<script src="js/jquery-3.2.1.js"></script>
<script>
    function show() {
        bottomdiv.style.display = "block";
        bigdiv.style.display = "none";
    }
    function closeShow() {
        bottomdiv.style.display = "none";
        bigdiv.style.display = "block";

    }
</script>
<script>
    var $a=jQuery.noConflict();
    var pageindex;
    var pageConunt;

    function refresh() {
        //班级界面的所有信息显示
        $a.ajax({
            url: "selectclassallinfoway",
            type: "get",
            success: function (msg) {
                var pro = eval(msg);
                var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                for (var i = 0; i < pro.length; i++) {
                    if (pro[i].cstate == 0) {
                        var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                    }
                    if (pro[i].cstate == 1) {
                        var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                    }
                }
                var table = tabletitle + tableinfo;
                $a("#classtable").html(table);
                // 画分页效果
                getPageInfo();
            }
        });

    }

    $a(document).ready(function (){
        //界面的刷新
        refresh();
        //班主任下拉框中出现姓名
        $a.ajax({
            url:"selectallinfob",
            type:"get",
            success:function (msg) {
                var binfo=eval(msg);
                var str="";
                for(var i=0;i<binfo.length;i++) {
                    str=str+"<option value='"+binfo[i].tid+"'>"+binfo[i].tname+"</option>";
                }
                var strtitle="<option value=''>请选择</option>";
                str=strtitle+str;
                $a("#tjobl").html(str);
            }
        });

        $a.ajax({
            url:"selectallinfoj",
            type:"get",
            success:function (msg) {
                var binfo=eval(msg);
                var str="";
                for(var i=0;i<binfo.length;i++) {
                    str=str+"<option value='"+binfo[i].tid+"'>"+binfo[i].tname+"</option>";
                }
                var strtitle="<option value=''>请选择</option>";
                str=strtitle+str;
                $a("#tjob2").html(str);
            }
        });

//根据四个下拉框的条件经行信息查询
        $a("#fourconditionselect").click(function () {
            var intime=$a("#intime").val();
            var direction=$a("#direction").val();
            var tjobl=$a("#tjobl").val();
            var tjob2=$a("#tjob2").val();
            //alert(intime+" :"+direction+" :"+tjobl+" "+tjob2);
            $a.ajax({
                url:"fourconditionselectway?cbegin="+intime+"&cdirection="+direction+"&tidl="+tjobl+"&tidh="+tjob2,
                type:"get",
                success:function (msg) {
                    var pro=eval(msg);
                    var tabletitle="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i=0;i<pro.length;i++){
                        if(pro[i].cstate==0){
                            var tableinfo=tableinfo+"<tr><td class='tablemargin'>"+pro[i].cid+"</td> <td class='tablemargin'>"+pro[i].cnumber+"</td> <td class='tablemargin'>"+pro[i].cname+"</td> <td class='tablemargin'>"+pro[i].cdirection+"</td> <td class='tablemargin'>"+pro[i].teachersl.tname+"</td> <td class='tablemargin'>"+pro[i].teachersh.tname+"</td> <td class='tablemargin'>"+pro[i].cbegin+"</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit("+pro[i].cid+")'>编辑</a></td> </tr>";
                        }
                        if(pro[i].cstate==1){
                            var tableinfo=tableinfo+"<tr><td class='tablemargin'>"+pro[i].cid+"</td> <td class='tablemargin'>"+pro[i].cnumber+"</td> <td class='tablemargin'>"+pro[i].cname+"</td> <td class='tablemargin'>"+pro[i].cdirection+"</td> <td class='tablemargin'>"+pro[i].teachersl.tname+"</td> <td class='tablemargin'>"+pro[i].teachersh.tname+"</td> <td class='tablemargin'>"+pro[i].cbegin+"</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'><a onclick='edit("+pro[i].cid+")'>编辑</a></td> </tr>";
                        }
                    }
                    var table=tabletitle+tableinfo;
                    $a("#classtable").html(table);
                }
            });
        });

//重置reset
        $a("#reset").click(function () {
            var time=document.getElementById("intime");
            time.options[0].selected=true;
            var direction=document.getElementById("direction");
            direction.options[0].selected=true;
            var tjobl=document.getElementById("tjobl");
            tjobl.options[0].selected=true;
            var tjob2=document.getElementById("tjob2");
            tjob2.options[0].selected=true;

        });

//添加班级信息
        $a("#affirm").click(function () {
            var cnumber=$a("#cnumber").val();
            var cname=$a("#cname").val();
            var cdirection=$a("#cdirection").val();
            //alert(cnumber+" "+cname+" "+cdirection);
            var tidl=$a("#tidl").val();
            var tidh=$a("#tidh").val();
            var cbegin=$a("#cbegin").val();
            //alert(tidl+" "+tidh+" "+cbegin);
            var cg1=$a("#cg1").val();
            var cg2=$a("#cg2").val();
            var cg3=$a("#cg3").val();
            //alert(cg1+" "+cg2+" "+cg3);
            var cstate=$a("#cstate").val();
            var cremark=$a("#cremark").val();
           /*alert(cstate+" "+cremark);*/
            $a.ajax({
                url:"saveclassesinfoway?cnumber="+cnumber+"&cname="+cname+"&cdirection="+cdirection+"&tidl="+tidl+"&tidh="+tidh+"&cbegin="+cbegin+"&cg1="+cg1+"&cg2="+cg2+"&cg3="+cg3+"&cstate="+cstate+"&cremark="+cremark,

                //url:"saveclassesinfoway?cnumber="+cnumber+"&cname="+cname+"&cdirection="+cdirection+"&cbegin="+cbegin+"&cg1="+cg1+"&cg2="+cg2+"&cg3="+cg3+"&cstate="+cstate/*+"&cremark="+cremark*/,

                type:"get",
                success:function (msg) {
                    var obj=$a.parseJSON(msg);
                    if(obj.result=="true"){
                        alert("班级信息添加成功！！！");
                        closeShow();
                        refresh();
                    }
                   else{
                        alert("班级信息添加失败！！！");
                    }
                }
            });
        });
//上一页
        $a("#uppage").click(function () {
            pageindex--;
            $a.ajax({
                url: "selectclassallinfoway?pageindex=" + pageindex,
                type: "get",
                success: function (msg) {
                    var pro = eval(msg);
                    var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < pro.length; i++) {
                        if (pro[i].cstate == 0) {
                            var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                        }
                        if (pro[i].cstate == 1) {
                            var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                        }
                    }
                    var table = tabletitle + tableinfo;
                    $a("#classtable").html(table);
                    //画分页效果
                    getPageInfo();


                }
            });

        });

        //下一页
        $a("#nextpage").click(function () {
            pageindex++;
            $a.ajax({
                url: "selectclassallinfoway?pageindex=" + pageindex,
                type: "get",
                success: function (msg) {
                    var pro = eval(msg);
                    var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < pro.length; i++) {
                        if (pro[i].cstate == 0) {
                            var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                        }
                        if (pro[i].cstate == 1) {
                            var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                        }
                    }
                    var table = tabletitle + tableinfo;
                    $a("#classtable").html(table);
                    //画分页效果
                    getPageInfo();


                }
            });

        });

        //首页
        $a("#page2").click(function () {
            $a.ajax({
                url: "selectclassallinfoway?pageindex=" + 1,
                type: "get",
                success: function (msg) {
                    var pro = eval(msg);
                    var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < pro.length; i++) {
                        if (pro[i].cstate == 0) {
                            var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                        }
                        if (pro[i].cstate == 1) {
                            var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                        }
                    }
                    var table = tabletitle + tableinfo;
                    $a("#classtable").html(table);
                    //画分页效果
                    getPageInfo();


                }
            });

        });

        //尾页
        $a("#page5").click(function () {
            pageindex++;
            $a.ajax({
                url: "selectclassallinfoway?pageindex=" + pageConunt,
                type: "get",
                success: function (msg) {
                    var pro = eval(msg);
                    var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i = 0; i < pro.length; i++) {
                        if (pro[i].cstate == 0) {
                            var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                        }
                        if (pro[i].cstate == 1) {
                            var tableinfo = tableinfo + "<tr><td class='tablemargin'>" + pro[i].cid + "</td> <td class='tablemargin'>" + pro[i].cnumber + "</td> <td class='tablemargin'>" + pro[i].cname + "</td> <td class='tablemargin'>" + pro[i].cdirection + "</td> <td class='tablemargin'>" + pro[i].teachersl.tname + "</td> <td class='tablemargin'>" + pro[i].teachersh.tname + "</td> <td class='tablemargin'>" + pro[i].cbegin + "</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                        }
                    }
                    var table = tabletitle + tableinfo;
                    $a("#classtable").html(table);
                    //画分页效果
                    getPageInfo();


                }
            });

        });

    });



//++++++++++++++++++++++++++++++++++++++++++++方法++++++++++++++++++++++++++++++++++++++++++++++++++
//分页显示隐藏
    function nonepagetable() {
        $a("#page").css("display", "none");

    }
    //显示
    function showpagetable() {
        $a("#page").css("display", "block");

    }

//下拉框中班主任与讲师从数据库中读取(动态读取)
    function addclasslandh() {
        $a.ajax({
            url:"selectallinfoj",
            type:"get",
            success:function (msg) {
                var binfo=eval(msg);
                var str="";
                for(var i=0;i<binfo.length;i++) {
                    str=str+"<option value='"+binfo[i].tid+"'>"+binfo[i].tname+"</option>";
                }
                var strtitle="<option value=''>请选择</option>";
                str=strtitle+str;
                $a("#tidl").html(str);
            }
        });

        $a.ajax({
            url:"selectallinfob",
            type:"get",
            success:function (msg) {
                var binfo=eval(msg);
                var str="";
                for(var i=0;i<binfo.length;i++) {
                    str=str+"<option value='"+binfo[i].tid+"'>"+binfo[i].tname+"</option>";
                }
                var strtitle="<option value=''>请选择</option>";
                str=strtitle+str;
                $a("#tidh").html(str);
            }
        });
    }

//编辑方法
    function edit(editway) {
        //alert(editway);
        $a.ajax({
            url:"selectcidselectinfoway?cid="+editway,
            type:"get",
            success:function (msg) {
                var result = $a.parseJSON(msg);
                //alert(result.classes.cnumber);
                var info="<table border='1' id='newclasstable' > <tr style='text-align: center'><td colspan='2' ><b >创建班级</b></td></tr> <tr><td>班级代号:</td> <td><input type='text' id='cnumber' value='"+result.classes.cnumber+"'></td> </tr> <tr> <td>班级名称:</td> <td><input type='text' id='cname'value='"+result.classes.cname+"'></td> </tr> <tr> <td>所属方向:</td> <td><select id='cdirection'><option value='高软'>高软</option><option value='3G4G'>3G4G</option></select></td> </tr> <tr> <td>班主任:</td> <td ><select id='tidh'></select></td> </tr> <tr> <td>讲师:</td> <td><select id='tidl' ></select></td> </tr> <tr> <td>开班日期:</td> <td><input type='text' id='cbegin' value='"+result.classes.cbegin+"'></td> </tr> <tr> <td>G1开班人数:</td> <td><input type='text' id='cg1' value='"+result.classes.cg1+"'></td> </tr> <tr><td>G2开班人数:</td> <td><input type='text' id='cg2' value='"+result.classes.cg2+"'></td> </tr> <tr><td>G3开班人数:</td> <td><input type='text' id='cg3' value='"+result.classes.cg3+"'></td> </tr> <tr><td>状态:</td> <td><select id='cstate'><option value='0'>启用</option><option value='1'>禁用</option></select></td> </tr> <tr><td>备注:</td> <td><textarea cols='40' rows='2' id='cremark' >"+result.classes.cremark+"</textarea></td> </tr> <tr> <td colspan='2' style='text-align: center'><input id='affirm' type='button' value='添加'onclick='addupdatebutton("+result.classes.cid+"),closeShow()'> &nbsp;&nbsp;&nbsp;&nbsp;<input style='width: 100px;height: 30px;' type='button' value='取消' onclick='closeShow(),refresh(),getPageInfo(),showpagetable()'></td> </tr> </table>";
                $a("#bottomdiv").html(info);
                //这里直接调用show方法进行显示
                show();
                //下拉框动态赋值
                addclasslandh();
            }
    });



    }

//根据id进行修改
    function addupdatebutton(cid) {
        //alert(cid);
        var cnumber=$a("#cnumber").val();
        var cname=$a("#cname").val();
        var cdirection=$a("#cdirection").val();
        var tidl=$a("#tidl").val();
        var tidh=$a("#tidh").val();
        var cbegin=$a("#cbegin").val();
        var cg1=$a("#cg1").val();
        var cg2=$a("#cg2").val();
        var cg3=$a("#cg3").val();
        var cstate=$a("#cstate").val();
        var cremark=$a("#cremark").val();
        //根据tid修改信息
        $a.ajax({
            url: "tidupdateinfoway?cid=" + cid+"&cnumber="+cnumber+"&cname="+cname+"&cdirection="+cdirection+"&tidl="+tidl+"&tidh="+tidh+"&cbegin="+cbegin+"&cg1="+cg1+"&cg2="+cg2+"&cg3="+cg3+"&cstate="+cstate+"&cremark="+cremark,
            type: "get",
            success: function (msg) {
                var obj=$a.parseJSON(msg);
                if(obj.result=="true"){
                    alert("班级信息修改成功！！！");
                    closeShow();
                    refresh();
                }
                else{
                    alert("班级信息修改失败！！！");
                }
            }
        });
    }


    //画分页效果（每次发请求都画一次，去调用这个方法）
    function getPageInfo() {
        $a.ajax({
            url: "getpage",
            type: "get",
            success: function (msg) {
                var page = $a.parseJSON(msg);
                pageindex = page.pageIndex;
               /* alert(pageindex);*/
                pageConunt = page.pageCount;
                $a("#page1").html("第" + pageindex + "页&nbsp;" + "共" + page.pageCount + "页&nbsp;");

                if (page.uppage == true) {
                    $a("#page3").css("display", "block");
                    $a("#page3-1").css("display", "none");
                }
                else {
                    $a("#page3").css("display", "none");
                    $a("#page3-1").css("display", "block");
                }
                if (page.nextpage == true) {
                    $a("#page4").css("display", "block");
                    $a("#page4-1").css("display", "none");
                }
                else {
                    $a("#page4").css("display", "none");
                    $a("#page4-1").css("display", "block");
                }


            }
        });
    }
</script>


<body>

<div id="bottomdiv">
    <table border="1" id="newclasstable" >
        <tr style="text-align: center"><td colspan="2" ><b >创建班级</b></td></tr>
        <tr><td>班级代码:</td>
            <td><input type="text" id="cnumber"></td>
        </tr>
        <tr>
            <td>班级名称:</td>
            <td><input type="text" id="cname"></td>
        </tr>
        <tr>
            <td>所属方向:</td>
            <td><select id="cdirection"><option value="高软">高软</option><option value="3G4G">3G4G</option></select></td>
        </tr>
        <tr>
            <td>班主任:</td>
            <td ><select id="tidh"></select></td>
        </tr>
        <tr>
            <td>讲师:</td>
            <td><select id="tidl" ></select></td>
        </tr>
        <tr>
            <td>开班日期:</td>
            <td><input type="text" id="cbegin"></td>
        </tr>
        <tr>
            <td>G1开班人数:</td>
            <td><input type="text" id="cg1"></td>
        </tr>
        <tr><td>G2开班人数:</td>
            <td><input type="text" id="cg2"></td>
        </tr>
        <tr><td>G3开班人数:</td>
            <td><input type="text" id="cg3"></td>
        </tr>
        <tr><td>状态:</td>
            <td><select id="cstate"><option value="0">启用</option><option value="1">禁用</option></select></td>
        </tr>
        <tr><td>备注:</td>
            <td><input type="text" id="cremark"></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center"><input id="affirm" type="button" value="添加">
                &nbsp;&nbsp;&nbsp;&nbsp;<input style="width: 100px;height: 30px;" type="button" value="取消" onclick='closeShow(),refresh(),getPageInfo(),showpagetable()'></td>
        </tr>
    </table>
</div>

<div id="bigdiv">
    <div id="topdiv">
        <table width="1400px">
            <tr>
                <td width="1000px"><b style="font-size: 25px;position:relative;margin-left: 200px">在线考试管理系统</b></td>
                <td width="400px" >
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
            <tr ><td colspan="4" ><b id="title">班级列表</b></td></tr>
            <tr><td colspan="4"><input type="button" value="新建班级" onclick="show(),nonepagetable(),addclasslandh()"></td></tr>
            <tr >
                <td>入学年份:<select id="intime"><option value="">请选择</option><option value="2015-09-01">2015-09-01</option><option value="2016-09-01">2016-09-01</option><option id="2017-09-01">2017-09-01</option></select></td>
                <td >所属方向:<select id="direction">
                    <option value="" >请选择</option>
                    <option value="高软">高软</option>
                    <option value="3G4G">3G4G</option>
                </select></td>
                <td>讲师:<select id="tjobl"></select></td>
                <td>班主任:<select id="tjob2"></select></td>
                <td><input type="button" value="查询" id="fourconditionselect"></td>
                <td><input type="reset" id="reset" value="重置"></td>
            </tr>
        </table>
        <table border="1" style="position:relative;width: 1000px;top: 20px;" id="classtable">
            <%--<tr style="background-color: darkgrey">
                <td class="tablemargin">序号</td>
                <td class="tablemargin">班级代码</td>
                <td class="tablemargin">班级名称</td>
                <td class="tablemargin">所属方向</td>
                <td class="tablemargin">班主任</td>
                <td class="tablemargin">讲师</td>
                <td class="tablemargin">开班日期</td>
                <td class="tablemargin">状态</td>
                <td class="tablemargin">操作</td>
            </tr>--%>
        </table>

    </div>
</div>
<%--<table border="1" id="page">
    <tr>
        <td style="text-align: right">
            第1页，
            共1页&nbsp;
            首页&nbsp;
            上一页&nbsp;
            下一页&nbsp;
            末页
        </td>
    </tr>
</table>--%>


<table border="0" id="page">
    <tr>
        <td style="text-align: right">
            <div id="page1"></div>
        </td>
        <td>
            <div id="page2">首页&nbsp;</div>
        </td>
        <td>
            <div id="page3"><a id="uppage">上一页&nbsp;</a></div>
            <div id="page3-1" style="display: none">上一页&nbsp;</div>
        </td>
        <td>
            <div id="page4"><a id="nextpage">下一页&nbsp;</a></div>
            <div id="page4-1" style="display: none">下一页&nbsp;</div>
        </td>
        <td>
            <div id="page5"><a id="end">末页</a></div>
        </td>
    </tr>
</table>
</body>
</html>
