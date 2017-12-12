package com.wangdoudou.service;

import com.wangdoudou.bean.Teachers;
import com.wangdoudou.dao.TeachersDao;
import com.wangdoudou.dao.TeachersDaoImpl;

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
 * Created by 王豆豆 on 2017/11/23.
 */
public class TeachersServiceImpl implements TeachersService {
    private TeachersDao dao = new TeachersDaoImpl();
    //查询教师界面数据
    @Override
    public List<Teachers> selectByAllinfo() {
        List<Teachers> teachersList=dao.selectByAllinfo();
             return teachersList;

    }
    //添加数据
    @Override
    public void insertTeachers(Teachers teachers) {
      dao.insertTeachers(teachers); ;

    }
   //根据id查询信息
    @Override
    public Teachers selectByTid(Teachers teachers) {
        return dao.selectByTid(teachers);
    }

    //根据条件查询
    @Override
    public List<Teachers> selectTeachersByTnumberAndTname(String tnumber, String tname,String tjob) {
        List<Teachers>teachersList1=dao.selectTeachersByTnumberAndTname(tnumber,tname,tjob);
        return teachersList1;
    }
    //账号
    @Override
    public Teachers selectTeachersLike() {
        //当前日期
        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMdd");
        String strDate=simpleDateFormat.format(date);
        System.out.println(strDate);
        //根据当前日期 查询当前账号 yyyyMMdd---
        String nowTnumber="";
        List<Teachers>teachers2=dao.selectTeachersLikeTnumber(strDate+"___");
        if (teachers2==null||teachers2.size()==0){
            nowTnumber=strDate+"001";
        }
        else {
            Integer size=teachers2.size();
            Teachers teachers3=teachers2.get(size-1);
            String maxTnumber=teachers3.getTnumber();

            Long Tnumbers=Long.parseLong(maxTnumber);
            Tnumbers=Tnumbers+1;
            nowTnumber=Tnumbers.toString();
            System.out.println(nowTnumber);
        }
        //把新查询的账号保存到teachers
        Teachers teachers3=new Teachers();
        teachers3.setTnumber(nowTnumber);
        dao.insertTeachers(teachers3);
        return teachers3;
    }

    //修改密码
    @Override
    public void updateTeachersByTid(Teachers teachers) {
       dao.updateTeachersByTid(teachers);
    }
   //删除
    @Override
    public void deleteTeachersByTid(Teachers teachers) {
        dao.deleteTeachersByTid(teachers);
    }

    @Override
    public String downloadTeachers(String path) {
        //调用dao 查询所有数据
        List<Teachers> teachersList= dao.selectByAllinfo();

        //teachersList -- excel
        String filepath = path+"\\"+"teacher.xlsx";

        //HSSFWorkbook
        XSSFWorkbook   xssfWorkbook = new XSSFWorkbook();

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
