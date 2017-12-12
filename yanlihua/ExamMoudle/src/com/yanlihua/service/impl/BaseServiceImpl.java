package com.yanlihua.service.impl;

import com.yanlihua.dao.BaseDao;
import com.yanlihua.dao.impl.BaseDaoImpl;
import com.yanlihua.service.BaseService;

/**
 * Created by 晏利花 on 2017/11/26.
 */
public class BaseServiceImpl implements BaseService {
    private BaseDao baseService=new BaseDaoImpl();
    @Override
    public void deleteObjectByIdBaseService(Object object) {
        baseService.deleteObjectByIdBaseDao(object);
        return;
    }
}
