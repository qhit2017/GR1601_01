package com.guolonglong.service.impl;

import com.guolonglong.bean.Teachers;
import com.guolonglong.dao.PageDao;
import com.guolonglong.dao.impl.PageDaoImpl;
import com.guolonglong.service.PageService;

import java.util.List;

/**
 * Created by lenovo on 2017/11/30.
 */
public class PageServiceImpl implements PageService {
    private PageDao dao = new PageDaoImpl();
    @Override
    public List<Teachers> selectTeachersTotalCountList() {
        return dao.selectTeachersTotalCountList();
    }

    @Override
    public List<Teachers> selectTeachersBydataStartAnddataEnd(Integer dataStart, Integer dataEnd) {
        return dao.selectTeachersBydataStartAnddataEnd(dataStart,dataEnd);
    }
}
