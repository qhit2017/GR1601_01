<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/21 0021
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生页面</title>
    <script language="JavaScript" src="js/jquery.min.js"></script>
    <script src="js/ajaxfileupload.js"></script>
    <meta charset="UTF-8"><style type="text/css">
    #zong{
        width:100%;
        height:100%;
    }
    #up{
        width:100%;
        height:15%;
        position:relative;
        border-bottom: 2px solid #F0F8FF;

        /*background: crimson;*/
    }
    #up_1{
        width: 300px;
        height: 40px;
        position: absolute;
        /*background: red;*/
        margin-left: 300px;
        font-size: 20px;
        color: red;
        margin-top: 30px;
    }
    #up_2{
        width:250px;
        height: 40px;
        position: absolute;
        margin-left: 850px;
        /*background: red;*/
        margin-top: 30px;
    }
    #up_3{
        width:70px;
        height: 40px;
        position: absolute;
        margin-left: 1100px;
        /*   background: blue;*/
        margin-top: 30px;
        color:blue;
    }
    #up_4{
        width:100px;
        height: 40px;
        position: absolute;
        margin-left: 1170px;
        /*background: black;*/
        margin-top: 30px;
        color: blue;
    }

    #left{
        width: 19.7%;
        height: 85%;
        position: absolute;
        /* border-bottom: 2px solid red;*/
        /*background: black;*/
        border: 2px solid red;
    }
    #right{
        width: 80%;
        height: 85%;
        margin-left:20%;
        position: relative;
        border:2px solid blue ;
        /*background: blue;*/
    }
    #right_1{
        width: 200px;
        height: 30px;
        position: absolute;
        /*background: red;*/
        font-size: 20px;
        margin-top: 20px;
        /* background: red;*/
        margin-left:400px;
    }
    #right_2{
        width: 700px;
        height: 470px;
        position: absolute;
        /*font-size: 20px;*/
        margin-top: 70px;
        /*background: red;*/
        margin-left:150px;
    }

</style>
    <script>
        $(document).ready(function () {
                $("#tijiao").click(function () {
                    //发送ajax请求，把所选择的图片上传到服务器内存中
                    $.ajaxFileUpload({
                        //控制器方法名
                        url: "uploadimg",
                        //所选上传文件的id
                        fileElementId: "upload",
                        //传输的安全性
                        secureuri: false,
                        //所有上传都要用post请求形式
                        type: "post",
                        //数据以json形式传输
                        dataType: "json",
                        success: function (msg) {
                            var obj = $.parseJSON(msg);
                            $("#imgresult").val(obj.path);
                            $("#img1").attr("src", obj.path);
                        }


                    });
                });

            $("#tianjia").click(function () {

                var snumber = $("#snumber").val();
                var sname = $("#sname").val();
                var ssex = $("#ssex").val();
                var senter = $("#senter").val();
                var cid = $("#banji").val();
                alert(snumber+";"+sname+";"+ssex+";"+senter+";"+cid);

                var sbirthday = $("#sbirthday").val();
                var sidnumber = $("#sidnumber").val();
                var spolitics = $("#spolitics").val();
                var sprovince = $("#sprovince").val();
                var scity = $("#chengshi").val();

                alert(sbirthday+";"+sidnumber+";"+spolitics+";"+sprovince+";"+scity);

                var sattend = $("#sattend").val();
                var smahor = $("#smahor").val();
                var stel = $("#tel").val();
                var saddress = $("#saddress").val();
                var sptel = $("#jiatel").val();

                alert(sattend+";"+smahor+";"+stel+";"+saddress+";"+sptel);

                var srelation = $("#srelation").val();
                var sdormitory = $("#sdormitory").val();
                var sdnumber = $("#sdnumber").val();
                var seducation = $("#seducation").val();
                var sbasicinfo = $("#sbasicinfo").val();
                var sphoto = $("#imgresult").val();//图片路径

                alert(srelation+";"+sdormitory+";"+sdnumber+";"+seducation+";"+sbasicinfo+"；"+sphoto);
                $.ajax({
                    url: "tianjiasaveorupdate?snumber=" + snumber + "&sname=" + sname + "&ssex=" + ssex + "&senter=" + senter + "&cid=" + cid
                    + "&sbirthday=" + sbirthday + "&sidnumber=" + sidnumber + "&spolitics=" + spolitics + "&sprovince=" + sprovince + "&scity=" + scity
                    + "&smahor=" + smahor + "&sattend=" + sattend + "&stel=" + stel + "&saddress=" + saddress + "&sptel=" + sptel
                    + "&srelation=" + srelation + "&sdormitory=" + sdormitory + "&sdnumber=" + sdnumber + "&sbasicinfo=" + sbasicinfo +"&seducation="+ seducation +"&sphoto=" + sphoto,
                    type: "get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                        if (obj.result == "true") {
                            alert("学生信息添加成功！！！");
                        }
                        else {
                            alert("学生添加失败！！！")
                        }
                    }
                });
            });

        })
    </script>
    <script>
        $(document).ready(function () {
        $.ajax({
            url: "chaxunsuoyou",
            type: "get",
            success: function (msg) {
                var obj = eval(msg);
                var str = "";
                for (var i = 0; i < obj.length; i++) {
                    str = str + "<option value='" + obj[i].classes.cid + "'>" + obj[i].classes.cid + "</option>";
                }
                var strtitle = "<option value=''>请选择</option>";
                str = strtitle + str;
                $("#banji").html(str);
            }
        });
        })
    </script>

