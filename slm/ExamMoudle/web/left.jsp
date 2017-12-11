<%--
Created by IntelliJ IDEA.
User: Administrator
Date: 2017/11/20
Time: 10:41
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib uri="core" prefix="c" %>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <title>左边导航</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <!--框架高度设置-->
    <script type="text/javascript">
        var $a = jQuery.noConflict();
        $a(function () {

            $a('.sidenav li').click(function () {
                $a(this).siblings('li').removeClass('now');
                $a(this).addClass('now');
            });

            $a('.erji li').click(function () {
                $a(this).siblings('li').removeClass('now_li');
                $a(this).addClass('now_li');
            });

            var main_h = $a(window).height();
            $a('.sidenav').css('height', main_h + 'px');
        })
    </script>
    <!--框架高度设置-->
</head>

<body>
<div id="left_ctn">
    <ul class="sidenav">
        <li class="now">
            <div class="nav_m">
                <c:if test="${sessionScope.students1.srole ne 2}">
                    <span><a>教师管理</a></span>
                </c:if>
                <c:if test="${sessionScope.students1.srole eq 2}">
                    <span><a>个人信息</a></span>
                </c:if>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li class="now_li">
                    <c:if test="${sessionScope.students1.srole ne 2}">
                        <span><a href="hy_list.jsp" target="main">教师管理</a></span>
                    </c:if>
                    <c:if test="${sessionScope.students1.srole eq 2}">
                        <span><a href="hy_list.jsp" target="main">个人信息</a></span>
                    </c:if>
                </li>
            </ul>
        </li>
        <li>
            <div class="nav_m">
                <c:if test="${sessionScope.students1.srole ne 2}">
                    <span><a>班级管理</a></span>
                </c:if>
                <c:if test="${sessionScope.students1.srole eq 2}">
                    <span><a>在线考试</a></span>
                </c:if>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">

                <li>
                    <c:if test="${sessionScope.students1.srole ne 2}">
                        <span><a href="Classmanagement.jsp" target="main">班级管理</a></span>
                    </c:if>
                    <c:if test="${sessionScope.students1.srole eq 2}">
                        <span><a href="Zaixian.jsp" target="main">在线考试</a></span>
                    </c:if>
                </li>
            </ul>
        </li>
        <li>
            <div class="nav_m">
                <c:if test="${sessionScope.students1.srole ne 2}">
                    <span><a>学生管理</a></span>
                </c:if>
                <c:if test="${sessionScope.students1.srole eq 2}">
                    <span><a>笔试成绩</a></span>
                </c:if>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <c:if test="${sessionScope.students1.srole ne 2}">
                        <span><a href="Studentmanagement.jsp" target="main">学生管理</a></span>
                    </c:if>
                    <c:if test="${sessionScope.students1.srole eq 2}">
                        <span><a href="Studentmanagement.jsp" target="main">笔试成绩</a></span>
                    </c:if>
                </li>

            </ul>
        </li>
        <li>
            <div class="nav_m">
                <c:if test="${sessionScope.students1.srole ne 2}">
                    <span><a>题库管理</a></span>
                </c:if>
                <c:if test="${sessionScope.students1.srole eq 2}">
                    <span><a>机试成绩</a></span>
                </c:if>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <c:if test="${sessionScope.students1.srole ne 2}">
                        <span><a href="Itembankmanagement.jsp" target="main">题库管理</a></span>
                    </c:if>
                    <c:if test="${sessionScope.students1.srole eq 2}">
                        <span><a href="Itembankmanagement.jsp" target="main">机试成绩</a></span>
                    </c:if>
                </li>

            </ul>
        </li>
        <li>
            <c:if test="${sessionScope.students1.srole ne 2}">
            <div class="nav_m">

                <span><a>试卷管理</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <span><a href="Examinationpapermanagement.jsp" target="main">试卷管理</a></span>
                </li>

            </ul>
        </li>
        <li>

        </c:if>
        <c:if test="${sessionScope.students1.srole ne 2}">
        <div class="nav_m">
            <span><a>成绩管理</a></span>
            <i>&nbsp;</i>
        </div>
        <ul class="erji">
            <li>
                <span><a href="Grademanagement.jsp" target="main">成绩管理</a></span>
            </li>

        </ul>
        </li>
        <li>
            </c:if>
            <div class="nav_m">
                <span><a>修改密码</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <span><a href="Testlist.jsp" target="main">kaoshi</a></span>
                </li>


            </ul>
        </li>

    </ul>
</div>
</body>
</html>
