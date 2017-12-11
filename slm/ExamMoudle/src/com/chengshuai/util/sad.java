package com.chengshuai.util;


import com.chengshuai.bean.*;

import com.chengshuai.dao.Classesdao;
import com.chengshuai.dao.Studentsdao;
import com.chengshuai.dao.Teachersdao;

import com.chengshuai.dao.impl.Classesimpl;
import com.chengshuai.dao.impl.Studentsimpl;
import com.chengshuai.dao.impl.Teachersimpl;
import com.chengshuai.service.Classesservice;
import com.chengshuai.service.Questionbankservice;
import com.chengshuai.service.Studentsservice;
import com.chengshuai.service.Teachersservice;
import com.chengshuai.service.impl.Classesserviceimpl;
import com.chengshuai.service.impl.Questionbankserviceimpl;
import com.chengshuai.service.impl.Studentsserviceimpl;
import com.chengshuai.service.impl.Teachersserviceimpl;

import javax.management.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by slm on 2017/11/23.
 * 测试类
 */
public class sad {

    public static void main(String[] args) {
      /*  Questionbankservice questionbanks = new Questionbankserviceimpl();
        Integer a= questionbanks.QuestionbankAllumber();
        System.out.println(a);*/
   String k = "666.text";
        System.out.println(k.contains("666"));
    }
}
