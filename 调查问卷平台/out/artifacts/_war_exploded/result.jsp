<%@ page import="java.util.List" %>
<%@ page import="cn.itcast.JavaBean.GetBean" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/6/20
  Time: 6:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/result.css">
    <link rel="stylesheet" href="css/reset.css">
</head>
<body>
<ul class="header">
    <li><a href="management.jsp">发布问卷</a></li>
    <li><a href="mysurvey.jsp">我的问卷</a></li>
    <li><a href="result.jsp">调查结果</a></li>
</ul>
<div class="choosemenu">
    <%
        List<Map<String,Object>> list=new GetBean().get_personal((String) session.getAttribute("userid"));
        List<Map<String,Object>> list1=new GetBean().get_participatename();
    %>
<p style="color: white;font-size: 30px;font-weight: bolder">调查结果</p>
    <br>
    <%
        for (Map<String, Object> objectMap0: list1) {

            for (Map<String,Object> objectMap:list)
            {
                if (objectMap.get("participatorname").equals(objectMap0.get("participatorname")))
                {
    %>
    <br>
    <p>问卷：<%=objectMap.get("surveyname")%>    姓名：<%=objectMap.get("participatorname")%></p>
    <br>
    <p><%=objectMap.get("questitle")%>  :  <%=objectMap.get("choose")==null?objectMap.get("gap"):objectMap.get("choose")%></p>
    <br>
    <%
                }
            }
        }
    %>
    <a href="index.jsp"><button   class="Button" >回到首页</button></a>
</div>
</body>
</html>
