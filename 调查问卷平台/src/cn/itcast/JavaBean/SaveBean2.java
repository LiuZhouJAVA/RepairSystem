package cn.itcast.JavaBean;

import JDBCUtils.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SaveBean2 {
    public JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    public void save_personal_radioques(String userid, String surveyname, String participatorname, String questitle, String choose)
    {
       /* String URL="jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String name="root";
        String password="liuzhou";

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

        Connection connection= DriverManager.getConnection(URL,name,password);
        String sql="update commodity set sales='"+number+"' where info='"+satffname+"'";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        int count=preparedStatement.executeUpdate();*/

        String sql="insert into personalsurvey(userid,surveyname,participatorname,questitle,choose) values(?,?,?,?,?) ";
        template.update(sql,userid,surveyname,participatorname,questitle,choose);
    }
    public void save_personal_gapques(String userid,String surveyname,String participatorname,String questitle,String gap)
    {
        String sql="insert into personalsurvey(userid,surveyname,participatorname,questitle,gap) values(?,?,?,?,?) ";
        template.update(sql,userid,surveyname,participatorname,questitle,gap);
    }
    public void save_participatename(String participatorname,String surveyname) {
        String sql="insert into participate values(?,?)";
        template.update(sql,participatorname,surveyname);
    }
}
