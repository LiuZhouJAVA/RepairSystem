import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Servlet02")
public class Servlet02 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");

        String classify=request.getParameter("qusoption");
        String status=request.getParameter("staoption");

        request.getSession().setAttribute("classify",classify);
        request.getSession().setAttribute("status",status);

        System.out.println(classify);
        System.out.println(status);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
