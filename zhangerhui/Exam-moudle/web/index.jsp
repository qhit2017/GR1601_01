<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/20/020
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
<html>
<head>
  <title>登录 - MetInfo 用户中心</title>
  <meta charset="utf-8"/>
  <%@page contentType="text/html;charset=UTF-8" language="java" %>
  <meta name="generator" data-variable="https://account.metinfo.cn/|../|https://app.metinfo.cn/"/>

  <link rel='stylesheet' type='text/css'
        href="https://account.metinfo.cn/templates/account/cache/account.css?20170919190632">
</head>



<body class="page-login-v3 layout-full">

<div class="page-content vertical-align-middle" style="margin-top: 100px; margin-left: 530px;">

  <div class="panel">

    <div class="panel-body">

      <div class="brand" align="center">

        <img class="brand-img" src="https://account.metinfo.cn/templates/account/min/img/logo.png" width="50">
        <h2 class="brand-text font-size-20 margin-top-20">爱考登录界面</h2>

      </div>

      <form method="post" class="met-form-validation" action="login">
        <div class="form-group form-material floating">

          <input type="text" class="form-control" name="username" data-fv-notempty="true"
                 data-fv-message="请输入用户名或邮箱或手机号码"/>
          <label class="floating-label">用户名/邮箱/手机</label>

        </div>

        <div class="form-group form-material floating">

          <input type="password" class="form-control" name="password" data-fv-notempty="true"
                 data-fv-message="请输入密码"/>
          <label class="floating-label">密码</label>
        </div>

        <br>

        <div align="center">
          <select name="role">
            <option value="0">管理员</option>
            <option value="1">教师</option>
            <option value="2">学生</option>
          </select>
        </div>

        <button type="submit" class="btn-primary btn-block btn-lg margin-top-40">登录</button>

      </form>

    </div>

  </div>

</div>


<script src="https://account.metinfo.cn/templates/account/cache/account.js?20171018115020"></script>

</body>
</html>
