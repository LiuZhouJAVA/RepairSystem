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


        System.out.println(callback);
        System.out.println(statu);
        System.out.println(time);
        System.out.println(userid+"----");


        new SendBean().CHANGE(statu,callback,userid,time);



        response.sendRedirect("ROOT.jsp");



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