</head>
<body>
<div id="zong">
    <div id="up">
        <div id="up_1">在线考试管理系统</div>
        <div id="up_2">2014年7月31日星期四8：36</div>
        <div id="up_3"><a href="">[注销]</a></div>
        <div id="up_4"><a href="">[退出系统]</a></div>
    </div>
    <div id="left">
        <table style="margin: auto;height:60%">
            <tr><td>后台功能</td></tr>
            <tr><td><a href="">教师管理</a></td></tr>
            <tr><td><a href="">班级管理</a></td></tr>
            <tr><td><a href="">学生管理</a></td></tr>
            <tr><td><a href="">题库管理</a></td></tr>
            <tr><td><a href="">试卷管理</a></td></tr>
            <tr><td><a href="">成绩管理</a></td></tr>
            <tr><td><a href="">修改密码</a></td></tr>


        </table>
    </div>
    <div id="right">
        <div id="right_1">添加学生</div>
        <div id="right_2">
            <table border="0" width="100%" height="450px">
                <tr><td width="20%">学号:</td><td width="30%"><input type="text" id="snumber"></td><td width="20%" colspan="2"><a style="color: red">(支持jpg,gif,png格式)</a></td><%--<td &lt;%&ndash;width="30%" rowspan="6"&ndash;%&gt;></td>--%></tr>
                <tr><td>姓名:</td><td><input type="text" id="sname"></td><td>
                    <input type="file" id="upload" name="upload">
                    <input type="button" value="提交" id="tijiao">
                    <input type="text" id="imgresult" style="display: none">
                </td></tr>
                <tr><td>性别:</td><td><select id="ssex"><option value="">请选择</option>
                                             <option value="男">男</option>
                                             <option value="女">女</option>
                </select>
                </td><td>照片:</td><td></td></tr>
                <tr><td>入学年份:</td><td><select id="senter"><option value="">请选择</option>
                    <option value="2015-9-1">2015-09-01</option>
                    <option value="2016-9-1">2016-09-01</option>
                    <option value="2017-9-1">2017-09-01</option>
                </select></td><td></td></tr>
                <tr><td>所属班级:</td><td><select id="banji">
                    <option value="">请选择</option></select></td><td></td></tr>
                <tr><td>生日:</td><td><input type="text" id="sbirthday"></td><td></td></tr>
                <tr><td>身份证号:</td><td><input type="text" id="sidnumber"></td><td>政治面貌:</td><td><input type="text" id="spolitics"></td></tr>
                <tr><td>省份:</td><td><select id="sprovince"><option value="">请选择</option>
                    <option value="河南省">河南省</option>
                    <option value="陕西省">陕西省</option>
                    <option value="青海省">青海省</option>
                    <option value="山西省">山西省</option>
                    <option value="四川省">四川省</option>
                </select></td><td>城市:</td><td><select id="chengshi">
                    <option value="">请选择</option>
                    <option value="北京市">郑州市</option>
                    <option value="上海市">上海市</option>
                    <option value="天津市">天津市</option>
                    </select></td></tr>
                <tr><td>专业简称:</td><td><select id="smahor"><option value="">请选择</option>
                                         <option value="">软件开发</option>
                                         <option value="">软件实施</option>
                </select></td><td>就读方向:</td><td><select id="sattend"><option value="">请选择</option>
                                                  <option value="高软">高软</option>
                                                  <option value="3G4G">3G4G</option>
                </select></td></tr>
                <tr><td>联系电话:</td><td><input type="text" id="tel"></td><td>家庭住址:</td><td><input type="text" id="saddress"></td></tr>
                <tr><td>家长联系电话:</td><td><input type="text" id="jiatel"></td><td>监护人与学生关系:</td><td><input type="text" id="srelation"></td></tr>
                <tr><td>宿舍:</td><td><select id="sdormitory"><option value="">请选择</option>
                    <option value="7">7</option>
                    <option value="8"></option>
                </select></td><td>宿舍号:</td><td><input type="text" id="sdnumber"></td></tr>
                <tr><td>基本情况:</td><td colspan="3"><input type="text" width="300px" id="sbasicinfo"></td></tr>
                <tr><td>教育背景:</td><td colspan="2"><input type="text" width="300px" id="seducation"></td><td><input type="button" value="添加" id="tianjia"></td></tr>

            </table>
        </div>

    </div>
</div>
<div style="width: 200px;height: 150px;position: relative;/*background-color: red;*/left: 800px;bottom: 420px;"><img id="img1" src="" style="width: 200px;height: 150px;" ></div>
</body>
</html>
