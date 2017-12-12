package com.zhangerhui.dao;

import com.zhangerhui.bean.Teachers;
import java.util.List;

/**
 * Created by Administrator on 2017/11/23/023.
 */
public interface TeacherDao extends BaseDao{

    //根据tname 和 tpassword 查询Teachers表，
    public List<Teachers>queryTeachersBytnameandtpassword(String tname, String tpassword);
    //查询Teachers表，显示所有信息
    public List<Teachers>queryTeachersallinfo();
    //根据tnumber 或 tname 或 tjob 查询Teachers表，
    public List<Teachers> queryThreeTeachers(String tnumber,String tname,Integer tjob);
    //教师的增加和修改
    public void saveOrUpdateTeachersInfo(Teachers teachers);

    public List<Teachers>queryTeachersLikeTnumber(String tnumber);

    public List<Teachers>queryTeachersByTnumber(String tnumber);

    public Teachers queryTeachersByTid(Integer tid);

}
