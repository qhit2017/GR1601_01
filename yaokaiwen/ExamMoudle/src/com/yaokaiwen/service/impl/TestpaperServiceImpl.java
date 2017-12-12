package com.yaokaiwen.service.impl;

import com.yaokaiwen.bean.Testpaper;
import com.yaokaiwen.dao.TestpaperDao;
import com.yaokaiwen.dao.impl.TestpaperDaoImpl;
import com.yaokaiwen.service.TestpaperService;

import java.util.List;

/**
 * Created by DELL on 2017/12/6.
 */
public class TestpaperServiceImpl implements TestpaperService {
    private TestpaperDao testpaperDao = new TestpaperDaoImpl();
    @Override
    public List<Testpaper> selectTestpaperSetvice(Integer suid, String tstate) {
        List<Testpaper>testpaperList = testpaperDao.selecttestpaper(suid,tstate);
        if(testpaperList==null||testpaperList.size()<=0){
            return null;
        }else {
            return testpaperList;
        }
    }

    @Override
    public void insertTestpaperService(Testpaper testpaper) {
        testpaperDao.insertOrUpdate(testpaper);
        return;
    }
}
