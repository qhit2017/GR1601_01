package com.yanlihua.dao;

import com.yanlihua.bean.Testpaper;

/**
 * Created by 晏利花 on 2017/12/6.
 */
public interface CreatepaperDao {
    //testpaper添加试卷信息，String[] questionid选中的题组成一个试卷  两个表是多对多的关系   对中间表进行数据添加
    public void insertTestPareperCreatepaperDao(Testpaper testpaper, Integer[] questionid);
}
