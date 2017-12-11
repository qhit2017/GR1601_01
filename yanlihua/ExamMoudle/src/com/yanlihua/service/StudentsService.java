package com.yanlihua.service;

import com.yanlihua.bean.Students;


import java.util.List;

/**
 * Created by 晏利花 on 2017/11/29.
 */
public interface StudentsService {
    //查询学生的所有信息
    public List<Students> selectStudentAllInfoStudentsService();

    //五个条件进行条件查询
    public List<Students> selectStudentInfoFiveConditionStudentService(String snumber,String sname,String cid,String senter,String smahor);

    //保存或和修改对象中的信息
    public void  saveOrUpdateStudentInfoStudentsService(Students students);

    //根据sid修改信息
    public Students selectStudentInfoBySidStudentsService(Integer sid);

    //删除学生对象
    public void deleteStudentObjectStudentService(Students students);

    //导出学生的所有信息(导入到excel中)
    public String downloadStudentAllInfoService(String path);

    //导入学生信息
    public String importStudentInfoService(String path);


}
