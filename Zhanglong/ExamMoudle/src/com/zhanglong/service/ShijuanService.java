package com.zhanglong.service;

import com.zhanglong.bean.Subject;
import com.zhanglong.bean.Testpaper;

import java.util.List;

/**
 * Created by Administrator on 2017/12/9 0009.
 */
public interface ShijuanService {
    //查询试卷所有信息显示到table上
    public List<Testpaper> selectxinxi();
    //查询科目下拉框
    public List<Subject>selectkemuxialakaung();
    //五个条件查询
    public List<Testpaper>selectFivechaxun(Integer suid,String ttype,String tstate);
    //创建试卷
    public void savexinxi(Testpaper testpaper);
}
