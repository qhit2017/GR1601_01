<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>studentlist</title>
</head>
<style>

</style>
<link rel="stylesheet" href="css/studentlist.css">
<script language="JavaScript" src="js/jquery-3.2.1.js" ></script>
<script type="text/javascript">
    //显示的方法，说明：前缀的div1、div2、body等，均为Id值
    function show() {
        bottomdiv.style.display = "block";
        bigdiv.style.display = "none";
        pagediv.style.display="none";
    }
    function closeShow() {
       /* bottomdiv.style.display = "none";
        bigdiv.style.display = "block";
        pagediv.style.display="inline";*/
       window.location.href="studentlist.jsp"
    }
</script>
<script language="JavaScript" src="js/ajaxfileupload.js"></script>
<script>
        $(function () {
            //上传图片
            $("#btn1").click(function () {
                $.ajaxFileUpload({
                    url:"uploadimg",
                    fileElementId:"upload",
                    secureuri:"false",
                    type:"post",
                    dataType:"json",
                    success:function (msg) {
                        var obj  = $.parseJSON(msg);
                        $("#imgresult").val(obj.path);
                        $("#img1").attr("src",obj.path);
                    }
                });
            });
//显示学生信息
            function xianshi(i) {
                if(i==null){
                    i=1;
                }
                $.ajax({
                    url: "selectstudentsallinfo?pageindex="+i,
                    type: "get",
                    success: function (msg) {
                        var pro = eval(msg);
                        var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td>  <td class='tablemargin'>联系电话</td> <td class='tablemargin'>操作</td></tr>";
                        for (var i = 0; i < pro.length; i++) {
                            tabletitle = tabletitle + "<tr> <td class='tablemargin'>" + pro[i].sid + "</td> <td class='tablemargin'>" + pro[i].snumber + "</td> <td class='tablemargin'>" + pro[i].cid.cname + "</td> <td class='tablemargin'>" + pro[i].sname + "</td> <td class='tablemargin'>" + pro[i].ssex + "</td>  <td class='tablemargin'>" + pro[i].stel + "</td><td class='tablemargin' > <a onclick='edit(" + pro[i].sid + ")'>查看编辑</a>  <a onclick='resetpwd(" + pro[i].sid + ")'>重置密码</a>  <a onclick='deleteobj(" + pro[i].sid + ")'>删除</a></td></tr>";
                        }
                        $("#tablestudent").html(tabletitle);
                        getpageinfo();
                    }
                })
            }
            xianshi();
            //下拉框 显示班级
            $.ajax({
                url:"selectcid",
                type:"get",
                success:function (msg) {
                    var binfo=eval(msg);
                    var str="";
                    for(var i=0;i<binfo.length;i++) {
                        str=str+"<option value='"+binfo[i].cid+"'>"+binfo[i].cname+"</option>";
                    }
                    var strtitle="<option value=''>请选择</option>";
                    str=strtitle+str;
                    $("#banjiid").html(str);
                    $("#cid1").html(str);
                }
            });
            //根据条件显示学生信息
            $("#select").click(function () {
                var i = $("#pageindex").val();
                $.ajax({
                    url:"selectstudentinfo",
                    type:"post",
                    data:"pageindex="+i+"&snumber="+$('#snumber').val()+"&sname="+$('#sname').val() +"&id="+$('#banjiid').val()+"&senter="+$('#rxnf').val()+"&sattend="+$('#jdfx').val(),
                    success: function (msg) {
                        var pro = eval(msg);
                        var tabletitle = "<tr style='background-color: darkgrey'> <td class='tablemargin'>序号</td> <td class='tablemargin'>学号</td> <td class='tablemargin'>班级</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td>  <td class='tablemargin'>联系电话</td> <td class='tablemargin'>操作</td></tr>";
                        for (var i = 0; i < pro.length; i++) {
                            tabletitle = tabletitle + "<tr> <td class='tablemargin'>" + pro[i].sid + "</td> <td class='tablemargin'>" + pro[i].snumber + "</td> <td class='tablemargin'>" + pro[i].cid.cname + "</td> <td class='tablemargin'>" + pro[i].sname + "</td> <td class='tablemargin'>" + pro[i].ssex + "</td>  <td class='tablemargin'>" + pro[i].stel + "</td><td class='tablemargin' > <a onclick='edit(" + pro[i].sid + ")'>查看编辑</a>  <a onclick='resetpwd(" + pro[i].sid + ")'>重置密码</a>  <a onclick='deleteobj(" + pro[i].sid + ")'>删除</a></td></tr>";
                        }
                        $("#tablestudent").html(tabletitle);
                        getpageinfo();
                    }
                })
            });
            //添加教师
            $("#insertteachers").click(function () {
                $.ajax({
                    url: "generatetnumber",
                    type: "get",
                    success: function (msg) {
                        var obj = $a.parseJSON(msg);
                        $("#tid").val(obj.t1);
                        $("#tnumber").val(obj.t2);
                    }
                })
            });
            //上一页
            $("#uppagediv").click(function () {
                var i = $("#pageindex").val();
                i--;
                xianshi(i)
            });
            //下一页
            $("#nextpagediv").click(function () {
                var i = $("#pageindex").val();
                i++;
                xianshi(i)
            })

            $("#fileup").click(function () {
                $.ajaxFileUpload({
                    url:"uploadfileup",
                    fileElementId:"upload1",
                    secureuri:"false",
                    success:function () {
                        window.location.href="studentlist.jsp";
                    }
                });
            });
        });
