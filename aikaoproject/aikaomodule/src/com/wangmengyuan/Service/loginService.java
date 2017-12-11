package com.wangmengyuan.Service;

import com.wangmengyuan.bean.Students;
import com.wangmengyuan.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4.
 */
public interface loginService {
    //教师账号密码查询
    public List<Teachers> querynameAndpassword(String tname , String tpassword);
    //学生账号密码查询
    public List<Students> querysnameAndspassword(String sname , String spassword);
}
