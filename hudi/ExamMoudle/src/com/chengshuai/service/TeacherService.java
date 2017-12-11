package com.chengshuai.service;

import com.chengshuai.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23.
 */
public interface TeacherService {
   public List<Teachers>  queryTeacherList();

   public Teachers queryTeacherNumber();


   //查询班主任
   public List<Teachers> queryTeachersByTjob0();
   //讲师
   public List<Teachers> queryTeachersByTjob1();


   public String downloadTeachers(String path);

}
