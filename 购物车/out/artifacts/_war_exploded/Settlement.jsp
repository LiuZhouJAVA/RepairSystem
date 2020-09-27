<%@ page import="java.util.List" %>
<%@ page import="cn.itcast.JavaBean.MerchandiseBean02" %>
<%@ page import="cn.itcast.JavaBean.GetCarStaff" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/5/17
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/Settlement.css">
</head>
<body>
<div class="info">
    <br>
<%
    String userid=(String) session.getAttribute("userid");
    response.setHeader("refresh","3");
    GetCarStaff getCarStaff=new GetCarStaff();

    String staffname=request.getParameter("name");
    String staffprice=request.getParameter("price");
    if (userid!=null&&staffname!=null&&staffprice!=null)
    {
        getCarStaff.DeleteCarStaff(userid,staffname,staffprice);
    }
    List<MerchandiseBean02> list=getCarStaff.getcar(userid);
    List<Integer> list1=new ArrayList<>();
    for (MerchandiseBean02 merchandiseBean02 : list) {
%>
    <form action="Settlement.jsp">
        <p>
            商品名称：<input type="text" name="name" value=<%=merchandiseBean02.getInf()%>>
        </p>
        <br>
        <p>
            商品价格：<input type="text" name="price" value=<%=merchandiseBean02.getPrice()%>>
        </p>
        <br>
        <p>
            商品数量：<br><%=merchandiseBean02.getNumber()%>
        </p>
        <br>
        <button type="submit" class="button1">删除</button>
    </form>

    <%
            Integer tot = Integer.parseInt(merchandiseBean02.getPrice()) * Integer.parseInt(merchandiseBean02.getNumber());
            list1.add(tot);
        }
 %>
</div>
<div class="tot">
    <%
        int total=0;
        for (Integer integer : list1) {
            total += integer.intValue();
        }
        out.print("共计："+total);
    %>
</div>
<button type="button" class="button"><a href="indent.jsp">结算</a></button>
<button type="button" class="button"><a href="indentrecord.jsp">查看历史订单</a></button>

</body>
</html>
