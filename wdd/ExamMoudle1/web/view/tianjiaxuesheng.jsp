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
 <%--  保存或修改--%>
    <script>
        $(document).ready(function () {
            $("#button1").click(function () {
                var snumber = $("#snumber").val();
                var sname=$("#sname").val();
                var ssex=$("#ssex").val();
                var sidnumber=$("#sidnumber").val();
                var senter=$("#senter").val();
                var sbirthday=$("#sbirthday").val();
                var sprovince=$("#sprovince").val();
                var sdormitory=$("#sdormitory").val();
                var spolitics=$("#spolitics").val();
                var scity=$("#scity").val();
                var sattend=$("#sattend").val();
                var saddress=$("#saddress").val();
                var stel=$("#stel").val();
                var seducation=$("#seducation").val();
                var sphoto=$("#sphoto").val();
                var sbasicinfo=$("#sbasicinfo").val();
                var sdnumber=$("#sdnumber").val();
                var spassword=$("#spassword").val();
                //发送ajax
                $.ajax({
                    url: "saveOrupdateStudents?snumber=" + snumber + "&sname="+ sname + "&ssex=" + ssex +"&sidnumber=" + sidnumber +
                    "&senter="+ senter +"&sbirthday="+ sbirthday +"&sprovince="+ sprovince +"&sdormitory="+ sdormitory +
                    "&spolitics="+ spolitics + "&scity="+ scity + "&sattend="+ sattend +"&saddress="+ saddress +"&stel="+ stel +
                    "&seducation="+ seducation +"&sphoto="+ sphoto +"&sbasicinfo="+ sbasicinfo +"&sdnumber="+ sdnumber +
                    "&spassword="+ spassword ,
                    type: "get",
                    success: function (msg) {
                        var obj = $.parseJSON(msg);

                        alert(obj.result);

                        if (obj.result == "true") {

                            alert("添加成功");

                        }
                        else {
                            alert("添加失败");
                        }

                    }
                })
            })
        })





    </script>


</head>

<body>

<!--框架高度设置-->
<div class="login">
    <div class="bg_img"><img src="/images/login_bg.jpg"/></div>
    <div class="logo">
        <a href=""><img src="/images/logo.png" alt=""/></a>
    </div>
    <div class="login_m" id="str">
        <div class="hy_list">
            <div class="box_t">
                <span class="name">添加学生</span>

            </div>
        <form action="showadd" method="get">
            <ul>
                <span>学号：</span>&nbsp;&nbsp;
                <input name="" type="text" id="snumber">
                <input type="button" value="选择文件">
                <input type="file"/><br/>
                <span>姓名：</span>&nbsp;&nbsp;
                <input name="" type="text" id="sname">
                <input type="submit" value="确定"><br/>

                <span>性别：</span>
                <select name="select" id="ssex" class="xla_k">
                    <option value="0">男</option>
                    <option value="1">女</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span>照片：</span><br/>
                <span>入学年份</span>
                <select name="select" id="sidnumber" class="xla_k">
                    <option value="0">2000</option>
                    <option value="1">1999</option>
                    <option value="2">1998</option>
                </select><br/>
                <span>所属班级</span>
                <select name="select" id="senter" class="xla_k">
                    <option value="0">G1</option>
                    <option value="1">G2</option>
                    <option value="2">G3</option>
                </select>
                <br/>
                <span>生日：</span>
                <input name="" type="text" id="sbirthday"><br/>
                <span>身份证号：</span>
                <input name="" type="text" id="sprovince"><br>
                <span>政治面貌：</span>
                <input name="" type="text" id="sdormitory"><br/>
                <span>省份：</span>
                <select name="select" id="spolitics" class="xla_k">
                    <option value="0">河南省</option>
                    <option value="1">山东省</option>

                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span>城市：</span>
                <select name="select" id="scity" class="xla_k">
                    <option value="0">周口</option>
                    <option value="1">开封</option>
           <option value="2"></option>
</select><br/>
<span>专业简称：</span>
<select name="select" id="sattend" class="xla_k">
    <option value="0">高软</option>
    <option value="1">测试</option>

</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span>就读方向：</span>
<select name="select" id="saddress" class="xla_k">
    <option value="0">java</option>
    <option value="1">数据库</option>

</select><br/>
<span>联系电话：</span>
<input name="" type="text" id="stel"><br>
<span>家庭住址：</span>
<input name="" type="text" id="seducation"><br>
<span>家长联系电话：</span>
<input name="" type="text" id="sphoto"><br>
<span>监护人与学生关系：</span>
<input name="" type="text" id="sbasicinfo"><br>
<span>宿舍：</span>
<select name="select" id="sdnumber" class="xla_k">
    <option value="0">男宿舍</option>
    <option value="1">女宿舍</option>

</select>
<span>宿舍号：</span>
<input name="" type="text" id="spassword"><br>
<span>基本情况：</span>
<textarea name="" rows="4" cols="40"></textarea><br>
<span>教育布景：</span>
<textarea name="" rows="4" cols="40"></textarea>

<%-- <input type="text" id="imgresult" style="display: none"><br>--%>

<input  type="button" value="提交" id="button1" >
            </ul>

            </li>

        </ul>

     </form>

      </div>

         </div>

     </div>

   </body>
 </html>
