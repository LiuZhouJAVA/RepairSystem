<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/5/16
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.itcast.JavaBean.LoginBean" %>
<%@ page import="javax.swing.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name=request.getParameter("username");
    String pass=request.getParameter("userpass");
    request.getSession().setAttribute("userid",name);
    request.getSession().setAttribute("userpadd",pass);
    Cookie cookie_name=new Cookie("uname",name);
    Cookie cookie_pass=new Cookie("upass",pass);
    String Choose = request.getParameter("Remember");
    LoginBean loginBean=new LoginBean();
    if(1 == loginBean.Login(name, pass))
    {
        if (Choose!=null)
        {
            response.addCookie(cookie_name);
            response.addCookie(cookie_pass);
            cookie_name.setMaxAge(30 * 24 * 60 * 60);
            cookie_pass.setMaxAge(30 * 24 * 60 * 60);
        }
        else {
            cookie_name.setMaxAge(0);
            cookie_pass.setMaxAge(0);
        }
        request.getRequestDispatcher("shopping.jsp").forward(request,response);
    }else
    {
        out.print("错误");
//        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
%>
</body>
</html>
