package com.wangyinghao.dao;

/**
 * Created by 王英豪 on 2017/11/8.
 */
public interface BaseDao {
     //添加数据
    public void  insert(Object o);
    //更新数据
    public void  update(Object o);
    //删除数据
    public void  delete(Object o);
    //添加或更新
    public void  insertOrupdate(Object o);

}
