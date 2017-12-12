package com.yaokaiwen.service;

import com.yaokaiwen.bean.Testpaper;

import java.util.List;

/**
 * Created by DELL on 2017/12/6.
 */
public interface TestpaperService {
    //查询试卷
    public List<Testpaper> selectTestpaperSetvice(Integer suid, String tstate);
    //添加试卷
    public void insertTestpaperService(Testpaper testpaper);
}
