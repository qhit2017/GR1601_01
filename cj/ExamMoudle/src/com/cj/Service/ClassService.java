package com.cj.Service;

import com.cj.Bean.Classes;

import java.util.Date;
import java.util.List;

/**
 * Created by cj on 2017/12/4.
 */
public interface ClassService {
    /*查询所有*/
    public List<Classes> selectClassAll();
    //根据条件查询
    public List<Classes>sleectMycbeginOrcdirectionOrtidlOrtidh(Date cbegin, String cdirection, Integer tidl, Integer tidh);
    //增加班级
    public boolean inseertClassall(Classes classes);

}
