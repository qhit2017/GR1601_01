package com.jinmengjie.dao;

import com.jinmengjie.bean.Classes;
import com.jinmengjie.bean.Students;

import java.util.List;


/**
 * Created by 金梦杰 on 2017/11/23/023.
 */
public interface StudentDao {
    //实现登陆功能（查询students表）
    public Students selectstudents(Students students);

    //查询学生的所有信息并显示到主界面
    public List<Students> selectAllStudentInfo();

    //根据学号，姓名，班级，入学年份，就读方向查询(studydirection)
    public  List<Students>selectSutdentInfoBysnumberOrsnameOrsenterOrcid(String snumber,String sname,Integer cid, String senter,String studydirection);

    //主界面中的编辑学生信息(根据ID做查询)
    public  Students selectStudentInfoBySid(Integer sid);

    //保存或修改学生的信息
    public void saveOrupdateStudentInfo(Students students);

    //删除学生对象
    public void deleteStudentObject(Students students);

    //学生界面的模板上传功能（添加方法）
    public void insert(List<Students> studentsList);




}
