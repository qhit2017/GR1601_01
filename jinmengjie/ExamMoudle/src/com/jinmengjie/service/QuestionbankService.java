package com.jinmengjie.service;

import com.jinmengjie.bean.Questionbank;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public interface QuestionbankService {
    //根据suid查询所有信息
    public List<Questionbank> selectAllInfoBySuid(Integer suid);

    //添加所有试题
    public void insertOrUpdate(Questionbank questionbank);

    //题库界面的导入功能 （添加方法）
    public void uploadquestioninfo(String path);

}
