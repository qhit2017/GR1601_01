package com.chengshuai.service;

import com.chengshuai.bean.users;
import com.chengshuai.dao.LoginDao;
import com.chengshuai.dao.LoginDaoImpl;

import java.util.List;

/**
 * Created by king on 12/5/2017.
 */
public class LoginServiceImpl implements LoginService {
    @Override
    public List<users> SelectAllbyUnameAndUpassword(String uname, String upassword) {
        LoginDao dao = new LoginDaoImpl();
        return  dao.SelectAllbyUnameAndUpasswordDao(uname,upassword);
    }
}
