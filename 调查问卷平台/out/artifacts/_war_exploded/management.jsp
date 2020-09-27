<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/6/19
  Time: 7:58
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
    <form action="./Servlet02" method="post">
        <h1>请输入问卷的标题</h1>
        <input type="text" class="title" name="title">
        <button class="submit" type="submit">下一步</button>
    </form>
    <a href="index.jsp"><button   class="Button" >回到首页</button></a>
</div>
</body>
</html>
