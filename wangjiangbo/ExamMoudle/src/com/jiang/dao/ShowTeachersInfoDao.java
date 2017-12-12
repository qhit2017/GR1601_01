package com.jiang.dao;

import com.jiang.bean.Teachers;

import java.util.List;

/**
 * Created by dell on 2017/11/26.
 */
public interface ShowTeachersInfoDao {
    /*显示老师信息*/
    public List<Teachers> ShowTeachersInfo();
    public Teachers queryTidAppear(Integer tid);
    public Teachers queryByTid(Integer tid);

}
