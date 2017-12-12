package com.jinmengjie.dao;

import com.jinmengjie.bean.Testpaper;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/8/008.
 */
public interface TestpaperDao {
    //查询所有试卷信息
    public List<Testpaper>selectAllTestpaperInfo();
}
