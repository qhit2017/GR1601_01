package com.jiang.service;
import com.jiang.bean.Students;
import com.jiang.dao.BaseDao;

import java.util.List;

/**
 * Created by dell on 2017/11/23.
 */
public interface StudentsService {
    /*查询学生*/
    public List<Students> selectStudentsInfoBySnameAndSpassword(String sname, String spassword);


}
