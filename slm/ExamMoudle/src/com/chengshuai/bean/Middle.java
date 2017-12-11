package com.chengshuai.bean;

import java.io.Serializable;

/**
 * Created by 晏利花 on 2017/11/22.
 */
public class Middle implements Serializable {
    /*主键id*/
    private Integer mid;
    /*题库外键*/
    private Integer qid;
    /*试卷外键*/
    private Integer tid;
}
