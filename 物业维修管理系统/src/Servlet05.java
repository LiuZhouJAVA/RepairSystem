import cn.itcast.JavaBean.SendBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Servlet05")
public class Servlet05 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");


        String callback=request.getParameter("callback");
        String userid=request.getParameter("userid");
        String statu=request.getParameter("CHOOSESTA");
        String time=request.getParameter("time");
        //设置的处理时长
        String time2=request.getParameter("ENDTiME");

        long endtime=System.currentTimeMillis()+Integer.parseInt(time2)*24*60*60*1000;


        System.out.println(endtime+"------");


        new SendBean().CHANGE(statu,callback,userid,time,endtime,time2);



        response.sendRedirect("ROOT.jsp");



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
