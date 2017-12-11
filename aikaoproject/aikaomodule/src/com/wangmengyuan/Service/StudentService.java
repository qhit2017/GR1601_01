package com.wangmengyuan.Service;

import com.wangmengyuan.bean.Students;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
public interface StudentService {
    //查询学生界面信息
    public List<Students> selectAllStudentsinfo();
    //条件查询
    public List<Students> querystnumber(String snumber,String sname);
}
