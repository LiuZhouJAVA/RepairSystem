import cn.itcast.JavaBean.GetBean;
import cn.itcast.JavaBean.SaveBean;
import cn.itcast.JavaBean.SaveBean2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/Servlet03")
public class Servlet03 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");

String userid= (String) request.getSession().getAttribute("createrid");
String surveyname= (String) request.getSession().getAttribute("The_questionnaire_name");

        List<Map<String,Object>> list1=new GetBean().get_radio(surveyname,userid);
        List<Map<String,Object>> list2=new GetBean().get_gap(surveyname,userid);
        SaveBean2 saveBean=new SaveBean2();


        String participatorname=request.getParameter("participatorname");
        saveBean.save_participatename(participatorname,surveyname);


//        saveBean.save_personal_radioques("2","2","2","2","1");
        for (int n=1;n<=list1.size();n++)
        {
            String radio_answer=request.getParameter(n+"queschoise");
            Map<String, Object> objectMap=list1.get(n-1);
            String questitle= (String) objectMap.get("questitle");
           participatorname=request.getParameter("participatorname");


            saveBean.save_personal_radioques(userid,surveyname,participatorname,questitle,radio_answer);
        }
        for (int m=1;m<=list2.size();m++)
        {
            String gap_answer=request.getParameter(m+"answer");
            Map<String, Object> objectMap=list2.get(m-1);
            String questitle= (String) objectMap.get("questitle");
            participatorname=request.getParameter("participatorname");

            saveBean.save_personal_gapques(userid,surveyname,participatorname,questitle,gap_answer);
        }

response.sendRedirect("thanks.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
