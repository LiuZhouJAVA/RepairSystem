<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.itcast.JavaBean.GetBean" %>
<%@ page import="cn.itcast.JavaBean.SendBean" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/10/13
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="FA/css/all.css">
    <style>
        .show
        {
            width: 1440px;
            height: 180px;

            margin-left: 200px;
            margin-top: 20px;
            border: 1px solid deepskyblue;
            font-size: 18px;
            font-weight: bolder;
            font-family: Arial, "Microsoft Yahei", "Helvetica Neue", Helvetica, sans-serif;
            transition: 0.5s;
            border-radius: 10px;
            overflow: auto;
        }

        .show:hover
        {
            box-shadow: 10px 10px 10px black;
        }
        #confirm
        {
            width: 75px;
            height: 25px;
            background-color: deepskyblue;
            color: white;
            font-weight: bolder;
        }
        .SA
        {
            float: right;
            font-size: 18px;
            margin-right: 15px;
        }
        .Call
        {

            border-radius: 10px;
            border: 1px solid #15ffd9;
            padding-top: 5px;
            padding-bottom: 5px;
            /*background-color: white;*/
        }
    </style>
</head>
<body>

<div style="font-size: 30px;font-weight: bolder;color: deepskyblue;text-align: center;margin-top: 20px;margin-bottom: 20px">
    管理员界面
</div>

<%
    //        response.setHeader("refresh","2");
    GetBean getBean=new GetBean();

    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html");
    request.setCharacterEncoding("utf-8");


        List<Map<String,Object>> list=getBean.GET_ALLREPARI();

        for (Map<String,Object> obj:list) {



%>
<form action="Servlet05" method="post">
<div class="show" >
    <span>用户 ： </span> <input type="text" name="userid" value="<%=obj.get("userid")%>" readonly="readonly"><br>
    <br>
    <%
        String userid=(String) obj.get("userid");
        System.out.println((String) obj.get("userid")+"------");
        List<Map<String,Object>> list2=getBean.GETTEL(userid);
        String TEL= (String) list2.get(0).get("tel");
        System.out.println("----"+TEL+"----");
    %>
    <span>用户电话 ： </span><span><%=TEL%></span> <br>
    <br>
    <span>问题分类 ： </span><span><%=obj.get("classify")==null?" ":obj.get("classify")%></span> <br>
    <br>
    <span>发生地址 ： </span><span><%=obj.get("address")==null?" ":obj.get("address")%></span><br>
    <br>
    <span style="color: tomato">处理状态 ： </span><span><%=obj.get("statu")==null?" ":obj.get("statu")%></span><br>
    <br>
    <span>问题描述 ： </span><span><%=obj.get("state")==null?" ":obj.get("state")%></span><br>

    <%--    <span>---------------------------------------------------</span><br>--%>


    <div class="SA">
        <select name="CHOOSESTA" id="" style="color: orangered;font-weight: bolder">
            <option value=" ">--请选择--</option>
            <option value="未处理">未处理</option>
            <option value="处理中">处理中</option>
            <option value="已处理">已处理</option>
        </select>
    </div>
    <br>
    <br>
    <span>时间 ： </span><input type="text" name="time" value="<%=obj.get("time")%>" readonly="readonly"><br>
    <br>
    <div class="Call">
        物业反馈 ： <input type="text" name="callback" placeholder="请给与回复">
    </div>
    <br>
    <br>
    <br>
    <input type="submit" value="更改" style="margin-left: 30px;border: 2px solid deepskyblue;color: #00a8ec">
    <br>
    <br>
    <br>
</div>
</form>


<%
            }






%>
</body>
</html>
