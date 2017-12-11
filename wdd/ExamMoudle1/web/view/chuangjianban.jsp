<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>创建班级</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/thems.css"/>

    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>

    <%@page contentType="text/html;charset=UTF-8" language="java" %>

    <script language="JavaScript" src="js/jquery.min.js"></script>
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
    <script>
        //取消刷新
      function xiao() {
          window.location.href="banji.jsp";
      }
      //查询讲师信息下拉框
      $(document).ready(function () {
          $.ajax({
              url:"selectTeachersTjob0",
              type:"get",
              success:function (msg) {
                  var obj=eval(msg);
                  var str="";
                  for(var i=0;i<obj.length;i++) {
                      str=str+"<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>";
                  }
                  var title="<option value=''>请选择</option>";
                  str1=title+str;
                  $(tidh).html(str1);

              }
          })
          //班主任信息下拉框
          $.ajax({
              url:"selectTeachersTjob1",
              type:"get",
              success:function (msg) {
                  var obj=eval(msg);
                  var str="";
                  for(var i=0;i<obj.length;i++) {
                      str=str+"<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>";
                  }
                  var title="<option value=''>请选择</option>";
                  str1=title+str;
                  $(tidl).html(str1);

              }

          })
      })

    </script>
    <!--框架高度设置-->
</head>

<body>
<!--班级-->
<div class="login">
    <div class="bg_img"><img src="/images/login_bg.jpg"/></div>
    <div class="logo">
        <a href=""><img src="/images/logo.png" alt=""/></a>
    </div>
    <div class="login_m">
        <form action="insertclassesinfo" method="get">
            <ul>
                <li class="wz">班级代码</li>
                <li><input name="" type="text" id="cnumber"></li>
                <li class="wz">班级名称</li>
                <li><input name="" type="text" id="cname"></li>
                <li class="wz">所属方向</li>
                <div class="lang">
                    <select name="select" id="cdirection" class="xla_k">
                        <option value="0">高软</option>
                        <option value="1">3G4G</option>
                    </select>
                </div>
                <div class="lang">
                    <li class="wz">班主任</li>
                    <select name="select" id="tidl" class="xla_k">
                        <option value="0">李</option>
                        <option value="1">高</option>
                    </select>
                </div>
                <div class="lang">
                    <li class="wz">讲师</li>
                    <select name="select" id="tidh" class="xla_k">
                        <option value="0">高软</option>
                        <option value="1">3G4G</option>
                    </select>
                </div>
                <li class="wz">开班日期</li>
                <li><input name="" type="text"></li>
                <li class="wz">G1开班人数</li>
                <li><input name="" type="text"></li>
                <li class="wz">G2开班人数</li>
                <li><input name="" type="text"></li>
                <li class="wz">G3开班人数</li>
                <li><input name="" type="text"></li>
                <div class="lang">
                    <li class="wz">状态</li>
                    <select name="select"id="teachersh"class="xla_k">
                        <option value="0">开启</option>
                        <option value="1">关闭</option>
                    </select>
                </div>
                <li class="wz">备注</li>
                <textarea name="" rows="4" cols="20"></textarea>

            </ul>
            </li>

            <input  type="submit" name="login" value="添加" >

            <input  type="button" name="reset" value="取消" onclick="xiao()">

            </ul>
        </form>
    </div>
</div>
</body>
</html>
