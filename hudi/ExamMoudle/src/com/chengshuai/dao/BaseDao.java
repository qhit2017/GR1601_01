package com.chengshuai.dao;

/**
 * Created by Administrator on 2017/11/8.
 */
public interface BaseDao {

    public void insert(Object o);
    public void update(Object o);
    public void delete(Object o);
    public void insertOrUpdate(Object o);
}
