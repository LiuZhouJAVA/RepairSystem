package cn.itcast.JavaBean;

import JDBCUtils.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class LoginBean {
    public LoginBean()
    {

    }

    public int Login(String name,String password)
    {
        String URL="jdbc:mysql://localhost:3306/pro_maintenance?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String USERNAME="root";
        String USERPASS="liuzhou";
        Connection connection=null;
        Statement statement=null;
        ResultSet set=null;

        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection(URL,USERNAME,USERPASS);
            statement=connection.createStatement();
            String sql="select count(*) from id where user ='"+name+"'and password='"+password+"'";
            set= statement.executeQuery(sql);
            int count=-1;
            if(set.next())
            {
                count=set.getInt(1);
            }
            return count;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return -1;
        }
//        return i;

    }
}
