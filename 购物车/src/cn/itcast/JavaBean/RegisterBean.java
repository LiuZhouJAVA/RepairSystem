package cn.itcast.JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class RegisterBean {
    public RegisterBean()
    {

    }

    public int Register(String username,String userpassword,String address) throws Exception
    {
        String URL="jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String name="root";
        String password="liuzhou";

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

        Connection connection= DriverManager.getConnection(URL,name,password);
        String sql="insert into new_schema.id values('"+username+"','"+userpassword+"','"+address+"')";
//        String sql="insert into new_schema.id values('"+username+"',"+"'"+userpassword+"'"+"',"+"'"+address+"'"+")";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        int count=preparedStatement.executeUpdate();
        return  count;
    }
}
