package com.zhanglong.service;

import com.zhanglong.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/11/26 0026.
 */
public interface TeacherService {
    //查询所有教师信息 显示表数据
    public List<Teachers> queryteacherlist();
    //根据账号 教师姓名 管理员查询
    public List<Teachers> queryteacherByTnumberTnameTrole(String tnumber, String tname, Integer tjob);
    //添加信息
    public void SaveOrUpdate(Teachers teachers);
    //根据ID进行查询
    public Teachers SelectTeachersByTid(Integer tid);
    //查询是否有number
    public Teachers queryTeacherNumber();
    //根据id进行删除
    public void deleteTeacherById(Teachers teachers);

    public Teachers selectTeacherBytid(Integer tid);

}
