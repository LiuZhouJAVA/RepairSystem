<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/5/16
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="cn.itcast.JavaBean.RegisterBean" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
  RegisterBean rb=new RegisterBean();
  if(0!=rb.Register(request.getParameter("username"),request.getParameter("userpass"),request.getParameter("address")))
  {
      response.sendRedirect("index.jsp");
  }
  else
  {
      out.println("注册失败！");
  }
%>
</body>
</html>
