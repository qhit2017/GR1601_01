package com.jiang.test;

import com.jiang.bean.Teachers;
import com.jiang.dao.*;
import com.jiang.service.InsertTeachersInfoService;
import com.jiang.service.InsertTeachersInfoServiceImpl;

/**
 * Created by dell on 2017/11/28.
 */
public class test1 {
    public static void main(String[] args) {
     /*   InsertTeachersDao insertTeachersDao = new InsertTeachersDaoImpl();

       Teachers teachers = insertTeachersDao.queryTidAppear(1);
        System.out.println(teachers.equals(null));
       *//*teachers.setTphone("65265111");
        System.out.println(teachers.getTphone());
       insertTeachersDao.update(teachers);*/
        ShowTeachersInfoDao dao=new ShowTeachersInfoDaoImpl();

        dao.queryTidAppear(1);
        System.out.println();

    }
}
