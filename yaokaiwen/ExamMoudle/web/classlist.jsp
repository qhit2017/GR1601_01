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
    <title>classlist</title>
</head>
<link rel="stylesheet" href="css/classlist.css">
<script type="text/javascript"src="js/jquery-3.2.1.js" ></script>
<script language="JavaScript">
    //显示的方法，说明：前缀的div1、div2、body等，均为Id值
    var $a = jQuery.noConflict()
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
    function closeShow() {
        div1.style.display = "none";
        div2.style.display = "none";
        pagediv.style.display="inline";
        window.location.href="classlist.jsp";
    }
</script>
<script>
    var $a = jQuery.noConflict();
    $a(function () {
        //显示班级信息
        function xianshi(i) {
            if(i==null){
                i=1;
            }
            $a.ajax({
                url:"selectclassesallinfo?pageindex="+i,
                type:"get",
                success:function (msg) {
                    var pro=eval(msg);
                    var tabletitle="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                    for (var i=0;i<pro.length;i++){
                        if(pro[i].cstate==0){
                            tabletitle=tabletitle+"<tr><td class='tablemargin'>"+pro[i].cid+"</td> <td class='tablemargin'>"+pro[i].cnumber+"</td> <td class='tablemargin'>"+pro[i].cname+"</td> <td class='tablemargin'>"+pro[i].cdirection+"</td> <td class='tablemargin'>"+pro[i].tidh.tname+"</td> <td class='tablemargin'>"+pro[i].tidl.tname+"</td> <td class='tablemargin'>"+pro[i].cbegin+"</td> <td class='tablemargin'>开启</td> <td class='tablemargin'><a onclick='edit(" + pro[i].cid + ")'>编辑</a></td> </tr>";
                        }else {
                            tabletitle=tabletitle+"<tr><td class='tablemargin'>"+pro[i].cid+"</td> <td class='tablemargin'>"+pro[i].cnumber+"</td> <td class='tablemargin'>"+pro[i].cname+"</td> <td class='tablemargin'>"+pro[i].cdirection+"</td> <td class='tablemargin'>"+pro[i].tidh.tname+"</td> <td class='tablemargin'>"+pro[i].tidl.tname+"</td> <td class='tablemargin'>"+pro[i].cbegin+"</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'>编辑</td> </tr>";
                        }
                    }
                    $a("#classtable").html(tabletitle);
                    getpageinfo();
                }
            });
        }
        //查询开班日期
        $a.ajax({
            url:"selectcbegin",
            type:"get",
            success:function (msg) {
                var binfo=eval(msg);
                var str="<option value=''>请选择</option>";
                for(var i=0;i<binfo.length;i++){
                    str=str+"<option value='"+binfo[i]+"'>"+binfo[i]+"</option>";
                }
                $a("#intime").html(str);
            }
        });
        //查询教师
        $a.ajax({
            url:"selecttidltname",
            type:"get",
            success:function (msg) {
                var binfo=eval(msg);
                var str="";
                for(var i=0;i<binfo.length;i++){
                    str=str+"<option value='"+binfo[i].tid+"'>"+binfo[i].tname+"</option>";
                }
                var strtitle="<option value=''>请选择</option>";
                str=strtitle+str;
                $a("#tjobl").html(str);
                $a("#tidl").html(str);
            }
        });
        //查询班主任
        $a.ajax({
            url:"selecttidhtname",
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
                $a("#tidh").html(str);
            }
        });
        xianshi();
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
        //根据条件查询班级信息
        $a("#fourconditionselect").click(function () {
            tiaojianselect();
        })
        //重置密码
        $a("#reset").click(function () {
            $a("#intime").val("")
            $a("#cdirection").val("")
            $a("#tjobl").val("")
            $a("#tjob2").val("")
            xianshi(1);
        })
    })
    //根据条件查询
    function tiaojianselect() {
        $a.ajax({
            url:"selectclassesinfo",
            type:"post",
            data:"pageindex="+$a("#pageindex").val()+"&cbegin="+$a("#intime").val()+"&cdirection="+$a("#cdirection").val() +"&idl="+$a("#tjobl").val()+"&idh="+$a("#tjob2").val() ,
            success:function (msg) {
                var pro=eval(msg);
                var tabletitle="<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>班级代码</td> <td class='tablemargin'>班级名称</td> <td class='tablemargin'>所属方向</td> <td class='tablemargin'>班主任</td> <td class='tablemargin'>讲师</td> <td class='tablemargin'>开班日期</td> <td class='tablemargin'>状态</td> <td class='tablemargin'>操作</td> </tr>";
                if(pro!=null){
                    for (var i=0;i<pro.length;i++){
                        if(pro[i].cstate==0){
                            tabletitle=tabletitle+"<tr><td class='tablemargin'>"+pro[i].cid+"</td> <td class='tablemargin'>"+pro[i].cnumber+"</td> <td class='tablemargin'>"+pro[i].cname+"</td> <td class='tablemargin'>"+pro[i].cdirection+"</td> <td class='tablemargin'>"+pro[i].tidh.tname+"</td> <td class='tablemargin'>"+pro[i].tidl.tname+"</td> <td class='tablemargin'>"+pro[i].cbegin+"</td> <td class='tablemargin'>开启</td> <td class='tablemargin'>编辑</td> </tr>";
                        }else {
                            tabletitle=tabletitle+"<tr><td class='tablemargin'>"+pro[i].cid+"</td> <td class='tablemargin'>"+pro[i].cnumber+"</td> <td class='tablemargin'>"+pro[i].cname+"</td> <td class='tablemargin'>"+pro[i].cdirection+"</td> <td class='tablemargin'>"+pro[i].tidh.tname+"</td> <td class='tablemargin'>"+pro[i].tidl.tname+"</td> <td class='tablemargin'>"+pro[i].cbegin+"</td> <td class='tablemargin'>禁用</td> <td class='tablemargin'>编辑</td> </tr>";
                        }
                    }
                }
                $a("#classtable").html(tabletitle);
                getpageinfo();
            }
        })
    }
