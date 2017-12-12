<%--
  Created by IntelliJ IDEA.
  User: 晏利花
  Date: 2017/11/21
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="core" %>
<html>
<head>
    <title>answersheet</title>
    <style>
        #bottomdiv{
            width: 100%;
            height:700px;
            background-color: gainsboro;
        }
        #testdetailstable{
            width: 100%;
            height: 80px;
            margin: auto;
            text-align: center;
        }
        #titledetails{
            width: 100%;
            text-align: center;
        }
        #buttondiv{
            width: 200px;
            height: 50px;
            position: relative;
            left: 50px;
            top: 240px;
        }
        .answertext{
            width: 45px;
            height: 30px;
        }
    </style>

</head>
<body>
<div id="bottomdiv">
    <table border="0" id="testdetailstable">
        <tr>
            <td>科目:PS综合测试</td>
            <td>开考时间:2017-11-21 9:29:06</td>
            <td colspan="2">考试时长:60分钟</td>
        </tr>
        <tr>
            <td>总分:100分</td>
            <td>总题数:41</td>
            <td>倒计时:57分0秒</td>
            <td><input type="button" value="完成考试"></td>
        </tr>
    </table>
    <hr>
    <table border="1" id="titledetails">
        <tr>
            <td>1<br>
                <input class="answertext" type="text">
            </td>
            <td>2<br>
                <input class="answertext" type="text">
            </td>
            <td>3<br>
                <input class="answertext" type="text">
            </td>
            <td>4<br>
                <input class="answertext" type="text">
            </td>
            <td>5<br>
                <input class="answertext" type="text">
            </td>
            <td>6<br>
                <input class="answertext" type="text">
            </td>
            <td>7<br>
                <input class="answertext" type="text">
            </td>
            <td>8<br>
                <input class="answertext" type="text">
            </td>
            <td>9<br>
                <input class="answertext" type="text">
            </td>
            <td>10<br>
                <input class="answertext" type="text">
            </td>
        </tr>
        <tr>
            <td>11<br>
                <input class="answertext" type="text">
            </td>
            <td>12<br>
                <input class="answertext" type="text">
            </td>
            <td>13<br>
                <input class="answertext" type="text">
            </td>
            <td>14<br>
                <input class="answertext" type="text">
            </td>
            <td>15<br>
                <input class="answertext" type="text">
            </td>
            <td>16<br>
                <input class="answertext" type="text">
            </td>
            <td>17<br>
                <input class="answertext" type="text">
            </td>
            <td>18<br>
                <input class="answertext" type="text">
            </td>
            <td>19<br>
                <input class="answertext" type="text">
            </td>
            <td>20<br>
                <input class="answertext" type="text">
            </td>
        </tr>
        <tr>
            <td>21<br>
                <input class="answertext" type="text">
            </td>
            <td>22<br>
                <input class="answertext" type="text">
            </td>
            <td>23<br>
                <input class="answertext" type="text">
            </td>
            <td>24<br>
                <input class="answertext" type="text">
            </td>
            <td>25<br>
                <input class="answertext" type="text">
            </td>
            <td>26<br>
                <input class="answertext" type="text">
            </td>
            <td>27<br>
                <input class="answertext" type="text">
            </td>
            <td>28<br>
                <input class="answertext" type="text">
            </td>
            <td>29<br>
                <input class="answertext" type="text">
            </td>
            <td>20<br>
                <input class="answertext" type="text">
            </td>
        </tr>
        <tr>
            <td>31<br>
                <input class="answertext" type="text">
            </td>
            <td>32<br>
                <input class="answertext" type="text">
            </td>
            <td>33<br>
                <input class="answertext" type="text">
            </td>
            <td>34<br>
                <input class="answertext" type="text">
            </td>
            <td>35<br>
                <input class="answertext" type="text">
            </td>
            <td>36<br>
                <input class="answertext" type="text">
            </td>
            <td>37<br>
                <input class="answertext" type="text">
            </td>
            <td>38<br>
                <input class="answertext" type="text">
            </td>
            <td>39<br>
                <input class="answertext" type="text">
            </td>
            <td>40<br>
                <input class="answertext" type="text">
            </td>
        </tr>
        <tr>
            <td>41<br>
                <input class="answertext" type="text">
            </td>
            <td>42<br>
                <input class="answertext" type="text">
            </td>
            <td>43<br>
                <input class="answertext" type="text">
            </td>
            <td>44<br>
                <input class="answertext" type="text">
            </td>
            <td>45<br>
                <input class="answertext" type="text">
            </td>
            <td>46<br>
                <input class="answertext" type="text">
            </td>
            <td>47<br>
                <input class="answertext" type="text">
            </td>
            <td>48<br>
                <input class="answertext" type="text">
            </td>
            <td>49<br>
                <input class="answertext" type="text">
            </td>
            <td>50<br>
                <input class="answertext" type="text">
            </td>
        </tr>
    </table>
    <hr>
    <table border="1" style="width: 100%">
        <tr>
            <td>

            </td>
        </tr>
    </table>
    <div id="buttondiv">
        <input type="button" value="上一题">
         <input type="button" value="下一题">
    </div>
</div>
</body>
</html>
