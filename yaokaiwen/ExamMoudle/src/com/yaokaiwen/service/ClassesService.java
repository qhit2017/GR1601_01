package com.yaokaiwen.service;

import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Teachers;

import java.util.List;

/**
 * Created by DELL on 2017/11/29.
 */
public interface ClassesService {
    //查询班级所有信息
    public List<Classes> selectClassesAllService();
    //根据条件询查教师信息
    public List<Classes> selectClassesAllByService(Classes classes,Integer tidl,Integer tidh);
    //根据tid查询
    public Classes selectClassesByCidService(Integer cid);
    //查询讲师
    public List<Teachers> selecttidltname();
    //查询班主任
    public List<Teachers> selecttidhtname();
    //查询开班日期
    public List<Classes> selectdistinctcbeginService();
    //添加或修改数据
    public void insertorupdateService(Classes classes);
}
