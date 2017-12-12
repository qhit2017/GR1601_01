package com.zhanglong.service.impl;

import com.zhanglong.bean.Students;
import com.zhanglong.bean.Teachers;
import com.zhanglong.dao.LoginDao;
import com.zhanglong.dao.impl.LoginDaoImpl;
import com.zhanglong.service.LoginService;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23 0023.
 */
public class LoginServiceImpl implements LoginService {

    @Override
    public List<Teachers> selectBytnameandtpassword(String tname, String tpassword) {
        LoginDao dao = new LoginDaoImpl();
        List<Teachers> teacherlist1 = dao.selectBytnameandtpassword(tname, tpassword);
        if (teacherlist1.size() == 0 || teacherlist1 == null) {
            return null;
        } else {
            return teacherlist1;

        }
    }

    @Override
    public List<Students> selectBysnameandspassword(String sname, String spassword) {
        LoginDao dao = new LoginDaoImpl();
       return dao.selectBysnameandspassword(sname, spassword);
    }
}