import cn.itcast.JavaBean.SendBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Servlet04")
public class Servlet04 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");

        String user=request.getParameter("username");
        String pass=request.getParameter("userpass");
        String tel=request.getParameter("tel");

        new SendBean().Send_mybill(user,pass,tel);

        request.getSession().setAttribute("user",user);
        request.getSession().setAttribute("pass",pass);

        response.sendRedirect("index.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
