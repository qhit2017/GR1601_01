package com.jinmengjie.service.impl;

import com.jinmengjie.bean.Testpaper;
import com.jinmengjie.dao.TestpaperDao;
import com.jinmengjie.dao.impl.TestpaperDaoImpl;
import com.jinmengjie.service.TestpaperService;

import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/8/008.
 */
public class TestpaperServiceImpl implements TestpaperService {
    private TestpaperDao testpaperDao = new TestpaperDaoImpl();
    /*查询所有试卷信息*/
    @Override
    public List<Testpaper> selectAllTestpaperInfo() {
       List<Testpaper> testpapers =  testpaperDao.selectAllTestpaperInfo();
       if (testpapers.size()!=0||testpapers!=null){
           return null;
       }else {
           return testpapers;
       }
            }
}
