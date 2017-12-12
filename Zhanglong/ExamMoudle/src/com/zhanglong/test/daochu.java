package com.zhanglong.test;

import com.zhanglong.bean.Students;
import com.zhanglong.dao.StudentsDao;
import com.zhanglong.dao.TeacherDao;
import com.zhanglong.dao.impl.StudentsDaoImpl;
import com.zhanglong.dao.impl.TeacherDaoImpl;
import com.zhanglong.service.StudentService;
import com.zhanglong.service.impl.StudentServiceImpl;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileOutputStream;
import java.util.List;

/**
 * Created by Administrator on 2017/12/4 0004.
 */
public class daochu {
    public static void main(String[] args) {
     /*   //调用dao 查询所有数据
        StudentsDao dao=new StudentsDaoImpl();
        List<Students> studentsList=dao.selectAllInfo();
        //teachersList -- excel
        //HSSFWorkbook
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook();

        //在excel文件里面 创建sheet
        XSSFSheet xssfSheet=xssfWorkbook.createSheet();

        //写一个标题
        XSSFRow xssfRow1= xssfSheet.createRow(0);

        XSSFCell tid=xssfRow1.createCell(0);
        tid.setCellType(CellType.STRING);
        tid.setCellValue("序号");

        XSSFCell tnumber=xssfRow1.createCell(1);
        tnumber.setCellType(CellType.STRING);
        tnumber.setCellValue("学号");

        XSSFCell tname=xssfRow1.createCell(2);
        tname.setCellType(CellType.STRING);
        tname.setCellValue("姓名");

        XSSFCell classes=xssfRow1.createCell(3);
        classes.setCellType(CellType.STRING);
        classes.setCellValue("班级");

        XSSFCell sex=xssfRow1.createCell(4);
        sex.setCellType(CellType.STRING);
        sex.setCellValue("性别");

        XSSFCell tel=xssfRow1.createCell(5);
        tel.setCellType(CellType.STRING);
        tel.setCellValue("联系电话");

        for(int i=0;i<studentsList.size();i++){
            //在sheet 创建 row
            XSSFRow xssfRow= xssfSheet.createRow(i+1);
            Students s =studentsList.get(i);

            XSSFCell tid1=xssfRow.createCell(0);
            tid1.setCellType(CellType.NUMERIC);
            tid1.setCellValue(s.getSid());

            XSSFCell tnumber1=xssfRow.createCell(1);
            tnumber1.setCellType(CellType.STRING);
            tnumber1.setCellValue(s.getSnumber());

            XSSFCell tname1=xssfRow.createCell(2);
            tname1.setCellType(CellType.STRING);
            tname1.setCellValue(s.getSname());

            XSSFCell classes1=xssfRow.createCell(3);
            classes1.setCellType(CellType.STRING);
            classes1.setCellValue(s.getClasses().getCname());

            XSSFCell sex1=xssfRow.createCell(4);
            sex1.setCellType(CellType.STRING);
            sex1.setCellValue(s.getSsex());

            XSSFCell tel1=xssfRow.createCell(5);
            tel1.setCellType(CellType.STRING);
            tel1.setCellValue(s.getStel());
        }
        System.out.println();
        //输出流
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(filepath);
            xssfWorkbook.write(fileOutputStream);
            fileOutputStream.flush();
            fileOutputStream.close();

        } catch (java.io.IOException e) {
            e.printStackTrace();
    }
    }*/
        TeacherDao dao=new TeacherDaoImpl();
        dao.SelectTeachersByTid(146);
}}