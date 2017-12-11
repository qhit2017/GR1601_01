package com.chengshuai.dao;

import com.chengshuai.bean.users;

import java.util.List;

/**
 * Created by king on 12/5/2017.
 */
public interface LoginDao {
    //登陆的方法
    public List<users> SelectAllbyUnameAndUpasswordDao(String uname, String upassword);
}
