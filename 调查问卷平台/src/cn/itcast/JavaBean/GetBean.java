package cn.itcast.JavaBean;

import JDBCUtils.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class GetBean {
    public JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    public List get_totalsurvey()
    {
        String sql="select * from allsurvey";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;
    }

    public List get_specialsurvey(String userid)
    {
        String sql="select * from allsurvey where userid='"+userid+"'";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;
    }

    public List get_ques(String surveyname,String userid)
    {
        String sql="select * from ques where surveyname='"+surveyname+"'and userid='"+userid+"'";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;
    }

    public List get_radio(String surveyname,String userid)
    {
        String sql="select * from ques where surveyname='"+surveyname+"'and userid='"+userid+"'and questype='单选'";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;
    }
    public List get_gap(String surveyname,String userid)
    {
        String sql="select * from ques where surveyname='"+surveyname+"'and userid='"+userid+"'and questype='填空'";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;
    }

    public List get_personal(String userid)
    {
        String sql="select * from personalsurvey where userid='"+userid+"'";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;
    }

    public List get_participatename()
    {
        String sql="select * from participate";
        List<Map<String,Object>> list=template.queryForList(sql);
        return list;
    }

}
