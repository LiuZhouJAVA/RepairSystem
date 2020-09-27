import cn.itcast.JavaBean.SaveBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Servlet01")
public class Servlet01 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");



        String[] checkboxs=request.getParameterValues("checkbox");
        try {
            for (String a : checkboxs) {
                    String preinf="inf"+Integer.parseInt(a);
                    String inf = request.getParameter(preinf);

                    String preprice="price"+Integer.parseInt(a);
                    String price = request.getParameter(preprice);


                    String prenumber="number"+Integer.parseInt(a);
                    String number = request.getParameter(prenumber);

                    String userid = (String) request.getSession().getAttribute("userid");
                    SaveBean sb = new SaveBean();
                    sb.Save(userid, inf, price, number);
                    System.out.println(a);
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        response.sendRedirect("shopping.jsp");
    }
}
