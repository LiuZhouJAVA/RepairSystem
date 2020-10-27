<%@ page import="cn.itcast.JavaBean.GetBean" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/10/12
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
        html{
            /* background-color: yellow;*/
        }
        body{
            width: 100%;
            height: 1080px;
        }
        #contenthtml
        {
            width: 1440px;
            height: 900px;

        }

        .CT{
            width: 1440px;
            height: 900px;
            position:absolute;

            left:0px;
            right:0px;

            margin-left:auto;
            margin-right:auto;
        }
        #choose
        {
            margin-top: 20px;
            margin-left: 207px;
            font-size: 15px;
            font-weight: bolder;
            /*background-color: rgba(154, 154, 154, 0.36);*/
        }
        #choose span
        {
            line-height: 100%;
        }
        #content1{
            position:absolute;

            left:0px;
            right:0px;

            margin-left:auto;
            margin-right:auto;
        }

        .show
        {
            width: 1440px;
            /*height: 130px;*/

            margin-left: 200px;
            margin-top: 20px;

            padding-top: 15px;
            padding-left: 15px;
            border: 1px solid rgb(51,122,183);

       /*     font-size: 18px;
            font-weight: bolder;
            font-family: Arial, "Microsoft Yahei", "Helvetica Neue", Helvetica, sans-serif;*/
            transition: 0.5s;
            border-radius: 10px;
            overflow: auto;
        }

        .show:hover
        {
            box-shadow: 10px 10px 10px black;
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
            border: 1px solid rgb(51,122,183);
            padding-top: 5px;
            padding-bottom: 5px;
            /*background-color: white;*/
        }

    </style>
</head>
<body>
<div id="choose">
    <form action="" method="post">
        <span class="label label-primary">问题分类</span>
        <select name="qusoption">
            <option value="--请选择--" >--请选择--</option>
            <option value="物业保修">物业保修</option>
            <option value="活动扰民" >活动扰民</option>
            <option value="服务缺陷" >服务缺陷</option>
            <option value="其他问题" >其他问题</option>
        </select>
        <span class="label label-primary">状态</span>
        <select name="staoption">
            <option value="--全部--" >--全部--</option>
            <option value="处理中" >处理中</option>
            <option value="未处理" >未处理</option>
            <option value="已处理" >已处理</option>
        </select>
        <button type="submit" id="confirm" onclick="func()" class="btn btn-primary">确认</button>
    </form>
</div>
<hr>
<div>
    <%
