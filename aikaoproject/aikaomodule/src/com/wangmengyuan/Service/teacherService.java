package com.wangmengyuan.Service;

import com.wangmengyuan.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4.
 */
public interface teacherService {
    //教师查询
    public List<Teachers> querylist();
    //添加数据
    public void insertTeachers(Teachers teachers);
    //根据条件查询
    public List<Teachers> selecttnumberOrtnameOrtjob(String tnumber,String tname,String tjob);
    //根据账号模糊查询
    public Teachers selectTeachersLike();
    //根据id查询信息
    public Teachers selectByTid(Teachers teachers);
    //修改密码
    public void updateTeachersByTid(Teachers teachers);
    //删除
    public void deleteTeachersByTid(Teachers teachers);

    //
    public List<Teachers> selectTjob0();

}
