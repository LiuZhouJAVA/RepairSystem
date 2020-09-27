<%@ page import="cn.itcast.JavaBean.GetBean" %>
<%@ page import="java.util.Set" %>
<%@ page import="cn.itcast.JavaBean.MerchandiseBean" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/5/16
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.itcast.JavaBean.GetBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/shoppingcar.css">
    <link rel="stylesheet" href="./FA/css/all.css">
</head>
<body>
<div class="header">
    <div class="searchbar">
        <form action="searchresult.jsp">
            <input type="text" name="search" class="search-shell"><button class="search-botton" type="submit"><i class="fas fa-search"></i></button>
        </form>
    </div>
    <div class="icon">
        <i class="fas fa-cart-plus"></i>
        <iframe src="Settlement.jsp" frameborder="0" class="frame"></iframe>
    </div>
</div>
<div class="choosemenu">
    <form action="./Servlet01" name="myform">
        <%
            GetBean getBean=new GetBean();
            List<MerchandiseBean> list=getBean.gethotsell();
            for (int i=0;i<5;i++)
            {
                MerchandiseBean merchandiseBean=new MerchandiseBean();
                merchandiseBean=list.get(i);
        %>
        <div class="merchandise1 merchandise">
            <ul class="nav">
                <li><input type="checkbox" class="checkbox" value=<%=i%> name="checkbox"></li>
                <li>
                    <%
                        out.print(merchandiseBean.getId());
                    %>
                </li>
                <li>
                    <img src="<%=merchandiseBean.getLocation()%>" alt="" width="50px" height="50px">
                </li>
                <li>
                    <%
                        String infonum="inf"+i;
                    %>
                    <input type="text" value="<%=merchandiseBean.getInf()%>" name=<%=infonum%>>
                </li>
                <li>
                    <%
                        String pricenum="price"+i;
                    %>
                    <input type="text" value="<%=merchandiseBean.getPrice()%>" name=<%=pricenum%>>
                </li>
                <li>
                    <%
                        String number="number"+i;
                    %>
                    <input type="number" name=<%=number%> min="0" max="99" step="1" class="number">
                </li>
            </ul>
        </div>
        <%
            }
        %>
        <button type="submit" class="submitbut">添加购物车</button>
    </form>
</div>
<div class="toolbar">
    <div>
        <a href="shopping.jsp">全部</a>
    </div>
    <div>
        <a href="hotsell.jsp">热销</a>
    </div>
    <div>
        <a href="digitalproducts.jsp">数码</a>
    </div>
    <div>
        <a href="clothes.jsp">服装</a>
    </div>
    <div>
        <a href="watches.jsp">手表</a>
    </div>
    <div>
        <a href="foods.jsp">食品</a>
    </div>
    <div>
        <a href="games.jsp">游戏</a>
    </div>
    <div>
        <a href="skincareproduct.jsp">护肤品</a>
    </div>
</div>
</body>
</html>