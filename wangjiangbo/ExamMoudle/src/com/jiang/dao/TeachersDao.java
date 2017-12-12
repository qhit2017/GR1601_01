package com.jiang.dao;
import com.jiang.bean.Teachers;
import java.util.List;
/**
 * Created by dell on 2017/11/23.
 */
public interface TeachersDao {
    /*查询老师*/
    public List<Teachers> selectTeachersInfoByTnameAndTpassword(String tname, String tpassword);
}