//        response.setHeader("refresh","2");
        GetBean getBean=new GetBean();

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        String classify=request.getParameter("qusoption");
        String status=request.getParameter("staoption");
        String user= (String) session.getAttribute("user");

        System.out.println(classify+"?");
        System.out.println(status+"??");
        System.out.println(user+"???");
        List<Map<String,Object>> list=getBean.GET_ALLREPARI_BYID(user);


        if (classify==null&&user!=null)
        {
    %>
    <button class="btn btn-primary" type="button" style="margin-left: 200px">
        Messages <span class="badge"><%=list.size()%></span>
    </button>
    <%
        int num=0;



            for (Map<String,Object> obj:list
            ) {
                System.out.println("======="+obj.get("userid"));
                if(user.equals(obj.get("userid"))){
                    System.out.println("ENDTIME"+obj.get("endtime"));
                    long lefttime=0;

                    if ((String)obj.get("endtime")!=null) {
                         lefttime = Long.parseLong((String) obj.get("endtime")) - System.currentTimeMillis();
                        System.out.println(lefttime+"-*-*-*-*-*-");
                        System.out.println(obj.get("duringtime")+"-*-*-*-*-*");
                        System.out.println((lefttime/(Integer.parseInt((String)obj.get("duringtime"))*24*60*60*10))+"-*-*-*-*--*");
                    }

    %>
    <div class="show"  >
    <span>问题分类 ： </span><span><%=obj.get("classify")==null?" ":obj.get("classify")%></span> <br>
        <br>
    <span>发生地址 ： </span><span><%=obj.get("address")==null?" ":obj.get("address")%></span><br>
        <br>
    <span>问题描述 ： </span><span><%=obj.get("state")==null?" ":obj.get("state")%></span><br>


        <div class="SA">
    <i class="fas fa-chevron-circle-right" style="padding-right: 10px"></i><span class="STA"><%=obj.get("statu")==null?"未处理":obj.get("statu")%></span>
</div>
        <br>

        <span>时间 ： </span><span><%=obj.get("time")==null?" ":obj.get("time")%></span><br>
        <br>
        <div class="Call">
            物业反馈 ： <%=obj.get("callback")==null?" ":obj.get("callback")%>
        </div>
        <br>
        <br>
        <hr><p>处理进度条：</p><br>
        <div>
            <span class="label label-info" id="_d<%=num%>">00</span>
            <span class="label label-info" id="_h<%=num%>">00</span>
            <span class="label label-info" id="_m<%=num%>">00</span>
            <span class="label label-info" id="_s<%=num%>">00</span>
        </div>  <br>
        <script>
            function countTime<%=num%>() {
                //获取当前时间
                var date = new Date();
                var now = date.getTime();
                //设置截止时间


                var end = "<%=obj.get("endtime")%>";

                //时间差
                var leftTime = end - now;

                //定义变量 d,h,m,s保存倒计时的时间
                var d, h, m, s;
                if (leftTime >= 0) {
                    d = Math.floor(leftTime / 1000 / 60 / 60 / 24);
                    h = Math.floor(leftTime / 1000 / 60 / 60 % 24);
                    m = Math.floor(leftTime / 1000 / 60 % 60);
                    s = Math.floor(leftTime / 1000 % 60);
                    //将倒计时赋值到div中
                    document.getElementById("_d<%=num%>").innerHTML = d + "天";
                    document.getElementById("_h<%=num%>").innerHTML = h + "时";
                    document.getElementById("_m<%=num%>").innerHTML = m  + "分";
                    document.getElementById("_s<%=num%>").innerHTML = s + "秒";
                }
            }

            setInterval(countTime<%=num%>,1000)

        </script>
        <div class="progress">


            <%
            if(obj.get("statu")==null||obj.get("statu").equals("未处理"))
            {
            %>
            <div class="progress-bar progress-bar-danger  progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
                <span class="sr-only"></span>
            </div>
            <%
                }
            %>
            <%
                if(obj.get("statu").equals("已处理"))
                {
            %>
            <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                <span class="sr-only"></span>
            </div>
            <%
                }
            %>
            <%
                if(obj.get("statu").equals("处理中"))
                {
            %>
            <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: <%=100-(lefttime/(Long.parseLong((String)obj.get("duringtime"))*24*60*60*10))%>%">
                <span class="sr-only"></span>
            </div>
            <%
                }
            %>

        </div>
    </div>

    <% num++;
            }}}



//        if (classify == "物业保修"){
            List<Map<String,Object>> list1 = getBean.GET_CHOOSEREPAIR(user,classify,status);
if (!list1.isEmpty()){
    %>
    <button class="btn btn-primary" type="button" style="margin-left: 200px">
        Messages <span class="badge"><%=list1.size()%></span>
    </button>
    <%}

