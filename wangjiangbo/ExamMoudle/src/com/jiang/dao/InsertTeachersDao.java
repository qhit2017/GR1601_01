package com.jiang.dao;
import com.jiang.bean.Teachers;

import java.util.List;
/**
 * Created by dell on 2017/11/26.
 */
public interface InsertTeachersDao extends BaseDao {
     /*查数据库中的tnumber*/
     public List<Teachers> selectTeachersInfo(String tnumber);
     /*检查Teachers表中是有id来判断是否增加或者更新*/
     public Teachers queryTidAppear(Integer tid);
}
