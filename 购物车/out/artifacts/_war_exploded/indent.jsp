<%@ page import="java.util.List" %>
<%@ page import="cn.itcast.JavaBean.MerchandiseBean" %>
<%@ page import="cn.itcast.JavaBean.MerchandiseBean02" %>
<%@ page import="cn.itcast.JavaBean.GetCarStaff" %>
<%@ page import="cn.itcast.JavaBean.SaveBean" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
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
        height: 100px;
        padding: 10px;
        transform: translate(-50%, -50%);
        background: rgba(0, 0, 0, 0.74);
        box-sizing: border-box;
        box-shadow: 0 15px 25px rgba(0,0,0,.6);
        border-radius: 10px;
        text-align: center;
        color: #03e9f4;
        font-size: 16px;
        font-weight: bolder;
    }

</style>
<body>
<div class="show">
    <p>
        下单成功 ！！！
    </p>
</div>
<%
    response.setHeader("refresh","3;url=Settlement.jsp");
    GetCarStaff getCarStaff=new GetCarStaff();
    SaveBean saveBean=new SaveBean();
    String userid=(String) session.getAttribute("userid");
    List<MerchandiseBean02> list=getCarStaff.getcar(userid);
    for (int i=0;i<list.size();i++)
    {
        saveBean.Savesales(list.get(i).getNumber(),list.get(i).getInf());
    }

    Long mills=System.currentTimeMillis();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String date=df.format(new Date());

    saveBean.SaveIndent(mills.toString(),userid,date);
%>
</body>
</html>
