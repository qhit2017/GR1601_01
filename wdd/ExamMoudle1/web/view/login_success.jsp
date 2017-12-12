<%--
  Created by IntelliJ IDEA.
  User: 王豆豆
  Date: 2017/11/20
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=GB18030"

         pageEncoding="GB18030"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

  <meta http-equiv="Content-Type" content="text/html; charset=GB18030">

  <title>Insert title here</title>

</head>

<body>

Welcome!<br/>

${sessionScope.username}<br/>

${application.count }

<a href="logout"></a>

</body>

</html>
