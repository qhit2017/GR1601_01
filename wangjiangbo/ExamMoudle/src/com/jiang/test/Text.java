package com.jiang.test;
import com.jiang.bean.Teachers;
import com.jiang.dao.SelectTeachersInfoDao;
import com.jiang.dao.SelectTeachersInfoDaoImpl;

import java.util.List;

/**
 * Created by dell on 2017/11/26.
 */
public class Text {
    public static void main(String[] args) {
        SelectTeachersInfoDao selectTeachersInfoDao = new SelectTeachersInfoDaoImpl();
        List<Teachers> teachersList = selectTeachersInfoDao.selectTeachersByTnumberOrTnameOrTjob("t1",null,null);
        for (Teachers t:teachersList){
            System.out.println(t.getTname());
            System.out.println(t.getTnumber());
            System.out.println(t.getTjob());
        }
    }
}
