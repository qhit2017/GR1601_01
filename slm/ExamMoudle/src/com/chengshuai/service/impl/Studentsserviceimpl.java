package com.chengshuai.service.impl;

import com.chengshuai.bean.Classes;
import com.chengshuai.bean.Students;
import com.chengshuai.dao.Studentsdao;
import com.chengshuai.dao.impl.Studentsimpl;
import com.chengshuai.service.Studentsservice;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by slm on 2017/11/23.
 */
public class Studentsserviceimpl implements Studentsservice {
    private Studentsdao studentsdao = new Studentsimpl();

    @Override
    public List<Students> selectBysnameAndpwd(Students students) {
        /*查询学生表  根据学生姓名 密码 角色 进行查询*/
        return studentsdao.selectBysnameAndpwd(students);
    }

    @Override
    public List<Students> QueryStudentsAll() {
        return studentsdao.QueryStudentsAll();
    }

    @Override
    public List<Students> QueryBysnumberOrNameOrCnameOrsattend(String snumber, String sname, String cname, String fx) {
       /*g根据条件查询学生表中的数据*/
         return studentsdao.QueryBysnumberOrNameOrCnameOrsattend(snumber,sname,cname,fx);
    }

    @Override
    public void saveORupdate(Students students) {
        studentsdao.saveORupdate(students);
    }

    @Override
    public Students Queryandid(Integer id) {
        return studentsdao.Queryandid(id);
    }

    @Override
    public String dowloadStudentsAll(String pash) {
        List<Students> studentsList =  studentsdao.QueryStudentsAll();
        String ph = pash+"\\"+"students.xlsx";

         /*在内存中创建文件*/
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook();
         /*在Excel创建sheet*/
        XSSFSheet xsheet =  xssfWorkbook.createSheet();
           /*在Sheet中创建行*/

           /*设置表格标题*/
        XSSFRow xssfRow1 =  xsheet.createRow(0);
        XSSFCell xssfCell11 =  xssfRow1.createCell(0);
        xssfCell11.setCellType(CellType.STRING);
        xssfCell11.setCellValue("学生id");
        XSSFCell xssfCell12 =  xssfRow1.createCell(1);
        xssfCell12.setCellType(CellType.STRING);
        xssfCell12.setCellValue("学号");
        XSSFCell xssfCell13 =  xssfRow1.createCell(2);
        xssfCell13.setCellType(CellType.STRING);
        xssfCell13.setCellValue("姓名");
        XSSFCell xssfCell14 =  xssfRow1.createCell(3);
        xssfCell14.setCellType(CellType.STRING);
        xssfCell14.setCellValue("性别");
        XSSFCell xssfCell15 =  xssfRow1.createCell(4);
        xssfCell15.setCellType(CellType.STRING);
        xssfCell15.setCellValue("所属班级");
        XSSFCell xssfCell16 =  xssfRow1.createCell(5);
        xsheet.setColumnWidth(5,100*69);
        xssfCell16.setCellType(CellType.STRING);
        xssfCell16.setCellValue("电话");
        XSSFCell xssfCell17 =  xssfRow1.createCell(6);
        xssfCell17.setCellType(CellType.STRING);
        xsheet.setColumnWidth(6,100*69);
        xssfCell17.setCellValue("入学年份");


        for (int i = 0;i<studentsList.size();i++){
         XSSFRow xssfRow =  xsheet.createRow(i+1);
            Students students2 = studentsList.get(i);
            /*取班级*/
            Classes classes  = students2.getClasses();
          /*设置内容*/
            XSSFCell xssfCell =  xssfRow.createCell(0);
            xssfCell.setCellType(CellType.NUMERIC);
            xssfCell.setCellValue(students2.getSid());

            XSSFCell xssfCell1 =  xssfRow.createCell(1);
            xssfCell1.setCellType(CellType.STRING);
            xssfCell1.setCellValue(students2.getSnumber());

            XSSFCell xssfCell2 =  xssfRow.createCell(2);
            xssfCell2.setCellType(CellType.STRING);
            xssfCell2.setCellValue(students2.getSname());


            XSSFCell xssfCell3 =  xssfRow.createCell(3);
            xssfCell3.setCellType(CellType.STRING);
            xssfCell3.setCellValue(students2.getSsex());


            XSSFCell xssfCell4 =  xssfRow.createCell(4);
            xssfCell4.setCellType(CellType.STRING);
            xssfCell4.setCellValue(classes.getCid());

            XSSFCell xssfCell5 =  xssfRow.createCell(5);
            xssfCell5.setCellType(CellType.STRING);
            xssfCell5.setCellValue(students2.getStel());

            XSSFCell xssfCell6 =  xssfRow.createCell(6);
            xssfCell6.setCellType(CellType.STRING);
            xssfCell6.setCellValue(students2.getSenter());


        }


                /*创建输出流*/
        try {

            FileOutputStream flie = new FileOutputStream(ph);
            xssfWorkbook.write(flie);
            flie.flush();
            flie.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return ph;
    }

    @Override
    public String doloadStudentsSave(String path) {
        try {

            List<Students> studentsList = new ArrayList<Students>();
            /*定义数据流*/
            InputStream inputStream = new FileInputStream(path);
            /*从表格中读出来*/
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);
        /*从Excel 取 Sheet*/
            XSSFSheet xssfSheet =  xssfWorkbook.getSheet("Sheet0");
            /*从Sheet 中取到 Row*/
            for (int i = 1; i <=xssfSheet.getLastRowNum() ; i++) {
                XSSFRow xssfRow =  xssfSheet.getRow(i);
                /*从 Row 中取 Cell*/
                XSSFCell xssfCell1 =  xssfRow.getCell(1);
                String number =   xssfCell1.getStringCellValue();

                XSSFCell xssfCell2 =  xssfRow.getCell(2);
                String name =   xssfCell2.getStringCellValue();

                XSSFCell xssfCell3=  xssfRow.getCell(3);
                String sex =   xssfCell3.getStringCellValue();

                XSSFCell xssfCell4=  xssfRow.getCell(4);
                Integer clsses =  (int) xssfCell4.getNumericCellValue();

                XSSFCell xssfCell5=  xssfRow.getCell(5);
                Long  tel = (long) xssfCell5.getNumericCellValue();

                XSSFCell xssfCell6=  xssfRow.getCell(6);
                String  senter =  xssfCell6.getStringCellValue();

                Students students = new Students();
                Classes classes = new Classes();
                classes.setCid(clsses);


                students.setSname(name);
                students.setSnumber(number);
                students.setSsex(sex);
                students.setClasses(classes);
                String stel = String.valueOf(tel);
                students.setStel(stel);
                students.setSenter(senter);

                studentsList.add(students);



            }
            Studentsdao studentsdao = new Studentsimpl();
            studentsdao.SaveDao(studentsList);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
