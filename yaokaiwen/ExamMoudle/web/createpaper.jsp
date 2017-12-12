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
    <title>createpaper</title>
    <style>
        #bottomdiv{
            position: absolute;
            width: 100%;
            height: 1080px;
            background-color: gainsboro;
            top: 0px;
            left: 0px;
        }
        #createpaper{
            width: 800px;
            height: 200px;
            position: relative;
            left: 300px;
        }
        #paperinfo{
            width: 800px;
            height: 50px;
            position: relative;
            top: 10px;
            left: 300px;
        }
        #buttondiv{
            width:350px;
            height: 50px;
            position: relative;
            top:330px;
            left: 500px;
        }
        #buttondiv input{
            width: 150px;
            height: 35px;
        }
    </style>
</head>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script language="JavaScript">
    $(function () {
        $("#suid").change(function () {
            $.ajax({
                url:"selectquestionid?id="+$("#suid").val(),
                type:"get",
                success:function (msg) {
                    var pro = eval(msg);
                    var strtitle = "<tr style='background-color: darkgrey'> <td width='20px'> </td> <td>序号</td> <td>类型</td> <td>程度</td> <td>对应章节</td> <td>题目</td> </tr>";
                    for (var i = 0; i < pro.length; i++) {
                        if(pro[i].qtype==0){
                            strtitle= strtitle+"<tr><td width='20px'> <input type='checkbox' onchange='xuanzhong()' name='array' value='" + pro[i].qid + "'></td> <td>" + pro[i].qid + "</td> <td>单选</td> <td>" + pro[i].qdifficulty + "</td> <td>" + pro[i].qchapter + "</td> <td>" + pro[i].qcontent + "</td> </tr>";
                        }else {
                            strtitle= strtitle+"<tr><td width='20px'> <input type='checkbox' onchange='xuanzhong()' name='array' value='" + pro[i].qid + "'></td> <td>" + pro[i].qid + "</td> <td>多选</td> <td>" + pro[i].qdifficulty + "</td> <td>" + pro[i].qchapter + "</td> <td>" + pro[i].qcontent + "</td> </tr>";
                        }
                        }
                    $("#paperinfo").html(strtitle);
                }
            })
        })

        $("#sustage").change(function () {
            var sus = $("#sustage").val();
            var str1 = "<option value=''>请选择</option>"
            if(sus=="G1"){
                str1 = str1+"<option value='1'>java</option><option value='2'>sqlserver</option>"
            }else if(sus=="G2"){
                str1 = str1+"<option value='4'>jsp</option><option value='3'>struts2</option>"
            }else if(sus=="G3"){
                str1 =str1+ "<option value='5'>oracle</option><option value='6'>spring</option>"
            }
            $("#suid").html(str1);
        })
        /*$("input[name='array']").on("click",function () {
            alert("82");
            var checks = document.getElementsByName("array");
            alert(checks);
            n = 0;
            for(i = 0;i<checks.length;i++){
                if(checks[i].checked==true){
                    n++;
                }
            }
            $("#tsum").val(n);
        })*/
    })

    function xuanzhong() {
        var n = 0;
        var checks = document.getElementsByName("array");
        for(i = 0;i<checks.length;i++){
            if(checks[i].checked==true){
                n++;
            }
        }
        $("#tsum").val(n);
        var zf= 0;
        zf = $("#zongfen").val();
        $("#teachscore").val(zf/n);
    }

</script>
<body>
<form action="choiceinsertpaper" method="post">
<div id="bottomdiv">
    <table id="createpaper" border="1">
        <tr>
            <td>方向:</td><td><select id="sudirection1">
            <option value="高软">高软</option>
        </select></td>
            <td>阶段:<select id="sustage">
                <option value="">请选择</option>
                <option value="G1">G1</option>
                <option value="G2">G2</option>
                <option value="G3">G3</option>
            </select></td>
            <td>科目:<select id="suid" name="suid.suid">
                <option value=''>请选择</option>
            </select></td>
        </tr>
        <tr>
            <td>标题:</td>
            <td colspan="3"><input type="text" name="ttitle"></td>
        </tr>
        <tr>
            <td>总分:</td>
            <td ><input type="text"id="zongfen">分</td>
            <td>考试时长:</td>
            <td ><input type="text" name="ttime">分钟</td>
        </tr>
        <tr>
            <td>已选题数:</td>
            <td ><input type="text" id="tsum" name="tsum" value="0" readonly="true"></td>
            <td>每题分数:</td>
            <td ><input type="text" id="teachscore" name="teachscore" value="0" readonly="true"></td>
        </tr>
    </table>
    <table id="paperinfo" border="1">
        <tr>
             <td width='20px'> </td>
             <td>序号</td>
             <td>类型</td>
             <td>程度</td>
             <td>对应章节</td>
             <td>题目</td>
         </tr>
    </table>
    <div id="buttondiv">
        <input type="submit" value="创建试卷" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="取   消" >
    </div>
</div>
</form>
</body>
</html>
