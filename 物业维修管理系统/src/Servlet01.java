import cn.itcast.JavaBean.LoginBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Servlet01")

public class Servlet01 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");

        String user=request.getParameter("username");
        String pass=request.getParameter("userpass");

        System.out.println(user);
        System.out.println(pass);
        LoginBean loginBean=new LoginBean();
        if(loginBean.Login(user,pass)==1) {

            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("pass", pass);

            if (user.equals("root") && pass.equals("root")) {
                response.sendRedirect("ROOT.jsp");
            } else {

//            request.getRequestDispatcher("index.jsp").forward(request,response);
                response.sendRedirect("index.jsp");
            }
        }

        else{
//            response.setHeader("refresh","2;url=index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
