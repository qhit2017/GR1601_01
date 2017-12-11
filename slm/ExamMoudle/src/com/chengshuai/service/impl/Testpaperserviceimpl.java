package com.chengshuai.service.impl;

import com.chengshuai.bean.Testpaper;
import com.chengshuai.dao.Testpaperdao;
import com.chengshuai.dao.impl.Testpaperimpl;
import com.chengshuai.service.Testpaperservice;

import java.util.List;

/**
 * Created by slm on 2017/12/6.
 */
public class Testpaperserviceimpl implements Testpaperservice {
    private Testpaperdao testpaperdao = new Testpaperimpl();
    @Override
    public List<Testpaper> QueryTestpaperAll() {
        return testpaperdao.QueryTestpaperAll();
    }
}
