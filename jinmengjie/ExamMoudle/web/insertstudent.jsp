<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/21/021
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>添加学生页面</title>
</head>
<style>
    #bigdiv{
        position: absolute;
        width: 1000px;
        height: 850px;
        background: gainsboro;
        align-content: center;
        left: 300px;
    }


</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script>
    $(document).ready(function () {
        //学生界面动态获取班级信息
        $.ajax({
            url: "getclassesinfo",
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                var str = "";
                for (var i = 0; i < obj.length; i++) {
                    str = str + "<option value='" + obj[i].cid + "'>" + obj[i].cname + "</option>";
                }
                var strtitle = "<option value=''>请选择</option>";
                str = strtitle + str;
                $("#cid1").html(str);
                $("#cid1").val(<s:property value='students.cid.cid'></s:property>);
            }

        })
        //上传图片
        $("#tijiao").click(function () {
            $.ajaxFileUpload({
                url:"uploadimg",
                //获取上传域的控件ID
                fileElementId:"upload",
                type:"post",
                //接收返回值的类型
                dataType:"json",
                success:function (msg) {
                    var obj = $.parseJSON(msg);
                    //给存放路径的文本框赋值
                    $("#sphoto").val(obj.path);
                    $("#imgid").attr("src",obj.path)
                }
            })
        })
        $("#sid").val(<s:property value='students.sid'></s:property>);
        $("#snumber1").val("<s:property value='students.snumber'></s:property>");
        $("#sname1").val("<s:property value='students.sname'></s:property>");
        $("#senter1").val("<s:property value='students.senter'></s:property>");
        $("#sbirthday1").val("<s:property value='students.sbirthday'></s:property>");
        $("#sidnumber1").val("<s:property value='students.sidnumber'></s:property>");
        $("#spolitics1").val("<s:property value='students.spolitics'></s:property>");
        $("#sprovince1").val("<s:property value='students.sprovince'></s:property>");
        $("#scity1").val("<s:property value='students.scity'></s:property>");
        $("#smahor1").val("<s:property value='students.smahor'></s:property>");
        $("#sattend1").val("<s:property value='students.sattend'></s:property>");
        $("#stel1").val("<s:property value='students.stel'></s:property>");
        $("#saddress1").val("<s:property value='students.saddress'></s:property>");
        $("#sptel1").val("<s:property value='students.sptel'></s:property>");
        $("#srelation1").val("<s:property value='students.srelation'></s:property>");
        $("#sdormitory1").val("<s:property value='students.sdormitory'></s:property>");
        $("#sdnumber1").val("<s:property value='students.sdnumber'></s:property>");
        $("#sbasicinfo1").val("<s:property value='students.sbasicinfo'></s:property>");
        $("#seducation1").val("<s:property value='students.seducation'></s:property>");
        $("#sphoto").val("<s:property value='students.sphoto'></s:property>")
    })

