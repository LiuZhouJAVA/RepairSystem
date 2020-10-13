import cn.itcast.JavaBean.SendBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/Servlet03")

public class Servlet03 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");

        String classify=request.getParameter("classify");
        String state=request.getParameter("state");
        String address=request.getParameter("address");
        String suerid=(String) request.getSession().getAttribute("user");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
       String time=df.format(new Date());

        new SendBean().Send_mybill(suerid,classify,address,state,time);

        response.sendRedirect("my-repair-bill.jsp");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
