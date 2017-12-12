<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="../css/insertteacher.css"/>
    <link rel="stylesheet" type="text/css" href="../css/insertstudent.css"/>

    <title>增加学生</title>
    <script language="JavaScript" src="../js/ajaxfileupload.js" ></script>
    <script language="JavaScript" src="../js/jquery.min.js"></script>
    <script language="JavaScript">

        $(document).ready(function () {
            /*上传*/
            //获取按钮的点击事件
            $("#button").click(function () {
alert("上传");
                $.ajaxFileUpload({
                    url: "uploading",
                    fileElementId: "upload",//需要上传文件的ID名
                    secureuri: false,//是否启用安全提交
                    type: "post",//所有的上传都要用POST
                    dataType: "json",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                        alert(obj);
                        $("#img").attr("src", obj.path);
                    }

                });
            })

        });

    </script>


</head>


<body>
<!--添加学生-->
<div id="student_main">
    <div id="ton">添加学生</div>
    <div id="student_l">

        学号：<input type="text"><br>
        姓名：<input type="text"><br>

        <span>姓名：</span>
        <select name="select" id="select_k1" class="xla_k">
            <option value="0">男</option>
            <option value="1">女</option>
        </select><br>
        <span>入学年份：</span>
        <select name="select" id="select_k2" class="xla_k">
            <option value="0">2000</option>
            <option value="1">2016</option>
        </select><br>

        <span>所属班级：</span>
        <select name="select" id="select_k3" class="xla_k">
            <option value="0">G1</option>
            <option value="1">G2</option>
        </select><br>

        生日:<input type="text"><br>
        身份证号码：<input type="text"><br>

        <span>省份：</span>
        <select name="select" id="select_k5" class="xla_k">
            <option value="0">河南</option>
            <option value="1">湖南</option>
        </select><br>

        <span>专业简称：</span>
        <select name="select" id="select_k6" class="xla_k">
            <option value="0">G1</option>
            <option value="1">G2</option>
        </select><br>
        联系电话：<input type="text"><br>
        家长联系电话：<input type="text"><br>

        <span>宿舍</span>
        <select name="select" id="select_k7" class="xla_k">
            <option value="0">男寝</option>
            <option value="1">女寝</option>
        </select>
    </div>

    <div id="student_r" style="left:50%">
        <input type="file" value="选择文件" id="upload" name="upload"><br>
        <input type="button" id="button" value="上传">
        <div id="img">

        </div>


        政治面貌：<input type="text"><br>


        <span>城市：</span>
        <select name="select" id="select_k4" class="xla_k">
            <option value="0">开封</option>
            <option value="1">郑州</option>
        </select>

        <span>就业方向：</span>
        <select name="select" id="select_k8" class="xla_k">
            <option value="0">上海</option>
            <option value="1">杭州</option>
            <option value="1">北京</option>
        </select><br>
        家庭住址：<input type="text"><br>
        监护人与学生关系：<input type="text"><br>
        宿舍号：<input type="text"><br>

    </div>


    <div id="student_die">
        基本情况：
        <textarea name="teacher_ins" cols="30" rows="3"></textarea>"<br>
        &nbsp&nbsp&nbsp教背景:&nbsp&nbsp&nbsp
        <textarea name="teacher_ins" cols="30" rows="3"></textarea>"<br>
    </div>

</div>
</body>
</html>