//分页
    function getpageinfo() {
        $.ajax({
            url: "getpage",
            type: "get",
            success:function (msg) {
                var page = $.parseJSON(msg);
                $("#pageindex").val(page.pageIndex);
                $("#pagecount").val(page.pageCount);
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
        $.ajax({
            url: "selectbysid?id=" + editinfo,
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                $("#sid").val(obj[0].sid);
                $("#snumber1").val(obj[0].snumber);
                $("#sname1").val(obj[0].sname);
                $("#senter1").val(obj[0].senter);
                $("#cid1").val(obj[0].cid.cid);
                $("#sbirthday1").val(obj[0].sbirthday);
                $("#sidnumber1").val(obj[0].sidnumber);
                $("#spolitics1").val(obj[0].spolitics);
                $("#sprovince1").val(obj[0].sprovince);
                $("#scity1").val(obj[0].scity);
                $("#smahor1").val(obj[0].smahor);
                $("#sattend1").val(obj[0].sattend);
                $("#stel1").val(obj[0].stel);
                $("#saddress1").val(obj[0].saddress);
                $("#sptel1").val(obj[0].sptel);
                $("#srelation1").val(obj[0].srelation);
                $("#sdormitory1").val(obj[0].sdormitory);
                $("#sdnumber1").val(obj[0].sdnumber);
                $("#sbasicinfo1").val(obj[0].sbasicinfo);
                $("#seducation1").val(obj[0].seducation);
                $("#imgresult").val(obj[0].sphoto);
            }
        });
        show();
    }
    //重置密码
    function resetpwd(pwd) {
        $.ajax({
            url:"resetpwd?id="+pwd,
            type:"get"
        });
        alert("重置成功")
    }
    //删除
    function deleteobj(id) {
        $.ajax({
            url: "delectstudent?id="+id,
            type: "get"
        });
        alert("删除成功")
        window.location.href="studentlist.jsp"
    }
</script>

<body>
<div id="bottomdiv">
    <form action="insertorupdatestudents" method="post">
    <table border="1" id="studenttable">
        <tr>
            <td colspan="4" style="text-align: center;"><input type="text"style="display: none" id="sid" name="sid">添加学生</td>
        </tr>
        <tr>
            <td>学号:</td>
            <td><input type="text" id="snumber1" name="snumber"></td>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td>姓名:</td>
            <td><input type="text" id="sname1" name="sname"></td>
            <td colspan="2"><a style="color: red"><input type="text"name="sphoto"  id="imgresult"></a><input type='button' value='取消'
                                                                              onclick='closeShow();'
                                                                              style='position:relative;left: 100px'>
            </td>
        </tr>
        <tr>
            <td>性别:</td>
            <td><select id="ssex1" name="ssex">
                <option value="男">男</option>
                <option value="女">女</option>
            </select></td>
            <td colspan="3" rowspan="4">照片:<img id="img1" src=""></td>
        </tr>
        <tr>
            <td>入学年份:</td>
            <td><select id="senter1" name="senter">
                <option value="">请选择</option>
                <option value="2015-09-01">2015-09-01</option>
                <option value="2016-09-01">2016-09-01</option>
                <option value="2017-09-01">2017-09-01</option>
            </select></td>
        </tr>
        <tr>
            <td>所属班级:</td>
            <td><select id="cid1" name="cid.cid">
            </select></td>
        </tr>
        <tr>
            <td>生日:</td>
            <td><input type="text" id="sbirthday1" name="sbirthday"></td>

        </tr>
        <tr>
            <td>身份证号:</td>
            <td><input type="text" id="sidnumber1" name="sidnumber"></td>
            <td>政治面貌:</td>
            <td><input type="text" id="spolitics1" name="spolitics"></td>
        </tr>
        <tr>
            <td>省份:</td>
            <td><select id="sprovince1" name="sprovince">
                <option value="">请选择</option>
                <option value="河南省">河南省</option>
                <option value="陕西省">陕西省</option>
                <option value="青海省">青海省</option>
                <option value="山西省">山西省</option>
                <option value="四川省">四川省</option>
            </select></td>
            <td>城市</td>
            <td><select id="scity1" name="scity">
                <option value="">请选择</option>
                <option value="郑州市">郑州市</option>
                <option value="西安市">西安市</option>
                <option value="西宁市">西宁市</option>
                <option value="古交市">古交市</option>
                <option value="四川省">成都市</option>
            </select></td>
        </tr>
        <tr>
            <td>专业简称:</td>
            <td><select id="smahor1" name="smahor">
                <option value="">请选择</option>
                <option value="软件开发">软件开发</option>
                <option value="软件工程师">软件工程师</option>
            </select></td>
            <td>就读方向:</td>
            <td><select id="sattend1" name="sattend">
                <option value="">请选择</option>
                <option value="高软">高软方向</option>
                <option value="3G4G">3G4G方向</option>
            </select></td>
        </tr>
        <tr>
            <td>联系电话:</td>
            <td><input type="text" id="stel1"name="stel"></td>
            <td>家庭住址:</td>
            <td><input type="text" id="saddress1" name="saddress"></td>
        </tr>
        <tr>
            <td>家长联系电话:</td>
            <td><input type="text" id="sptel1" name="sptel"></td>
            <td>监护人与学生关系:</td>
            <td><input type="text" id="srelation1" name="srelation"></td>
        </tr>
        <tr>
            <td>宿舍:</td>
            <td>
                <select id="sdormitory1" name="sdormitory">
                    <option value="8">8</option>
                    <option value="7">7</option>
                </select></td>
            <td>宿舍号:</td>
            <td><input type="text" id="sdnumber1" name="sdnumber"></td>
        </tr>
        <tr>
            <td>基本情况:</td>
            <td colspan="3" rowspan="1"><textarea cols="80" rows="2" id="sbasicinfo1" name="sbasicinfo"></textarea></td>
        </tr>
        <tr>
            <td>教育:</td>
            <td colspan="3" rowspan="1"><textarea cols="80" rows="2" id="seducation1" name="seducation"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center"><input id="affirm" type="submit" value="添加">
                &nbsp;&nbsp;&nbsp;&nbsp;<input style="width: 100px;height: 30px;" type="button" value="取消" onclick="closeShow()"></td>
        </tr>
    </table>
    </form>
    <input type="file" id="upload" name="upload">
    <input type="button"id="btn1" value="提交" ><%--onClick="closeShow()"--%>
    <%--<img id="img1" src="">--%>
</div>
<div id="bigdiv">
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
                <td colspan="6"><b id="title">学生列表</b></td>
            </tr>
            <tr>
                <td colspan="6"><input type="button" value="添加学生" onClick="show()">&nbsp;
                    <input type="button" value="学生信息导出">&nbsp;
                    <input type="file" id="upload1" name="upload">
                    <input type="button" id="fileup" value="学生信息导入"> &nbsp;
                    <a href="filedown?filename=students.xlsx"><input type="button" value="学生信息空模板下载"></a>
                </td>
            </tr>
            <tr>
                <td>学号:<input type="text" id="snumber" value=""></td>
                <td>姓名:<input type="text" id="sname" value=""></td>
                <td>班级:<select id="banjiid">
                </select></td>
                <td>入学年份:<select id="rxnf">
                    <option value="">请选择</option>
                    <option value="2017-11-30">2017-11-30</option>
                    <option value="2017-9-1">2017-09-01</option>
                </select></td>
                <td>就读方向:<select id="jdfx">
                    <option value="">请选择</option>
                    <option value="高软">高软方向</option>
                    <option value="3G4G">3G4G方向</option>
                </select></td>
                <td><input type="button" id="select" value="查询"></td>
            </tr>
        </table>
        <table border="1" id="tablestudent" style="position:relative;width: 1000px;top: 20px;">
            <tr style="background-color: darkgrey">
                <td class="tablemargin">序号</td>
                <td class="tablemargin">学号</td>
                <td class="tablemargin">班级</td>
                <td class="tablemargin">姓名</td>
                <td class="tablemargin">性别</td>
                <td class="tablemargin">讲师</td>
                <td class="tablemargin">联系电话</td>
                <td class="tablemargin">操作</td>
            </tr>
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
