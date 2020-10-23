<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/10/12
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="FA/css/all.css">
    <style>
        #Form
        {
            width:1440px;
            height: 900px;
            background-color: white;
            position:absolute;

            left:0px;
            right:0px;

            margin-left:auto;
            margin-right:auto;
        }
        #callback
        {
            width: 100%;
            height:55px ;

        }

        .clasf
        {
            position:absolute;

            left:0px;
            right:0px;

            margin-top: 15px;

            margin-left:auto;
            margin-right:auto;
            width: 96px;
            height: 23px;
            font-size: 24px;
            font-family: Adobe Heiti Std;
            font-weight: normal;
            color: #8EC8F5;
        }

        .address
        {
            width: 700px;

            border: 1px solid #E9E9E9;
        }

        .state
        {
            width: 700px;
            height: 90px;
            border: 1px solid #E9E9E9;

        }
        #CLASSIFY
        {
            width: 530px;
            height: 30px;
            position:absolute;

            left:0px;
            right:0px;

            margin-left:auto;
            margin-right:auto;
            margin-top: 10px;
            font-size: 18px;
            /*color: deepskyblue;*/

        }
        #MIDDLE
        {
            margin-left: 450px;
            margin-top: 20px;
            font-size: 18px;
        }
        .classify
        {
            margin-left: 5px;
            margin-right: 15px;
        }
        #submitthis
        {
            width: 200px;
            height: 60px;
            background: deepskyblue;
            border-radius: 10px;
            position:absolute;

            left:0px;
            right:0px;

            margin-left:auto;
            margin-right:auto;
            margin-top: 112px;


            font-size: 24px;
            font-family: Adobe Heiti Std;
            font-weight: normal;

            color: #FFFFFF;
        }
    </style>
</head>
<body>
<div id="Form">
    <div id="callback">
        <span class="clasf">反馈信息</span>
    </div>
    <hr>
    <form action="Servlet03" method="post">
        <div id="CLASSIFY">
            <span>问题分类:</span>
            <input type="radio" name="classify" value="物业保修" class="classify">物业保修
            <input type="radio" name="classify" value="活动扰民" class="classify">活动扰民
            <input type="radio" name="classify" value="服务缺陷" class="classify">服务缺陷
            <input type="radio" name="classify" value="其他问题" class="classify">其他问题
        </div>
        <br>
        <br>

        <div id="MIDDLE">
            <span>发生地址：</span><input type="text" name="address" class="address">
            <br>
            <br>
            <span>事件描述：</span><textarea type="text" name="state" class="state"></textarea>

            <br>
            <br>
        </div>
        <a href="javascript：void（0）"><button type="submit" id="submitthis">提交反馈</button></a>
    </form>
</div>
</body>
</html>
