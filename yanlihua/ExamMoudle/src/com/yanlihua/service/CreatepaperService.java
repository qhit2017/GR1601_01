package com.yanlihua.service;

import com.yanlihua.bean.Testpaper;

/**
 * Created by 晏利花 on 2017/12/6.
 */
public interface CreatepaperService {
    //testpaper添加试卷信息，String[] questionid选中的题组成一个试卷  两个表是多对多的关系   对中间表进行数据添加
    public void insertTestPareperCreatepaperService(Testpaper testpaper, Integer[] questionid);


    //随机组卷需要传三个参数（1.根据条件查询出来的所有题，2,需要的总题数，3，每道题的id）
    public void insertrandomTestPareperCreatepaperService(Testpaper testpaper,
              Integer ojd,Integer oyb,Integer okn,Integer mjd,Integer myb,Integer mkn);
}
