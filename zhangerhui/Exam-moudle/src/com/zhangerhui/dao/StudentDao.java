package com.zhangerhui.dao;

import com.zhangerhui.bean.Students;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23/023.
 */
public interface StudentDao extends BaseDao {

    public List<Students> queryStudentsBysnameandspassword(String sname, String spassword);

    public List<Students> queryStudentsallinfo();

    //五个条件进行条件查询
    public List<Students> queryfive(String snumber, String sname, String cid, String senter, String smahor);

    //保存或和修改对象中的信息
    public void saveOrUpdateStudent(Students students);

    //根据sid修改信息
    public Students queryStudentInfoBySid(Integer sid);

    //导入学生信息
    public void importStudentInfodao(List<Students> studentsList);


}
