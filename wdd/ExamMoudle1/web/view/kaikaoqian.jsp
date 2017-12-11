
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">

<link rel="stylesheet" type="text/css" href="/css/main.css"/>
<link rel="stylesheet" type="text/css" href="/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/css/thems.css">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>教师管理</title>

</head>
<body>
        <div id="content">
            <div id="right_ctn">
                <div class="right_m">
                    <!--会议列表-->
                    <div class="hy_list">
                        <div class="box_t">
                            <span class="name">开考前</span>

                        </div>
                        <div class="search">
                            <a href="" class="btn">开始考试</a>
                            <a href="" class="btn">取消</a>
                        </div><br/>
                        <span>请选择参加考试的班级和开考时间</span>
                        <!--查询-->
                        <div class="space_hx">&nbsp;</div>
                        <!--列表-->
                        <form action="" method="post">
                            <table cellpadding="0" cellspacing="0" class="list_hy">
                                <tr>
                                    <th class="xz" scope="col">班级</th>
                                    <th scope="col">开考时间</th>
                                    <th class="zt" scope="col">  <a href="" class="btn">添加</a></th>
                                </tr>
                                <tr>
                                    <td class="xz"><select name="select" id="select_k13f" class="xla_k">
                                        <option value="0"></option>
                                        <option value="1"></option>
                                        <option value="2"></option>
                                    </select></td>
                                    <td><input name="" type="text" size="30"></td>
                                    <td class="zt"></td>

                                </tr>
                                <tr>
                                    <td class="xz"><select name="select" id="select_k13s" class="xla_k" >
                                        <option value="0"></option>
                                        <option value="1"></option>
                                        <option value="2"></option>
                                    </select></td>
                                    <td><input name="" type="text" size="30"></td>
                                    <%--<td class="zt"> <a href="" class="btn">删除</a></td>--%>
                                    <th class="zt" scope="col">  <a href="" class="btn">删除</a></th>
                                </tr>

                            </table>
                            <!--列表-->
                            <!--右边底部-->
                        </form>
                        <!--右边底部-->
                    </div>
                    <!--会议列表-->
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

