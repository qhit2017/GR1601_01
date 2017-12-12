package com.chengshuai.service;

import com.chengshuai.bean.Testpaper;

import java.util.List;

/**
 * Created by slm on 2017/12/6.
 *
 * 试卷管理
 */
public interface Testpaperservice {

    /*查询试卷所有数据*/
    public List<Testpaper> QueryTestpaperAll();
}
