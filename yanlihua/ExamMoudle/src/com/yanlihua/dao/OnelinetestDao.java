package com.yanlihua.dao;

import com.yanlihua.bean.Students;
import com.yanlihua.bean.Testpaper;
import org.junit.Test;

import java.util.List;

/**
 * Created by 晏利花 on 2017/12/9.
 */
public interface OnelinetestDao {
    //学生查询相关信息(关键是要班级number)
    public Students selectStudentInfoOnelinetestDao(String sname);
    //通过上面的班级number查询testpaper中的相关信息
    public List<Testpaper> selectTestpaperInfolinetestDao(String cname);
    //根据Tid查询Testpaper相关信息
    public Testpaper selectTestpaperInfoByTidOnelinetestDao(Integer tid);
}
