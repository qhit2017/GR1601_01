package com.zhanglong.dao;

import com.zhanglong.bean.Classes;
import com.zhanglong.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/11/29 0029.
 */
public interface ClassesDao extends BaseDao {
    //查询班级里所有信息
    public List<Classes>selectAllClassInfo();
    //根据岗位查询教师信息
    public List<Teachers> selectTeacherBytjobjiangshi(Integer tjob);

    //根据岗位查询班主任信息
    public List<Teachers> selectTeacherBytjobbanzhuren(Integer tjob);
    //四个条件的班级查询
    public List<Classes> selectChaxun(String cbegin, String cdirection, String tidl, String tidh);
    //新加班级信息save
    public void saveOrUpdateClasses(Classes classes);
    //根据ID查询编辑显示页面
    public Classes selectClassById(Integer cid);

}
