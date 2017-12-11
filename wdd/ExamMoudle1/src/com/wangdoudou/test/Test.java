package com.wangdoudou.test;

import com.wangdoudou.bean.Classes;
import com.wangdoudou.bean.Students;
import com.wangdoudou.bean.Teachers;
import com.wangdoudou.dao.*;
import com.wangdoudou.service.TeachersService;
import com.wangdoudou.service.TeachersServiceImpl;

import java.util.List;

/**
 * Created by 王豆豆 on 2017/11/24.
 */
public class Test {
    public static void main(String[] args) {
      /*  StudentsDao studentsDao=new StudentsDaoImpl();
        List<Students>list=studentsDao.selectStudentBysnumber("234");
        for (Students s:list){
            System.out.println(s.getSnumber());
        }*/

      /*  LoginDao loginDao=new LoginDaoImpl();
      List<Teachers> list= loginDao.selectByUsers("tom","123");
      for (Teachers t:list){
          System.out.println(t.getTname()+""+t.getTpassword());
      }*/
       /* TeachersDao teachersDao=new TeachersDaoImpl();
        List<Teachers>list=teachersDao.selectTeachersByTnumberAndTname("20181113001","tom","");
        for (Teachers t:list) {
            System.out.println(t.getTnumber()+"  "+t.getTname()+"  "+t.getTjob());
        }*/
        ClassesDao classesDao=new ClassesDaoImpl();
        List<Classes> list=classesDao.selectAllClassesInfo();
        for (Classes c:list){
            System.out.println(c.getCnumber()+""+c.getCname());
        }
    }
}
