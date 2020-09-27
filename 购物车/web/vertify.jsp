<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/5/15
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>CodePen - Login Form with floating placeholder and light button</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

<div class="login-box">
    <h2>购物车系统注册</h2>
    <form action="./RegisterSuccess.jsp" name="myform" method="post">
        <div class="user-box">
            <input type="text" name="username" required="">
            <label>用户名</label>
        </div>
        <div class="user-box">
            <input type="password" name="userpass" required="">
            <label>密码</label>
        </div>
        <div class="user-box">
            <input type="text" name="address" required="">
            <label>邮寄地址</label>
        </div>
        <!--    <input type="submit" value="登录" class="loginbut">-->
<%--        <a href="#" οnclick="document.getElementById('myform').submit();">--%>
            <!--      使用a标签实现表单的提交-->
        <button type="submit" class="loginbut">注册</button>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
    </form>
</div>
</body>
</html>
