<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="cn.itcast.JavaBean.GetBean" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/6/18
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="FA/css/all.css">
</head>
<body>
<div class="header">
    <a href="login.jsp" style="display: block;margin: 0 auto;color: white;font-size: 20px;"><img src="./pics/logo-sem.png" alt="">管理员登录</a>

   <%-- <div class="systitle" >
        <p>欢迎来到调查问卷平台</p>
    </div>
  <div class="searchbar">
    <form action="searchresult.jsp">
      <input type="text" name="search" class="search-shell"><button class="search-botton" type="submit"><i class="fas fa-search"></i></button>
    </form>
  </div>
  <div class="icon">
    <a href="login.jsp"><i class="fas fa-spinner fa-pulse"></i>管理员登录</a>
  </div>--%>
</div>
<div class="choosemenu">
    <%
      GetBean getBean=new GetBean();
      List<Map<String,Object>> list=getBean.get_totalsurvey();
      for ( Map<String,Object> objectMap:list ) {
    %>
    <form action="investigating.jsp" >
        <ul class="nav">
      名称：<li><input type="text" name="surveyname" value=<%=objectMap.get("surveyname")%>></li>
    创建者：<li><input type="text" name="userid" value=<%=objectMap.get("userid")%>></li>
    发起时间：<li><%=objectMap.get("surveydate")%></li>
    <li><button type="submit" class="Button">参与调查</button></li>
        </ul>
    </form>
   <%
    }
  %>

</div>
</body>
</html>