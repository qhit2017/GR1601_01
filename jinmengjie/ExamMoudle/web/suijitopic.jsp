<%--
  Created by IntelliJ IDEA.
  User: 金梦杰
  Date: 2017/11/21/021
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>随机组卷</title>
</head>
<style>
    #bigdiv{
        position: absolute;
        width: 1000px;
        height: 600px;
        background: gainsboro;
        align-content: center;
        left: 300px;
    }
    #tableid{
        width:900px;
        height: 500px ;
        position: relative;
        text-align: center;
        border: 1px ;

    }
    .smalltext{
        width: 45px;
        height: 30px;
    }


</style>
<body>
<div id="bigdiv">
    <table  id="tableid"  >
        <%----%>

        <%--<tr>
            <td colspan="3">随机组卷</td>
        </tr>--%>
        <tr>
            <td>
                方向：<select>
                <option>请选择</option>
            </select>
            </td>

            <td>
                阶段：<select>
                <option>请选择</option>
            </select>
            </td>
            <td>
                科目：<select>
                <option>请选择</option>
            </select>
            </td>
        </tr>

        <tr>
            <td>标题：<input type="text" name=""  ></td>
        </tr>

        <tr>
            <td>总分：<input type="text" name=""  >分<font color="red">*</font></td>
        </tr>

        <tr>
            <td>考试时长：<input type="text" name=""  >分钟</td>
        </tr>

        <tr>
            <td>单选题：简单<input type="text" class="smalltext"> 一般<input type="text" class="smalltext" > 困难<input type="text" class="smalltext" ></td>
        </tr>

        <tr>
            <td>多选题：简单<input type="text" class="smalltext" > 一般<input type="text" class="smalltext" > 困难<input type="text"  class="smalltext"></td>
        </tr>

        <tr>
            <td>总题数：<input type="text" name=""  class="smalltext"  ></td>
        </tr>

        <tr>
            <td>每题分数：<input type="text" name="" class="smalltext"  ></td>
        </tr>

        <tr >
            <td><input type="submit" value="创建试卷">  <input type="submit" value="取消"></td>

        </tr>



    </table>
</div>

</body>
</html>
