package com.chengshuai.bean;

import java.io.Serializable;
import java.util.Calendar;

/**
 * Created by 孙磊 on 2017/11/22.
 */
public class Grade implements Serializable {
    /*成绩id*/
    private Integer gid;
    /*分数*/
    private Integer gscore;
    /*学生答案*/
    private String ganswer;
    /*结束时间*/
    private Calendar gendtime;
//====================================外键============================================
    /*学生外键
    private Integer sid;*/
    //多个成绩对应一个学生
    private Students students;
    /*试卷外键
    private Integer tid;*/
    //一个成绩对应一张试卷
    private Testpaper testpaper;



}
