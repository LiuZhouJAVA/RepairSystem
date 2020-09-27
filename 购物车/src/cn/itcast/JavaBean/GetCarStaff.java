package cn.itcast.JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class GetCarStaff {
    public GetCarStaff()
    {

    }
    public List<MerchandiseBean02> getcar(String userid) throws Exception {
        String URL="jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String USERNAME="root";
        String USERPASS="liuzhou";
        Connection connection=null;
        Statement statement=null;
        ResultSet set1=null;
        List<MerchandiseBean02> list=new ArrayList();

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection(URL,USERNAME,USERPASS);
            statement=connection.createStatement();
                String sql1="select * from userstaff where userid='"+userid+"'";
                set1=statement.executeQuery(sql1);
                while (set1.next())
                {
                    String inf=set1.getString(2);
                    String price=set1.getString(3);
                    String number=set1.getString(4);
                    MerchandiseBean02 m02=new MerchandiseBean02();
                    m02.setInf(inf);
                    m02.setPrice(price);
                    m02.setNumber(number);
                    list.add(m02);
                }
                return list;

    }
    public void DeleteCarStaff(String userid,String info,String price) throws Exception {
        String URL="jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String USERNAME="root";
        String USERPASS="liuzhou";
        Connection connection=null;
        Statement statement=null;
        ResultSet set1=null;
//        List<MerchandiseBean02> list=new ArrayList();

        Class.forName("com.mysql.cj.jdbc.Driver");
        connection= DriverManager.getConnection(URL,USERNAME,USERPASS);
        statement=connection.createStatement();
        String sql1="delete from userstaff where userid='"+userid+"' and "+"inf='"+info+"' and "+"price='"+price+"'";
        statement.executeUpdate(sql1);
    }
}
