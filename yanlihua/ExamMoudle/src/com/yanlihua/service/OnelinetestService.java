package com.yanlihua.service;

import com.yanlihua.bean.Students;
import com.yanlihua.bean.Testpaper;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/9.
 */
public interface OnelinetestService {
    //学生查询相关信息(关键是要班级number)
    public Students selectStudentInfoOnelinetestService(String sname);
    //通过上面的班级number查询testpaper中的相关信息
    public List<Testpaper> selectTestpaperInfoOnelinetestService(String cname);
    //根据Tid查询Testpaper相关信息
    public Testpaper selectTestpaperInfoByTidOnelinetestService(Integer tid);
}
