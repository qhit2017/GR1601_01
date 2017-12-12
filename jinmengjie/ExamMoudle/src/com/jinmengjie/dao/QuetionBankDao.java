package com.jinmengjie.dao;

import com.jinmengjie.bean.Questionbank;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public interface QuetionBankDao {
    //根据suid查询所有信息
    public List<Questionbank>selectAllInfoBySuid(Integer suid);

    //添加所有试题
    public void insertOrUpdate(Questionbank questionbank);

    //试题添加（导出）
    public void insert(List<Questionbank> questionbankList);
}
