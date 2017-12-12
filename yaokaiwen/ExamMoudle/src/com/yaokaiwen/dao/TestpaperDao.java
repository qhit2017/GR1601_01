package com.yaokaiwen.dao;

import com.yaokaiwen.bean.Testpaper;

import java.util.List;

/**
 * Created by DELL on 2017/12/6.
 */
public interface TestpaperDao extends BaseDao {
    //查询试卷
    public List<Testpaper> selecttestpaper(Integer suid,String tstate);
}