</script>
<body>
<div id="bigdiv">
    <s:property value="student.sid"></s:property>
    <form action="insertallstudent" method="post">
    <table border="1px" ;
           style="width: 750px; height: 400px; left: 150px; text-align: center; position: relative;top: -300px;">
        <caption style="text-align: center"><input type="text" name="sid" id="sid" readonly="true" style="display:none">添加学生</caption>

        <%--  <tr style="text-align: center; position: relative; left: 300px">
              <td >添加教师</td>
          </tr><br>--%>

        <tr>
            <td>学号:</td>
            <td ><input type="text" id="snumber1" name="snumber"><font color="red">*</font></td>
            <td >
            <input type="text" id="sphoto" name="sphoto"><%--存放路径--%>
            </td>
        </tr><br>
        <tr>
            <td>姓名：</td>
            <td><input type="text" name="sname" id="sname1"> <font color="red">*</font></td>
            <td><font>(支持jpg、gif、png格式)</font></td>

        </tr>
        </tr><br>
        <tr>
            <td>性别：</td>
            <td >
                <select name="ssex" id="ssex">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select><font color="red">*</font></td>
           <%-- <td bgcolor="blue" rowspan="5" style="position: absolute; align-content: flex-start; " >照片：</td>--%>
           <%-- <td bgcolor="#ffc0cb" colspan="5" style="align-content: center">--%>
            <td rowspan="4" <%--bgcolor="blue"--%> style="text-align: left;  "  >照片：</td>


            </td>

        </tr><br>


        <tr>
            <td >入学年份：</td>
            <td>
                <select id="senter1" name="senter">
                    <option value="">请选择</option>
                    <option value="2017-12-01">2017-12-01</option>
                </select>
            </td>

        </tr><br>
        <tr>
            <td>所属班级：</td>
            <td >
                <select id="cid1" name="cid.cid">
                </select><font color="red">*</font></td>
        </tr><br>

        <tr>
            <td>生日：</td>
            <td><input type="text" name="sbirthday" id="sbirthday1"> </td>
        </tr><br>
        <tr>
            <td>身份证号：</td>
            <td><input type="text" name="sidnumber" id="sidnumber1"></td>

            <td >政治面貌：</td>
            <td ><input type="text" name="spolitics" id="spolitics1"></td></td>

        </tr><br>
        <tr>
            <td>省份：</td>
            <td> <select name="sprovince" id="sprovince1">
                <option value="">请选择</option>
                <option value="河南省">河南省</option>
                <option value="北京市">北京市</option>
                <option value="河北市">河北市</option>
                <option value="杭州市">杭州市</option>
            </select><font color="red">*</font>

            <td>城市：</td>
            <td> <select name="scity" id="scity1">
                <option value="">请选择</option>
                <option value="周口市">周口市</option>
                <option value="海淀区">海淀区</option>
                <option value="廊坊市">廊坊市</option>
                <option value="萧山区">萧山区</option>
            </select><font color="red">*</font></td>


        </tr><br>
        <tr>
            <td>专业简称：</td>
            <td> <select name="smahor" id="smahor1">
                <option value="请选择">请选择</option>
                <option value="JAVA">JAVA</option>
                <option value="MySql">MySql</option>
            </select><font color="red">*</font></td>

            <td>就读方向：</td>
            <td> <select name="sattend" id="sattend1">
                <option value="请选择">请选择</option>
                <option value="高软">高软</option>
                <option value="3G4G">3G4G</option>
            </select><font color="red">*</font></td>



        </tr><br>
        <tr>
            <td>联系电话：</td>
            <td><input type="text" name="stel" id="stel1"></td>
            <td>家庭住址：</td>
            <td><input type="text" name="saddress" id="saddress1"></td>
        </tr><br>
        <tr>
            <td>家长联系电话：</td>
            <td><input type="text" name="sptel" id="sptel1"></td>
            <td>监护人与学生关系：</td>
            <td><input type="text" name="srelation" id="srelation1"></td>
        </tr><br>
        <tr>
            <td>宿舍：</td>
            <td> <select name="sdormitory" id="sdormitory1">
                <option value="">请选择</option>
                <option value="7号楼">7号楼</option>
                <option value="8号楼">8号楼</option>
            </select></td>

            <td>宿舍号：</td>
            <td><input type="text" name="sdnumber" id="sdnumber1"></td>

        </tr><br>

        <tr>
            <td>基本情况：</td>
            <td ><textarea rows="5" cols="20" name="sbasicinfo" id="sbasicinfo1"></textarea></td>
        </tr><br>
        <tr>
    <td>教育背景：</td>
            <td ><textarea rows="5" cols="25" style="width: 200px;" name="seducation" id="seducation1"></textarea></td>
        </tr><br>

<td>
    <input type="submit" value="确定" >
    <a href="studentmanage.jsp"><b>取消</b></a>
</td>
    </table>
    </form>
    <input type="file" id="upload" name="upload"><br>
    <input type="button" value="提交" id="tijiao"><br>
    <img src="" alt="" id="imgid">
</div>


</body>
</html>

