package com.yushaoju.test;

import com.yushaoju.bean.Teachers;
import com.yushaoju.dao.TeachersDao;
import com.yushaoju.dao.impl.TeachersDaoImpl;

import java.util.List;

/**
 * Created by Svip on 2017/11/28.
 */
public class test {
    public static void main(String[] args) {
        TeachersDao teachersDao=new TeachersDaoImpl();
      List<Teachers> teacher = teachersDao.selectTeacherByTnumberOrTnameOrjob("1","1",1);
        for (Teachers t:teacher){
            System.out.println(t.getTname());
        }

    }
}
