package com.guolonglong.dao;

import com.guolonglong.bean.Students;
import com.guolonglong.bean.Teachers;

import java.util.List;

/**
 * Created by lenovo on 2017/11/30.
 */
public interface PageDao {
    //通过查询Teachers 获取 totalCount
    public List<Teachers> selectTeachersTotalCountList();
    //通过 dataStart + dataEnd 查询Teachers
    public List<Teachers> selectTeachersBydataStartAnddataEnd(Integer dataStart,Integer dataEnd);

}
