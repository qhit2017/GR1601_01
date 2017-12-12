package com.yanlihua.service.impl;

import com.yanlihua.bean.Students;
import com.yanlihua.bean.Testpaper;
import com.yanlihua.dao.OnelinetestDao;
import com.yanlihua.dao.impl.OnelinetestDaoImpl;
import com.yanlihua.service.OnelinetestService;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/9.
 */
public class OnelinetestServiceImpl implements OnelinetestService {
    private OnelinetestDao onelinetestDao=new OnelinetestDaoImpl();
    @Override
    public Students selectStudentInfoOnelinetestService(String sname) {
        return onelinetestDao.selectStudentInfoOnelinetestDao(sname);
    }

    @Override
    public List<Testpaper> selectTestpaperInfoOnelinetestService(String cname) {
        return onelinetestDao.selectTestpaperInfolinetestDao(cname);
    }

    @Override
    public Testpaper selectTestpaperInfoByTidOnelinetestService(Integer tid) {
        return onelinetestDao.selectTestpaperInfoByTidOnelinetestDao(tid);
    }
}