int num2=0;
            for (Map<String,Object> obj2:list1)
            {

                long lefttime=0;

                if ((String)obj2.get("endtime")!=null) {
                    lefttime = Long.parseLong((String) obj2.get("endtime")) - System.currentTimeMillis();
                    System.out.println(lefttime+"-*-*-*-*-*-");
                    System.out.println(obj2.get("duringtime")+"-*-*-*-*-*");
                    System.out.println((lefttime/(Integer.parseInt((String)obj2.get("duringtime"))*24*60*60*10))+"-*-*-*-*--*");
                }

    %>
<div class="show" >
    <span>问题分类 ： </span><span><%=obj2.get("classify")==null?" ":obj2.get("classify")%></span><br>
    <br>
    <span>发生地址 ： </span><span><%=obj2.get("address")==null?" ":obj2.get("address")%></span><br>
    <br>
    <span>问题描述 ： </span><span><%=obj2.get("state")==null?" ":obj2.get("state")%></span><br>

<%--    <span>---------------------------------------------------</span><br>--%>


    <div class="SA">
        <i class="fas fa-chevron-circle-right" style="padding-right: 10px"></i><span class="STA"><%=obj2.get("statu")==null?"未处理":obj2.get("statu")%></span>
    </div>
    <br>
    <span>时间 ： </span><span><%=obj2.get("time")==null?" ":obj2.get("time")%></span><br>
    <br>
    <div class="Call" >
        物业反馈 ： <%=obj2.get("callback")==null?" ":obj2.get("callback")%>
    </div>
    <br>
    <br>
    <hr>
    <p>处理进度条：</p><br>
    <div>
        <span class="label label-info" id="_d<%=num2%>">00</span>
        <span class="label label-info" id="_h<%=num2%>">00</span>
        <span class="label label-info" id="_m<%=num2%>">00</span>
        <span class="label label-info" id="_s<%=num2%>">00</span>
    </div>  <br>
    <script>
        function countTime<%=num2%>() {
            //获取当前时间
            var date = new Date();
            var now = date.getTime();
            //设置截止时间


            var end = "<%=obj2.get("endtime")%>";

            //时间差
            var leftTime = end - now;
            //定义变量 d,h,m,s保存倒计时的时间
            var d, h, m, s;
            if (leftTime >= 0) {
                d = Math.floor(leftTime / 1000 / 60 / 60 / 24);
                h = Math.floor(leftTime / 1000 / 60 / 60 % 24);
                m = Math.floor(leftTime / 1000 / 60 % 60);
                s = Math.floor(leftTime / 1000 % 60);
                //将倒计时赋值到div中
                document.getElementById("_d<%=num2%>").innerHTML = d + "天";
                document.getElementById("_h<%=num2%>").innerHTML = h + "时";
                document.getElementById("_m<%=num2%>").innerHTML = m +"分";
                document.getElementById("_s<%=num2%>").innerHTML = s + "秒";
            }
        }

        setInterval(countTime<%=num2%>,1000)

    </script>
    <div class="progress">

        <%
            if(obj2.get("statu")==null||obj2.get("statu").equals("未处理"))
            {
        %>
        <div class="progress-bar progress-bar-danger  progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
            <span class="sr-only"></span>
        </div>
        <%
            }
        %>
        <%
            if(obj2.get("statu").equals("已处理"))
            {
        %>
        <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
            <span class="sr-only"></span>
        </div>
        <%
            }
        %>
        <%
            if(obj2.get("statu").equals("处理中"))
            {
        %>
        <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: <%=100-(lefttime/(Long.parseLong((String)obj2.get("duringtime"))*24*60*60*10))%>%">
            <span class="sr-only"></span>
        </div>
        <%
            }
        %>

    </div>
</div>
    <%
        num2++;

        }

    %>


</div>


<script>


    function func() {
    window.location.reload();
}

function func2() {
    var sta=document.getElementsByClassName("STA");

    for (var x of sta) {
        if (x.innerHTML=="未处理")
        {
            x.style.color="red";
        }
        if (x.innerHTML=="已处理")
        {
            x.style.color="green";
        }
        if (x.innerHTML=="处理中")
        {
            x.style.color="#FFB300";
        }
    }
}
func2();
/*var show=document.getElementsByClassName("show");
show.onclick=function () {
    var d=show.getElementsByTagName("div");
    d[0].style.display="block";
}*/


</script>






<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
