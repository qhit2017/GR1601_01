package com.jiang.service;
import com.jiang.bean.Teachers;
import com.jiang.dao.BaseDao;

import java.util.List;
/**
 * Created by dell on 2017/11/26.
 */
public interface InsertTeachersInfoService extends BaseDao {
    /*查数据库中的tnumber*/
    public Teachers selectTeachersInfo();
    /*检查Teachers表中是有id来判断是否增加或者更新*/
    public Teachers queryTidAppear(Integer tid);
    /*确定  更新teachers信息*/
    public Teachers updateInsertTeachers(Teachers teachers);
    /*删除  点击取消*/
    public boolean delectTeachers(Teachers teachers);
}
