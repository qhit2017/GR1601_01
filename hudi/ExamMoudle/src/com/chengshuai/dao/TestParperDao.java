package com.chengshuai.dao;

import com.chengshuai.bean.Testpaper;

/**
 * Created by Administrator on 2017/12/6.
 */
public interface TestParperDao extends  BaseDao {

    public void insertTestPareper(Testpaper testpaper,String[] questionid);

}
