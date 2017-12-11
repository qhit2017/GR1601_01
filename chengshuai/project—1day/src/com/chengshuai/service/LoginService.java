package com.chengshuai.service;

import com.chengshuai.bean.users;

import java.util.List;

/**
 * Created by king on 12/5/2017.
 */
public interface LoginService {

    //登陆的方法
    public List<users> SelectAllbyUnameAndUpassword(String uname,String upassword);
}
