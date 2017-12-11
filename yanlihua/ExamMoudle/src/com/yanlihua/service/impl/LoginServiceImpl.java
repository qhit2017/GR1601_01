package com.yanlihua.service.impl;

import com.yanlihua.bean.Students;
import com.yanlihua.bean.Teachers;
import com.yanlihua.dao.LoginDao;
import com.yanlihua.dao.impl.LoginDaoImpl;
import com.yanlihua.service.LoginService;

import java.util.List;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public class LoginServiceImpl implements LoginService {
    private LoginDao loginDao=new LoginDaoImpl();
    @Override
    public List<Teachers> selectTeachersLoginInfoBynamepwdroleLoginService(String tnumber, String tpassword) {
        List<Teachers> teachersList=loginDao.selectTeachersLoginInfoBynamepwdroleLoginDao(tnumber,tpassword);
        if (teachersList.size()==0||teachersList==null){
            return null;
        }
       else {
            return teachersList;
        }
    }

    @Override
    public List<Students> selectStudentsLoginInfoBynamepwdroleLoginService(String snumber, String spassword) {
        List<Students> studentsList=loginDao.selectStudentsLoginInfoBynamepwdroleLoginDao(snumber,spassword);
        if (studentsList.size()==0||studentsList==null){
            return null;
        }
        else {
            return studentsList;
        }
    }
}
