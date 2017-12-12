package com.wangmengyuan.Dao;

import com.wangmengyuan.bean.Students;
import com.wangmengyuan.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4.
 */
public interface loginDao {
    //教师账号密码查询
    public List<Teachers> selecttnameAndTpassword(String tname,String tpassword);
    //学生账号密码查询
    public List<Students> selectsnameAndspassword(String sname,String spassword);

}
