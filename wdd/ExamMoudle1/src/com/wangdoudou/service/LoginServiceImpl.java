package com.wangdoudou.service;

import com.wangdoudou.bean.Students;
import com.wangdoudou.bean.Teachers;
import com.wangdoudou.dao.LoginDao;
import com.wangdoudou.dao.LoginDaoImpl;
import com.wangdoudou.service.LoginService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 王豆豆 on 2017/11/23.
 */
public class LoginServiceImpl implements LoginService {
    private LoginDao dao = new LoginDaoImpl();
    //教师查询
    @Override
    public List<Teachers> selectByUsers(String tname, String tpassword) {
        List<Teachers> teachersList=dao.selectByUsers(tname,tpassword);
        for (Teachers t:teachersList){
            System.out.println("Teachers"+t.getTname());
        }
        return teachersList;
    }
    //学生查询
    @Override
    public List<Students> selectBy(String sname, String spassword) {
         List<Students> studentsList=dao.selectBy(sname,spassword);
         for (Students students:studentsList){
             System.out.println("students"+students.getSname());
         }

        return studentsList;
    }


}
