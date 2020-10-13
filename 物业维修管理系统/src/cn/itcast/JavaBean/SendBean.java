package cn.itcast.JavaBean;

import JDBCUtils.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

public class SendBean {
    public JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    public void Send_mybill(String userid,String classify,String address,String state,String time)
    {
        String sql="insert into pro_maintenance.repair(userid,classify,address,state, time,statu) values('"+userid+"','"+classify+"','"+address+"','"+state+"','"+time+"','未处理')";
        template.update(sql);
    }

    public void Send_mybill(String userid,String userpass,String tel)
    {
        String sql="insert into pro_maintenance.id(user,password,tel) values('"+userid+"','"+userpass+"','"+tel+"')";
        template.update(sql);
    }

    public void CHANGE(String statu,String state,String userid,String time)
    {
        String sql="update pro_maintenance.repair set statu='"+statu+"', callback='"+state+"' where userid='"+userid+"' and time='"+time+"'";
        template.update(sql);
    }


}
