package com.zhanglong.service.impl;

import com.zhanglong.bean.Subject;
import com.zhanglong.bean.Testpaper;
import com.zhanglong.dao.ShijuanDao;
import com.zhanglong.dao.impl.ShijuanDaoImpl;
import com.zhanglong.service.ShijuanService;

import java.util.List;

/**
 * Created by Administrator on 2017/12/9 0009.
 */
public class ShijuanServiceImpl implements ShijuanService {
    private ShijuanDao dao=new ShijuanDaoImpl();
    @Override
    public List<Testpaper> selectxinxi() {
        return dao.selectxinxi();
    }

    @Override
    public List<Subject> selectkemuxialakaung() {
       return dao.selectkemuxialakaung();
    }

    @Override
    public List<Testpaper> selectFivechaxun(Integer suid, String ttype, String tstate) {
        return dao.selectFivechaxun(suid,ttype,tstate);
    }

    @Override
    public void savexinxi(Testpaper testpaper) {
      dao.savexinxi(testpaper);
      return;
    }
}
