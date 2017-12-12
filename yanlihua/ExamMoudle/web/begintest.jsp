<%--
  Created by IntelliJ IDEA.
  User: 晏利花
  Date: 2017/11/20
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="JavaScript" src="js/jquery-3.2.1.js"></script>
<html>
<head>
    <title>begintest</title>
    <style>
        #bottomdiv {
            width: 100%;
            height: 700px;
            background-color: gainsboro;
        }

        #buttondiv {
            width: 400px;
            height: 50px;
            left: 350px;
            top: 15px;
            position: relative;
        }

        #buttondiv input {
            width: 150px;
            height: 35px;
            font-size: 20px;
        }

        #timetable {
            width: 800px;
            /* height: 200px;*/
            position: relative;
            left: 350px;
        }
    </style>

    <script>
        $(document).ready(function () {
            //查询所有班级放入下拉框中
            //循环相加的id(根据此地进行操作)


            $("#add").click(function () {

                $.ajax({
                    url: "selectallclassnameway",
                    type: "get",
                    success: function (msg) {
                        var obj = eval(msg);
                        var j = 1;

                        var str = "";
                        for (var i = 0; i < obj.length; i++) {
                            str = str + "<option value='" + obj[i].cid + "' onclick='selectid(" + obj[i].cid + ")' >" + obj[i].cnumber + "</option>";

                        }

                        var strtr = "<tr id='" + j + "'> <td><select class='selectid' name='selectname'> </select></td> <td><input type='text'id='begintime'></td> <td><input type='button' value='删除' onclick='deleteway(" + j + ") '></td> </tr>";
                        $("#timetable").append(strtr);
                        $(".selectid").html(str);
                        //获取系统当前时间
                        var mydate=new Date();
                       var year=mydate.getFullYear();

                       var month=mydate.getMonth()+1;
                       var date=mydate.getDate();
                        //alert(year+'-'+month+'-'+date);
                       var h=mydate.getHours();
                       var m=mydate.getMinutes();
                       var s=mydate.getSeconds();
                       //alert(h+':'+m+':'+s);
                       var now=year+'-'+month+'-'+date+' '+h+':'+m+':'+s;
                        //alert(now);
                        $("#begintime").val(now);
                        j++;
                    }

                });


            });


        });

        //删除指定的行
        function deleteway(id) {
            $("table tr").eq(id).remove();
        }
        /*开始考试按钮*/
        function selectid(selectname) {
            //考试班级
            var classid=selectname;
            alert(classid);
            $("#begintestbnt").click(function () {
                //时间
                var begintime=$("#begintime").val();
                //创建试卷序号
                var tid=$("#tid").val();
                alert(classid+";"+begintime+";"+tid);
                $.ajax({
                    url:"saveinfointogradeway?gbegintime="+begintime+"&tid="+tid+"&cid="+classid,
                    type:"get",
                    success:function (msg) {
                        var obj=$.parseJSON(msg);
                        if(obj.result=="true"){
                            window.location.href="examlist.jsp";
                        }
                    }
                });
            });
        }
    </script>
</head>
<body>
<div id="bottomdiv">
    <%HttpSession httpSession=request.getSession();
        Integer tid=(Integer) httpSession.getAttribute("tid");
        //System.out.println("jsp++++++++++++++++"+tid);
    %>
    <input type="text" id="tid" value="<%=tid%>" style="display: none">
    <div id="buttondiv">
        <input type="button" value="开始考试" id="begintestbnt">
       <a href="examlist.jsp"><input type="button" value="取消"></a>
    </div>
    <h1 style="text-align: center">请选择参加考试的班级及开考时间</h1>
    <table border="1" id="timetable">
        <tr>
            <td>班级</td>
            <td>开考时间</td>
            <td><input type="button" value="添加" id="add"></td>
        </tr>
        <%-- <tr>
             <td><select id="class1">
                 &lt;%&ndash;<option>G3T53</option>&ndash;%&gt;
             </select></td>
             <td><input type="text" value="2014-08-01 09:30"></td>
             <td></td>
         </tr>
         <tr>
             <td><select id="class2">
                 &lt;%&ndash;<option>G3T54</option>&ndash;%&gt;
             </select></td>
             <td><input type="text" value="2014-08-01 09:30"></td>
             <td><input type="button" value="删除"></td>
         </tr>--%>
    </table>
</div>

</body>
</html>
