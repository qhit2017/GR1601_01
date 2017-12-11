package com.chengshuai.service;

import com.chengshuai.bean.Teachers;
import com.chengshuai.dao.TeachersDao;
import com.chengshuai.dao.TeachersDaoImpl;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

 /**
 * Created by Administrator on 2017/11/23.
 */
public class TeacherServiceImpl implements TeacherService {
    private TeachersDao teachersDao = new TeachersDaoImpl();

    @Override
    public List<Teachers> queryTeacherList() {
        return teachersDao.selectAllTeacher();
    }

    @Override
    public Teachers queryTeacherNumber() {

        //当前日期 yyyyMMdd
        Date date =new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        String strDate = simpleDateFormat.format(date);

        //根据当前日期  查询新的账号 yyyyMMddXX0
       String nowTnumber ="";
       List<Teachers> teachers= teachersDao.selectTeacherLikeTnumber(strDate+ "___");
       if(teachers==null || teachers.size()==0){
           nowTnumber = strDate+"001";
       }
       else{
           Integer size = teachers.size();

           Teachers teachers1 = teachers.get(size-1);

           String maxTnumber = teachers1.getTnumber();

           Long lTnumber =Long.parseLong(maxTnumber);

           lTnumber = lTnumber+1;
           nowTnumber = lTnumber.toString();
       }

       //把新查询的账号 ---》保存到teacher
       Teachers teachers1 = new Teachers();

       teachers1.setTnumber(nowTnumber);
       teachersDao.insert(teachers1);
       return teachers1;
    }

    @Override
    public List<Teachers> queryTeachersByTjob0() {
        return teachersDao.selectTeacherByTjob(0);
    }

    @Override
    public List<Teachers> queryTeachersByTjob1() {
        return teachersDao.selectTeacherByTjob(1);
    }

     @Override
     public String downloadTeachers(String path) {
        //调用dao 查询所有数据
         List<Teachers> teachersList= teachersDao.selectAllTeacher();

         //teachersList -- excel
         String filepath = path+"\\"+"teacher.xlsx";

         //HSSFWorkbook
         XSSFWorkbook xssfWorkbook = new XSSFWorkbook();

         //在excel文件里面 创建sheet
         XSSFSheet xssfSheet=xssfWorkbook.createSheet();

         //写一个标题
         XSSFRow xssfRow1= xssfSheet.createRow(0);
         XSSFCell xssfCell3= xssfRow1.createCell(0);
         xssfCell3.setCellType(CellType.STRING);
         xssfCell3.setCellValue("序号");
         XSSFCell xssfCell4= xssfRow1.createCell(1);
         xssfCell4.setCellType(CellType.STRING);
         xssfCell4.setCellValue("姓名");


         for(int i=0;i<teachersList.size();i++){
             //在sheet 创建 row
             XSSFRow xssfRow= xssfSheet.createRow(i+1);
             Teachers t =teachersList.get(i);

             XSSFCell xssfCell1= xssfRow.createCell(0);
             xssfCell1.setCellType(CellType.NUMERIC);
             xssfCell1.setCellValue(t.getTid());


             XSSFCell xssfCell2= xssfRow.createCell(1);
             xssfCell2.setCellType(CellType.STRING);
             xssfCell2.setCellValue(t.getTname());
         }


         try {
             FileOutputStream fileOutputStream = new FileOutputStream(filepath);
             xssfWorkbook.write(fileOutputStream);
             fileOutputStream.flush();
             fileOutputStream.close();

         } catch (java.io.IOException e) {
             e.printStackTrace();
         }

         return filepath;
     }
 }
