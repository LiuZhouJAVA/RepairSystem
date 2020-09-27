<%@ page import="cn.itcast.JavaBean.GetBean" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/6/20
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/mysurvey.css">
</head>
<body>
<ul class="header">
    <li><a href="management.jsp">发布问卷</a></li>
    <li><a href="mysurvey.jsp">我的问卷</a></li>
    <li><a href="result.jsp">调查结果</a></li>
</ul>
<div class="choosemenu">
    <%
        GetBean getBean=new GetBean();
        List<Map<String,Object>> list=getBean.get_specialsurvey((String) session.getAttribute("userid"));
        for ( Map<String,Object> objectMap:list ) {
    %>
    <form action="investigating.jsp" >
        <ul class="nav">
            名称：<li><%=objectMap.get("surveyname")%></li>
            创建者：<li><%=objectMap.get("userid")%></li>
            发起时间：<li><%=objectMap.get("surveydate")%></li>
<%--            <li><button type="submit" class="Button">参与调查</button></li>--%>
        </ul>
    </form>
    <%
        }
    %>
    <a href="index.jsp"><button   class="Button" >回到首页</button></a>
</div>
</body>
</html>
