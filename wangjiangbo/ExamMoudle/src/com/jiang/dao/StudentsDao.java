package com.jiang.dao;
import com.jiang.bean.Students;
import java.util.List;

/**
 * Created by dell on 2017/11/23.
 */
public interface StudentsDao extends BaseDao{
    /*查询学生*/
    public List<Students> selectStudentsInfoBySnameAndSpassword(String sname,String spassword);

}
