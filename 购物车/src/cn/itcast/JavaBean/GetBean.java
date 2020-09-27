package cn.itcast.JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class GetBean {
    public GetBean() {
    }

    public  List<MerchandiseBean> getinfo() {
        String URL = "jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String USERNAME = "root";
        String USERPASS = "liuzhou";
        Connection connection = null;
        Statement statement = null;
        ResultSet set = null;
        List<MerchandiseBean> list1=new ArrayList<MerchandiseBean>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, USERPASS);
            statement = connection.createStatement();
            String sql = "select * from commodity;";
            set = statement.executeQuery(sql);
            while (set.next()) {
                int id = set.getInt(1);
                String location = set.getString(2);
                String inf = set.getString(3);
                String price = set.getString(4);
                MerchandiseBean merchandiseBean = new MerchandiseBean();
                merchandiseBean.setId(id);
                merchandiseBean.setLocation(location);
                merchandiseBean.setInf(inf);
                merchandiseBean.setPrice(price);
                list1.add(merchandiseBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list1;
    }
    public  List<MerchandiseBean> getdifferentdypestaffs(String type) {
        String URL = "jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String USERNAME = "root";
        String USERPASS = "liuzhou";
        Connection connection = null;
        Statement statement = null;
        ResultSet set = null;
        List<MerchandiseBean> list1=new ArrayList<MerchandiseBean>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, USERPASS);
            statement = connection.createStatement();
            String sql = "select * from commodity where class='"+type+"';";
            set = statement.executeQuery(sql);
            while (set.next()) {
                int id = set.getInt(1);
                String location = set.getString(2);
                String inf = set.getString(3);
                String price = set.getString(4);
                MerchandiseBean merchandiseBean = new MerchandiseBean();
                merchandiseBean.setId(id);
                merchandiseBean.setLocation(location);
                merchandiseBean.setInf(inf);
                merchandiseBean.setPrice(price);
                list1.add(merchandiseBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list1;
    }

    public  List<MerchandiseBean> search(String staffname) {
        String URL = "jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String USERNAME = "root";
        String USERPASS = "liuzhou";
        Connection connection = null;
        Statement statement = null;
        ResultSet set = null;
        List<MerchandiseBean> list1=new ArrayList<MerchandiseBean>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, USERPASS);
            statement = connection.createStatement();
            String sql = "select * from commodity where info like '%"+staffname+"%';";
            set = statement.executeQuery(sql);
            while (set.next()) {
                int id = set.getInt(1);
                String location = set.getString(2);
                String inf = set.getString(3);
                String price = set.getString(4);
//                String sales=set.getString(6);
                MerchandiseBean merchandiseBean = new MerchandiseBean();
                merchandiseBean.setId(id);
                merchandiseBean.setLocation(location);
                merchandiseBean.setInf(inf);
                merchandiseBean.setPrice(price);
//                merchandiseBean.setSales(sales);
                list1.add(merchandiseBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list1;
    }
    public  List<MerchandiseBean> gethotsell() {
        String URL = "jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String USERNAME = "root";
        String USERPASS = "liuzhou";
        Connection connection = null;
        Statement statement = null;
        ResultSet set = null;
        List<MerchandiseBean> list1=new ArrayList<MerchandiseBean>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, USERPASS);
            statement = connection.createStatement();
            String sql = "select * from commodity order by sales DESC";
            set = statement.executeQuery(sql);
            while (set.next()) {
                int id = set.getInt(1);
                String location = set.getString(2);
                String inf = set.getString(3);
                String price = set.getString(4);
//                String sales=set.getString(6);
                MerchandiseBean merchandiseBean = new MerchandiseBean();
                merchandiseBean.setId(id);
                merchandiseBean.setLocation(location);
                merchandiseBean.setInf(inf);
                merchandiseBean.setPrice(price);
//                merchandiseBean.setSales(sales);
                list1.add(merchandiseBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list1;
    }

    public  List<indentBean> getindentrecord(String userid) {
        String URL = "jdbc:mysql://localhost:3306/new_schema?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String USERNAME = "root";
        String USERPASS = "liuzhou";
        Connection connection = null;
        Statement statement = null;
        ResultSet set = null;
        List<indentBean> list1=new ArrayList<indentBean>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, USERPASS);
            statement = connection.createStatement();
            String sql = "select * from indent where userid='"+userid+"'";
            set = statement.executeQuery(sql);
            while (set.next()) {
                String indentid = set.getString(1);
                String user = set.getString(2);
                String date = set.getString(3);
//                String sales=set.getString(6);
                indentBean indentBean=new indentBean();
                indentBean.setIndentid(indentid);;
                indentBean.setUserid(user);
                indentBean.setDate(date);
//                merchandiseBean.setSales(sales);
                list1.add(indentBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list1;
    }
}

