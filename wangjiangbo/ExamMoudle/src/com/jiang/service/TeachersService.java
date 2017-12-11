package com.jiang.service;

import com.jiang.bean.Teachers;

import java.util.List;

/**
 * Created by dell on 2017/11/23.
 */
public interface TeachersService {
    /*查询老师*/
    public List<Teachers> selectTeachersInfoByTnameAndTpassword(String tname, String tpassword);
}
