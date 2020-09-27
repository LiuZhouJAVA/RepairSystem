<%@ page import="java.util.List" %>
<%@ page import="cn.itcast.JavaBean.GetBean" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/6/20
  Time: 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style03.css">
</head>
<body>
<div class="choosemenu">
<%
  String surveyname=request.getParameter("surveyname") ;
  String userid=request.getParameter("userid");
    session.setAttribute("createrid",userid);
    session.setAttribute("The_questionnaire_name",surveyname);
%>
   <p style="font-size: 30px;font-weight: bolder;color: white"><%=surveyname%></p>
    <br>
   <% List<Map<String,Object>> list=new GetBean().get_ques(surveyname,userid);
       List<Map<String,Object>> list1=new GetBean().get_radio(surveyname,userid);
       List<Map<String,Object>> list2=new GetBean().get_gap(surveyname,userid);
     /*   List<String> list_for_radioname=new ArrayList<>();
        List<String> list_for_gapname=new ArrayList<>();
        for (int i=1;i<=list1.size();i++)
        {
            list_for_radioname.add(i+"queschoise");
        }
       for (int i=1;i<=list2.size();i++)
       {
           list_for_gapname.add(i+"answer");
       }*/
       int n=1;
       int m=1;
   %>
    <form action="./Servlet03" method="post">
        <%
            for (Map<String,Object> objectmap:list1) {
        %>
        <br>
        <p><%=objectmap.get("questitle")%></p>
        <br>
        <%
                for(int i=1;i<=(int)objectmap.get("number");i++)
                {
                    String a="queschoise"+i;
        %>
        <input type="radio" name=<%=n+"queschoise"%> value=<%=objectmap.get(a)%>><%="  "+objectmap.get(a)%>
        <%
             }
                n++;
            }
        %>
        <%
            for (Map<String,Object> objectmap:list2) {
        %>
        <br>
        <p><%=objectmap.get("questitle")%></p>
        <br>
        <input type="text" name=<%=m+"answer"%>>
        <br>
        <%
               m++; }
        %>
        <br>
        <br>
        答卷者姓名：<input type="text" name="participatorname" style="background-color: transparent;color: #03e9f4">
        <br>
        <br>
        <button type="submit" class="Button">提交问卷</button>
    </form>


</div>
</body>
</html>
