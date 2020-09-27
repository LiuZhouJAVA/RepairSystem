package cn.itcast.JavaBean;

import JDBCUtils.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

public class SaveBean {

    public JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    public void Save_ques(String survey_name, String userid, String questitle, String questype) {
        String sql = "insert into ques(surveyname,userid,questitle,questype,number) values(?,?,?,?,?)";
        template.update(sql, survey_name, userid, questitle, questype,0);
    }

    public void Save_ques(String survey_name, String userid, String questitle, String questype, String queschoiseA) {
        String sql = "insert into ques(surveyname,userid,questitle,questype，queschoise1,number) values(?,?,?,?,?,?)";
        template.update(sql, survey_name, userid, questitle, questype, queschoiseA,1);
    }

    public void Save_ques(String survey_name, String userid, String questitle, String questype, String queschoiseA, String queschoiseB) {
        String sql = "insert into ques(surveyname,userid,questitle,questype,queschoise1,queschoise2,number) values(?,?,?,?,?,?,?)";
        template.update(sql, survey_name, userid, questitle, questype, queschoiseA, queschoiseB,2);
    }

    public void Save_ques(String survey_name, String userid, String questitle, String questype, String queschoiseA, String queschoiseB, String queschoiseC) {
        String sql = "insert into ques(surveyname,userid,questitle,questype,queschoise1,queschoise2,queschoise3,number) values(?,?,?,?,?,?,?,?)";
        template.update(sql, survey_name, userid, questitle, questype, queschoiseA, queschoiseB, queschoiseC,3);
    }

    public void Save_ques(String survey_name, String userid, String questitle, String questype, String queschoiseA, String queschoiseB, String queschoiseC, String queschoiseD) {
        String sql = "insert into ques(surveyname,userid,questitle,questype,queschoise1,queschoise2,queschoise3,queschoise4,number) values(?,?,?,?,?,?,?,?,?)";
        template.update(sql, survey_name, userid, questitle, questype, queschoiseA, queschoiseB, queschoiseC, queschoiseD,4);
    }

    public void save_total_survey(String surveyname,String userid,String surveydate)
    {
        String sql="insert into allsurvey values(?,?,?)";
        template.update(sql,surveyname,userid,surveydate);
    }



}
