package cn.itcast.JavaBean;

import JDBCUtils.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class GetBean {
    public JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    public List GET_ALLREPARI()
    {
        String sql="select * from repair";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;
    }

    public List GET_ALLREPARI_BYID(String id)
    {
        String sql="select * from repair where userid='"+id+"'";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;
    }

    public List GET_CHOOSEREPAIR(String user,String clssify,String status)
    {
        String sql="SELECT * FROM pro_maintenance.repair where userid='"+user+"' and classify='"+clssify+"' and statu='"+status+"'";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;

    }

    public List GETTEL(String user)
    {
        String sql="SELECT tel FROM pro_maintenance.id where user='"+user+"'";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;
    }


}