//分页
    function getpageinfo() {
        $a.ajax({
            url: "getPage",
            type: "get",
            success:function (msg) {
                var page = $a.parseJSON(msg);
                $a("#pageindex").val(page.pageIndex);
                $a("#pagecount").val(page.pageCount);
                if(page.uppage == true){
                    uppagediv.style.display = "inline";
                }else {
                    uppagediv.style.display = "none";
                }
                if(page.nextpage == true){
                    nextpagediv.style.display = "inline";
                }else {
                    nextpagediv.style.display = "none";
                }
            }
        })
    }
    //点击编辑
    function edit(editinfo) {
        var cid = editinfo;
        $a.ajax({
            url: "selectbycid?id=" + cid,
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                 $a("#cid").val(obj.cid);
                 $a("#cnumber").val(obj.cnumber);
                 $a("#cname").val(obj.cname);
                 $a("#direction").val(obj.cdirection);
                 $a("#tidl").val(obj.tidl.tid);
                 $a("#tidh").val(obj.tidh.tid);
                 $a("#cbegin").val(obj.cbegin);
                 $a("#cg1").val(obj.cg1);
                 $a("#cg2").val(obj.cg2);
                 $a("#cg3").val(obj.cg3);
                 $a("#cstate").val(obj.cstate);
                 $a("#cremark").val(obj.cremark);
            }
        });
        show();
    }

</script>
<body>
<div id="bigdiv">
    <div id="div1" class="div1"></div><!--这是要覆盖网页的层，不必写任何东西-->
    <div id="div2" class="div2">
        <form action="insertorupdateclasses" method="post">
            <table border="1" id="newclasstable" >
                <tr style="text-align: center"><td colspan="2" ><input type="text"style="display: none" id="cid" name="cid" ><b >创建班级</b></td></tr>
                <tr><td>班级代码:</td>
                    <td><input type="text" id="cnumber" name="cnumber"></td>
                </tr>
                <tr>
                    <td>班级名称:</td>
                    <td><input type="text" id="cname" name="cname"></td>
                </tr>
                <tr>
                    <td>所属方向:</td>
                    <td><select id="direction" name="cdirection">
                        <option value="高软">高软</option>
                        <option value="3G4G">3G4G</option>
                    </select></td>
                </tr>
                <tr>
                    <td>班主任:</td>
                    <td><select name="tidl.tid" id="tidl"></select></td>
                </tr>
                <tr>
                    <td>讲师:</td>
                    <td><select name="tidh.tid" id="tidh"></select></td>
                </tr>
                <tr>
                    <td>开班日期:</td>
                    <td><input type="text" id="cbegin" name="cbegin"></td>
                </tr>
                <tr>
                    <td>G1开班人数:</td>
                    <td><input type="text" id="cg1" name="cg1"></td>
                </tr>
                <tr><td>G2开班人数:</td>
                    <td><input type="text" id="cg2" name="cg2"></td>
                </tr>
                <tr><td>G3开班人数:</td>
                    <td><input type="text" id="cg3" name="cg3"></td>
                </tr>
                <tr><td>状态:</td>
                    <td><select name="cstate" id="cstate"><option value="0">启用</option><option value="1">禁用</option></select></td>
                </tr>
                <tr><td>备注:</td>
                    <td><input type="text" id="cremark" name="cremark"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center"><input id="affirm" type="submit" value="添加">
                        &nbsp;&nbsp;&nbsp;&nbsp;<input style="width: 100px;height: 30px;" type="button" value="取消" onclick="closeShow()"></td>
                </tr>
            </table>
        </form>
    </div>
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
        <tr><td colspan="4"><input type="button" value="新建班级" onclick="show(),nonepagetable()"></td></tr>
        <tr >
            <td>入学年份:<select id="intime"></select></td>
            <td >所属方向:<select id="cdirection">
                <option value="">请选择</option>
                <option value="高软">高软</option>
                <option value="3G4G">3G4G</option>
            </select></td>
            <td>讲师:<select id="tjobl">
            </select></td>
            <td>班主任:<select id="tjob2">
            </select></td>
            <td><input type="button" value="查询" id="fourconditionselect"></td>
            <td><input type="reset" id="reset" value="重置"></td>
        </tr>
        <table border="1" style="position:relative;width: 1000px;top: 20px;" id="classtable" >
            <tr style="background-color: darkgrey">
                <td class="tablemargin">序号</td>
                <td class="tablemargin">班级代码</td>
                <td class="tablemargin">班级名称</td>
                <td class="tablemargin">所属方向</td>
                <td class="tablemargin">班主任</td>
                <td class="tablemargin">讲师</td>
                <td class="tablemargin">开班日期</td>
                <td class="tablemargin">状态</td>
                <td class="tablemargin">操作</td>
            </tr>
        </table>
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
