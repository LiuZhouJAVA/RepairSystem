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
  <%!
    String user_name;
    String user_password;
  %>
  <%
    Cookie[] cookies=request.getCookies();
    for (Cookie cookie:cookies
    ) {
      if(cookie.getName().equals("uname"))
      {
        user_name=cookie.getValue();
      }
      if(cookie.getName().equals("upass"))
      {
        user_password=cookie.getValue();
      }
    }
//              session.removeAttribute("nouse");
  %>
  <h2>购物车系统登录</h2>
  <form action="./check.jsp" name="myfom" method="post">
    <div class="user-box">
      <input type="text" name="username" required="" value=<%=user_name==null?"":user_name%>>
      <label>用户名</label>
    </div>
    <div class="user-box">
      <input type="password" name="userpass" required="" value=<%=user_password==null?"":user_password%>>
      <label>密码</label>
    </div>

    <br>
    <label class="label_">记住密码：</label><input type="checkbox" name="Remember" value="yes">
    <br>

    <!--    <input type="submit" value="登录" class="loginbut">-->
    <button class="loginbut" type="submit">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      登录
    </button>

    <a href="./vertify.jsp">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      注册
    </a>
  </form>

</div>


</body>
</html>
