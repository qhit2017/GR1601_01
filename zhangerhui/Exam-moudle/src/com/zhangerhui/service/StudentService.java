package com.zhangerhui.service;

import com.zhangerhui.bean.Students;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23/023.
 */
public interface StudentService {

    public List<Students>selectStudentsBysnameAndspassword(String sname, String spassword);
    public List<Students>selectStudentsallinfo();
    public void saveStudent(Students students);

    //五个条件进行条件查询
    public List<Students> selectfive(String snumber,String sname,String cid,String senter,String smahor);

    //保存或和修改对象中的信息
    public void  update(Students students);

    //根据sid修改信息
    public Students selectStudentInfoBySid(Integer sid);

    //删除学生对象
    public void deleteStudent(Students students);

    //导出学生的所有信息(导入到excel中)
    public String downloadStudentAllInfoService(String path);

    //导入学生信息
    public String importStudentInfos(String path);


}