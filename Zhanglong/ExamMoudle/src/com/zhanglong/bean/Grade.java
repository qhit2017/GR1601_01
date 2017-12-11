package com.zhanglong.bean;

import java.io.Serializable;
import java.util.Calendar;


/**
 * Created by Administrator on 2017/11/23 0023.
 */
public class Grade implements Serializable {
   //成绩id
   private Integer gid;
   //分数
   private Integer gscore;
   //学生答案
   private String ganswer;
   //结束时间
   private String gendtime;
   //====================================外键============================================
    /*学生外键
    private Integer sid;*/
   //多个成绩对应一个学生
   private Students students;
   /*试卷外键
   private Integer tid;*/
   //一个成绩对应一张试卷
   private Testpaper testpaper;

   public Integer getGid() {
      return gid;
   }

   public void setGid(Integer gid) {
      this.gid = gid;
   }

   public Integer getGscore() {
      return gscore;
   }

   public void setGscore(Integer gscore) {
      this.gscore = gscore;
   }

   public String getGanswer() {
      return ganswer;
   }

   public void setGanswer(String ganswer) {
      this.ganswer = ganswer;
   }

   public String getGendtime() {
      return gendtime;
   }

   public void setGendtime(String gendtime) {
      this.gendtime = gendtime;
   }

   public Students getStudents() {
      return students;
   }

   public void setStudents(Students students) {
      this.students = students;
   }

   public Testpaper getTestpaper() {
      return testpaper;
   }

   public void setTestpaper(Testpaper testpaper) {
      this.testpaper = testpaper;
   }
}
