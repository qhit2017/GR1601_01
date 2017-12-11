package com.guolonglong.service;

import com.guolonglong.bean.Teachers;

import java.util.List;

/**
 * Created by lenovo on 2017/11/30.
 */
public interface PageService {
    //通过查询Teachers 获取 totalCount
    public List<Teachers> selectTeachersTotalCountList();
    //通过 dataStart + dataEnd 查询Teachers
    public List<Teachers> selectTeachersBydataStartAnddataEnd(Integer dataStart,Integer dataEnd);
}
