<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/6/19
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/management.css">
</head>
<body>
<ul class="header">
    <li><a href="management.jsp">发布问卷</a></li>
    <li><a href="mysurvey.jsp">我的问卷</a></li>
    <li><a href="result.jsp">调查结果</a></li>
</ul>
<div class="choosemenu">
    <form action="./Servlet01" method="get">
        <p style="color: #ff253a">* 请输入题目</p>
        <input type="text" name="questitle" style="width: 500px;height: 30px; ">
        <br>
        <input type="radio" name="questype" value="单选">单选
        <input type="radio" name="questype" value="填空">填空
        <br><br>
        <p style="color: #ff253a">* 如果是单选，请在下面填写选项并且选中；如果是填空，请直接下一步。</p>
        <br><br>
        <input type="checkbox" name="queschoise" value="A">A
        <input type="text" name="A">
        <br>
        <br>
        <input type="checkbox" name="queschoise" value="B">B
        <input type="text" name="B">
        <br>
        <br>
        <input type="checkbox" name="queschoise" value="C">C
        <input type="text" name="C">
        <br>
        <br>
        <input type="checkbox" name="queschoise" value="D">D
        <input type="text" name="D">
        <br>
        <br>
        <button type="submit" name="button" class="Button" value="next">下一题</button>
        <button type="reset" class="Button">重置</button>
        <button type="submit" name="button" class="Button" value="end">结束</button>
    </form>
</div>
</body>
</html>
