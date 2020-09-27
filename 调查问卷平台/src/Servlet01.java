import cn.itcast.JavaBean.SaveBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@WebServlet("/Servlet01")
public class Servlet01 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        List<String> List01 = new ArrayList<>();
        SaveBean saveBean = new SaveBean();


        String surveyname = (String) request.getSession().getAttribute("title");
        String userid = (String) request.getSession().getAttribute("userid");

        String questitle = request.getParameter("questitle");
        String questype = request.getParameter("questype");

        String[] checkboxs = request.getParameterValues("queschoise");
        if (checkboxs != null) {
            for (String a : checkboxs) {
                List01.add(request.getParameter(a));
            }

            switch (List01.size()) {
                case 1:
                    saveBean.Save_ques(surveyname, userid, questitle, questype, List01.get(0));
                    break;
                case 2:
                    saveBean.Save_ques(surveyname, userid, questitle, questype, List01.get(0), List01.get(1));
                    break;
                case 3:
                    saveBean.Save_ques(surveyname, userid, questitle, questype, List01.get(0), List01.get(1), List01.get(2));
                    break;
                case 4:
                    saveBean.Save_ques(surveyname, userid, questitle, questype, List01.get(0), List01.get(1), List01.get(2), List01.get(3));
                    break;
            }
        }
        else
            {
            saveBean.Save_ques(surveyname, userid, questitle, questype);
        }

if (request.getParameter("button").equals("next")) {
            request.getRequestDispatcher("management02.jsp").forward(request,response);
        }
        else if (request.getParameter("button").equals("end"))
        {
            Long mills=System.currentTimeMillis();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date=df.format(new Date());
            saveBean.save_total_survey(surveyname,userid,date);
            request.getRequestDispatcher("management.jsp").forward(request,response);
        }
    }
}
