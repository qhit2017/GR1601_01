package com.jiang.service;

import com.jiang.bean.Teachers;
import com.jiang.dao.SelectTeachersInfoDao;
import com.jiang.dao.SelectTeachersInfoDaoImpl;

import java.util.List;

/**
 * Created by dell on 2017/11/26.
 */
public class SelectTeachersInfoServiceImpl implements SelectTeachersInfoService {
    @Override
    public List<Teachers> selectTeachersByTnumberOrTnameOrTjob(String tnumber, String tname,Integer tjob) {
        SelectTeachersInfoDao selectTeachersInfoDao = new SelectTeachersInfoDaoImpl();
        return selectTeachersInfoDao.selectTeachersByTnumberOrTnameOrTjob(tnumber,tname,tjob);
    }
}
