package com.wangmengyuan.Service;

import com.wangmengyuan.Dao.loginDao;
import com.wangmengyuan.Dao.loginDaoImpl;
import com.wangmengyuan.bean.Students;
import com.wangmengyuan.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4.
 */
public class loginServiceImpl implements loginService {
    private loginDao loginDao = new loginDaoImpl();
    @Override
    public List<Teachers> querynameAndpassword(String tname, String tpassword) {
        List<Teachers> teachersList= loginDao.selecttnameAndTpassword(tname,tpassword);
        for (Teachers t:teachersList){
            System.out.println("Teachers"+t.getTname());
        }
        return teachersList;
    }

    @Override
    public List<Students> querysnameAndspassword(String sname, String spassword) {
        List<Students> studentsList= loginDao.selectsnameAndspassword(sname,spassword);
        for (Students s:studentsList){
            System.out.println("Students"+s.getSname());
        }
        return studentsList;
    }
}
