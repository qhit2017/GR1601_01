package com.yushaoju.dao;

/**
 * Created by Svip on 2017/11/23.
 */
public interface basic   {
    //添加数据
    public void  insert(Object o);
    //更新数据
    public void  update(Object o);
    //删除数据
    public void  delete(Object o);
    //添加或更新
    public void  insertOrupdate(Object o);

}
