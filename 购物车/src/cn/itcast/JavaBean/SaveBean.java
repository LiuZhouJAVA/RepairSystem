package cn.itcast.JavaBean;

import java.sql.*;
import java.util.SplittableRandom;

public class SaveBean {
    public SaveBean()
    {

    }
    public int Save(String userid, String inf, String price,String number) throws Exception {
        String URL="jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String name="root";
        String password="liuzhou";

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

        Connection connection= DriverManager.getConnection(URL,name,password);
        String sql="insert into userstaff values('"+userid+"',"+"'"+inf+"',"+"'"+price+"',"+"'"+number+"'"+")";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        int count=preparedStatement.executeUpdate();
        return  count;

    }
    public int Savesales(String number,String satffname) throws Exception {
        String URL="jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String name="root";
        String password="liuzhou";

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

        Connection connection= DriverManager.getConnection(URL,name,password);
        String sql="update commodity set sales='"+number+"' where info='"+satffname+"'";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        int count=preparedStatement.executeUpdate();
        return  count;

    }
    public int SaveIndent(String indentid, String userid, String indentdate) throws Exception {
        String URL="jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String name="root";
        String password="liuzhou";

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

        Connection connection= DriverManager.getConnection(URL,name,password);
        String sql="Insert into indent values ('"+indentid+"','"+userid+"','"+indentdate+"')";
        PreparedStatement preparedStatement=connection.prepareStatement(sql);
        int count=preparedStatement.executeUpdate();
        return  count;

    }
}

