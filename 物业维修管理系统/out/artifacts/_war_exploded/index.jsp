<%@ page import="cn.itcast.JavaBean.LoginBean" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/10/8
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="FA/css/all.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="tab">
  <button id="but1">提交表单</button>

  <span>|</span>

  <button id="but2">我的表单</button>
  <a href="javascript:void (0)" id="logina">登录</a>
</div>
<div class="Choose">
  <iframe src="./my-repair-bill.jsp" frameborder="0" id="Frame1" scrolling="no"></iframe>
</div>
<!--登录小窗口-->
<div id="Login">
  <button id="close" style="width: 50px;height: 50px;border-radius: 10px"><i class="fa fa-arrow-circle-left" style="font-size: 40px"></i></button>
  <form action="Servlet01" method="post">
    <div id="div1">
      <span>用户:</span><input type="text" name="username" style="border: 1px solid deepskyblue"></div>
    <br>
    <div id="div2">
      <span>密码:</span><input type="text" name="userpass" style="border: 1px solid deepskyblue"></div>
    <br>
    <div id="div3">
    <a href=""><button type="submit" class="div3but">登录</button></a>

    <a href="javascript:void(0)"><button class="div3but" onclick="func3()" type="button">注册</button></a>
    </div>

  </form>
</div>
<!--注册小窗口-->
<div id="Register">
  <button id="close2" style="width: 50px;height: 50px;border-radius: 10px"><i class="fa fa-arrow-circle-left" style="font-size: 40px"></i></button>
  <form action="Servlet04" method="post">
    <div id="div12">
      <span>用户:</span><input type="text" name="username" style="border: 1px solid deepskyblue"></div>
    <br>
    <div id="div22">
      <span>密码:</span><input type="text" name="userpass" style="border: 1px solid deepskyblue"></div>
    <br>
    <div id="div33">
      <span>电话 :</span><input type="text" name="tel" style="border: 1px solid deepskyblue"></div>
    <br>

    <div id="div44">
      <a href=""><button type="submit" class="div33but" onclick="window.location.reload()">注册</button></a>
    </div>

  </form>
</div>
<!--遮罩层-->
<div id="cover"></div>
<script>
  var user="<%=session.getAttribute("user")%>";
  var N="null";

  var but2=document.getElementById("but2");

  var but1=document.getElementById("but1");
  but1.onclick=function () {
    if (!(user == N))
    {
        but1.style.backgroundColor="deepskyblue";
   but1.style.color="white";

   but2.style.backgroundColor="white";
   but2.style.color="deepskyblue";
   document.getElementById("Frame1").src="./Submit-bill.jsp";
    }else
    {
      var Login=document.getElementById("Login");
      Login.style.display="block";


      document.getElementById("cover").style.display="block";
    }


  /*  but1.style.backgroundColor="deepskyblue";
    but1.style.color="white";

    but2.style.backgroundColor="white";
    but2.style.color="deepskyblue";
    document.getElementById("Frame1").src="./Submit-bill.jsp";*/
  };
  but2.onclick=function () {
    but2.style.backgroundColor="deepskyblue";
    but2.style.color="white";

    but1.style.backgroundColor="white";
    but1.style.color="deepskyblue";

    document.getElementById("Frame1").src="./my-repair-bill.jsp";
  };
  document.getElementById("logina").onclick=function () {
    var Login=document.getElementById("Login");
    Login.style.display="block";


    document.getElementById("cover").style.display="block";
  }

  document.getElementById("close").onclick=function () {
    var Login=document.getElementById("Login");
    Login.style.display="none";
    document.getElementById("cover").style.display="none";
  }



  if(!(user == N))
  {
    document.getElementById("logina").innerHTML="你好！"+"<%=session.getAttribute("user")%>"
  }

function  func3()
{
  document.getElementById("Register").style.display="block";
}



</script>
<link rel="script" href="js/index.js">
</body>
</html>