package com.yaokaiwen.dao;

import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Teachers;
import java.util.List;
/**
 * Created by DELL on 2017/11/29.
 */
public interface ClassesDao extends BaseDao {
    //查询班级所有信息
    public List<Classes> selectClassesAll();
    //根据条件询查教师信息
    public List<Classes> selectClassesAllBy(Classes classes,Integer tidl,Integer tidh);
    //根据cid查询
    public Classes selectClassesByCid(Integer cid);
    //查询讲师
    public List<Teachers> selecttidltname();
    //查询班主任
    public List<Teachers> selecttidhtname();
    //查询开班日期
    public List<Classes> selectdistinctcbegin();
    //根据班级名称查询cid
    public Classes selectclassesbyname(String cname);
}
