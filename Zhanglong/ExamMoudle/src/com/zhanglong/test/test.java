package com.zhanglong.test;

import com.zhanglong.bean.Classes;
import com.zhanglong.bean.Students;
import com.zhanglong.dao.StudentsDao;
import com.zhanglong.dao.impl.StudentsDaoImpl;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/11/26 0026.
 */
public class test {
    public static void main(String[] args) {
//       TeacherService service=new TeacherServiceImpl();
//        service.queryTeacherNumber();
        /*TeacherDao teacherDao=new TeacherDaoImpl();
        Teachers teachers=teacherDao.SelectTeachersByTid(107);
        System.out.println(teachers.getTnumber());*/
        /*ClassesDao dao=new ClassesDaoImpl();
        List<Classes> classes=dao.selectChaxun("2015-09-01 00:00:00","高软","146","147");
         for (Classes c:classes){
             System.out.println(c.getCdirection());

       /*  }*//*
        TeacherDao dao=new TeacherDaoImpl();
        List<Teachers>teachers=dao.queryteacherByTnumberTnameTrole("20171129002","胡迪",1);
        for (Teachers c:teachers){
            System.out.println(c.getTnumber());
        }
        */
        /*ClassesDao dao=new ClassesDaoImpl();
        dao.selectClassById(1);*/

        String filepath = "C:\\Users\\Administrator\\Desktop\\Book1.xlsx";
        try {
            InputStream inputStream = new FileInputStream(filepath);

            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);
            //从excel取到sheet
            XSSFSheet xssfSheet = xssfWorkbook.getSheet("Sheet1");

       /* XSSFSheet xssfSheet=xssfWorkbook.getSheet("Sheet1");*/
            for (int i = 1; i <= xssfSheet.getLastRowNum(); i++) {
                XSSFRow xssfRow = xssfSheet.getRow(i);
                //从row中取到cell
               XSSFCell id = xssfRow.getCell(0);//这取到的只是单元格
                Integer sid = (int) id.getNumericCellValue();

                XSSFCell number = xssfRow.getCell(1);
                Integer snumber = (int) number.getNumericCellValue();

                XSSFCell name = xssfRow.getCell(2);
                String sname = name.getStringCellValue();


                XSSFCell sex = xssfRow.getCell(3);
                String ssex = sex.getStringCellValue();

                XSSFCell tel = xssfRow.getCell(4);
                Long stel = (long) tel.getNumericCellValue();

                XSSFCell id1 = xssfRow.getCell(5);
                Integer cid1 = (int) id1.getNumericCellValue();

                System.out.println(sid+";"+snumber + ";"+ sname + ";" + ssex + ";" + stel+";"+cid1);


               /* Students students = new Students();
                Classes classes1 = new Classes();
                classes1.setCid(cid1);
                students.setClasses(classes1);
                students.setSnumber(String.valueOf(snumber));
                students.setSname(sname);

                students.setSsex(ssex);
                students.setStel(String.valueOf(stel));
                List<Students> studentsList1 = new ArrayList<Students>();
                studentsList1.add(students);
                StudentsDao studentsDao = new StudentsDaoImpl();
                studentsDao.daoruxuesheng(studentsList1);*/
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }



}
