<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加教师</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/thems.css"/>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>

    <script language="JavaScript" src="js/jquery.min.js"></script>

    <%@page contentType="text/html;charset=UTF-8" language="java" %>

    <script>

        //账号自动添加
        $(document).ready(function () {
            $("#tnumber").click(function () {
                //发送ajax
                $.ajax({
                    url: "addTeachers",
                    type: "get",
                    success: function (msg) {
                        var obj=$.parseJSON(msg);
                        var Stringnumber=obj.result.tnumber;
                        var tid=obj.result.tid;
                        var table ="<tr style='background-color: darkgrey'> <td class='tablemargin'>账号</td> <td class='tablemargin'>姓名</td> <td class='tablemargin'>性别</td> <td class='tablemargin'>生日</td> <td class='tablemargin'>学历</td> <td class='tablemargin'>联系电话</td> <td class='tablemargin'>岗位</td>  <td class='tablemargin'>备注</td><td><textarea cols='40' rows='3' id='tremark' >" + result.teachers.tremark + "</textarea></td> </tr> <tr> <td colspan='2' style='text-align: center'><input type='button' value='确认' onclick='save(" + result.teachers.tid + ")' >&nbsp;&nbsp;&nbsp;&nbsp; <input type='button' value='取消' onclick='xiaoshi(),deletebytid(" + tid + "),refresh();'></td></tr>";

                        $("#quester").html(table);

                    }
                })
            })
         //教师信息添加保存
            function queren(tnumber) {
                alert(tnumber);
                var tname = $("#tname").val();
                var tsex = $("#tsex").val();
                var tbirthday = $("#tbirthday").val();
                var tphone = $("#tphone").val();
                var ttel = $("#ttel").val();
                var tjob = $("#tjob").val();
                var tremark = $("#tremark").val();
                $.ajax({
                    url: "saveString?tnumber=" + tnumber + "&tname=" + tname + "&tsex=" + tsex + "&tbirthday=" + tbirthday + "&tphone=" + tphone + "&ttel=" + ttel + "&tjob=" + tjob + "&tremark=" + tremark,
                    type: "get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                        alert(obj.result);
                        if (obj.result == "true") {
                            alert("添加成功");
                            xiaoshi();
                        }
                        else {
                            alert("添加失败");
                        }
                    }
                });

            }
            //信息修改
            function save(tid) {
                alert(tid);
                var tname = $("#tname").val();
                var tsex = $("#tsex").val();
                var tbirthday = $("#tbirthday").val();
                var tphone = $("#tphone").val();
                var ttel = $("#ttel").val();
                var tjob = $("#tjob").val();
                var tremark = $("#tremark").val();
                alert(tname+":"+tsex+":"+tbirthday+":"+tphone+";"+ttel+";"+tjob);
                $.ajax({
                    url: "xiuteacherinfo?tid=" + tid + "&tname=" + tname + "&tbirthday=" + tbirthday + "&tsex=" + tsex + "&tphone=" + tphone + "&ttel=" + ttel + "&tjob=" + tjob + "&tremark=" + tremark,
                    type: "get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);
                        alert(obj.result);
                        if (obj.result == "true") {
                            alert("修改成功");
                        }
                        else {
                            alert("修改失败");
                        }
                    }
                });

            }

        })

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
    <!--框架高度设置-->
</head>

<body>
<!--添加教师-->
<div class="login">
    <div class="bg_img"><img src="/images/login_bg.jpg"/></div>
    <div class="logo">
        <a href=""><img src="/images/logo.png" alt=""/></a>
    </div>
    <div class="login_m" id="quester">
        <form action="show" method="get">
            <caption style="text-align: center"><input type="text" name="tid" id="tid" readonly="true" style="display:none">添加教师</caption>
            <ul>
                <li class="wz">账号</li>
                <li><input name="tnumber" type="text" id="tnumber" readonly="true"></li>
                <li class="wz">姓名</li>
                <li><input name="tname" type="text" id="tname"></li>
                <div class="lang">
                    <li class="wz">性别</li>
                    <select name="tsex"id="tsex"class="xla_k" >
                        <option value="0">男</option>
                        <option value="1">女</option>
                    </select>
                </div>
                <li class="wz">生日</li>
                <li><input name="tbirthday" type="text" id="tbirthday"></li>
                <li class="wz">学历</li>
                <li><input name="tphone" type="text" id="tphone"></li>
                <li class="wz">联系电话</li>
                <li><input name="ttel" type="text" id="ttel"></li>
                <div class="lang">
                    <li class="wz">岗位</li>
                    <select name="tjob" id="tjob" class="xla_k">
                        <option value="0">讲师</option>
                        <option value="1">班主任</option>
                    </select>
                </div>
                    <li class="wz">备注</li>
                    <textarea name="tremark" rows="4" cols="40" id="tremark"></textarea>
            </ul>
            </li>
            <a href="teacher.jsp"><input  type="submit" name="login" value="确定" id="showinfo" onclick="save(),queren()"></a>
            <li class="2_btn">
                <input type="button" name="reset" value="取消" onclick="xiaoshi(),refresh();">
            </li>
            </ul>
        </form>
    </div>
</div>
</body>
</html>
