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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Title</title>
    <!-- Bootstrap -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">


    <title>Title</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="FA/css/all.css">
    <style>
        .show
        {
            width: 1440px;
            height: 280px;

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
//        System.out.println((String) obj.get("userid")+"------");
        List<Map<String,Object>> list2=getBean.GETTEL(userid);
        String TEL=null;
        System.out.println(list2.size());
        for (Map map:
             list2) {
            System.out.println(map.get("tel"));
            TEL=(String) map.get("tel");
        }


       /* Map<String, Object> map = list2.get(0);
        System.out.println("我是---"+map);
            String TEL = (String) map.get("tel");*/

//        System.out.println("----"+TEL+"----");
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
    <div class="SA">
        <select name="ENDTiME" style="color: orangered;font-weight: bolder">
            <option value=" ">--请选择--</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>

        </select><span>天</span>
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
<%--    <input type="submit" value="更改" class="btn btn-danger">--%>
    <button class="btn btn-danger" type="submit" style="margin-left: 50px" >更改</button>
    <br>
    <br>
    <br>
</div>
</form>


<%
            }






%>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
