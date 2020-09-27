<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="cn.itcast.JavaBean.*" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/5/27
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<style>
    html
    {
        height: 600px;
        width: 300px;
    }
    body
    {
        background-color: transparent;
    }
    .show
    {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 200px;
        /*height: 100px;*/
        padding: 10px;
        transform: translate(-50%, -50%);
        background: rgba(0, 0, 0, 0.74);
        box-sizing: border-box;
        box-shadow: 0 15px 25px rgba(0,0,0,.6);
        border-radius: 10px;
        text-align: left;
        color: #03e9f4;
        font-size: 12px;
        font-weight: bolder;
    }

</style>
<body>
<div class="show">
    <%
        response.setHeader("refresh","10;url=Settlement.jsp");
        GetBean getBean=new GetBean();
        String userid=(String) session.getAttribute("userid");
        List<indentBean> list=getBean.getindentrecord(userid);
        for (int i=0;i<list.size();i++)
        {
                indentBean indentBean=list.get(i);
    %>
    订单编号：<%=indentBean.getIndentid()%>
    <br>
    会员名称：<%=indentBean.getUserid()%>
    <br>
    订单时间：<%=indentBean.getDate()%>
    <br>
    <br>
    <%
        }
    %>
</div>

</body>
</html>
