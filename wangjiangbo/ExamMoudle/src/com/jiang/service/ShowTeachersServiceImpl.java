package com.jiang.service;

import com.jiang.bean.Teachers;
import com.jiang.dao.ShowTeachersInfoDao;
import com.jiang.dao.ShowTeachersInfoDaoImpl;

import java.util.List;

/**
 * Created by dell on 2017/11/26.
 */
public class ShowTeachersServiceImpl implements ShowTeachersService {
    @Override
    public List<Teachers> ShowTeachersInfo() {
        ShowTeachersInfoDao showTeachersInfoDao = new ShowTeachersInfoDaoImpl();
        return showTeachersInfoDao.ShowTeachersInfo();
    }

    @Override
    public Teachers queryTidAppear(Integer tid) {
        ShowTeachersInfoDao showTeachersInfoDao = new ShowTeachersInfoDaoImpl();
        Teachers teachers=showTeachersInfoDao.queryTidAppear(tid);
        if (teachers==null){
            return null;
        }else {
            return teachers;
        }


    }

    @Override
    public Teachers queryByTid(Integer tid) {
        ShowTeachersInfoDao showTeachersInfoDao = new ShowTeachersInfoDaoImpl();
        return showTeachersInfoDao.queryByTid(tid);
    }
}
