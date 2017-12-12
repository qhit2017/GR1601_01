package com.guolonglong.test;

import com.guolonglong.bean.Classes;
import com.guolonglong.bean.Students;
import com.guolonglong.bean.Teachers;
import com.guolonglong.service.LoginService;
import com.guolonglong.service.StudentsService;
import com.guolonglong.service.TeachersService;
import com.guolonglong.service.impl.LoginServiceImpl;
import com.guolonglong.service.impl.StudentsServiceImpl;
import com.guolonglong.service.impl.TeachersServiceImpl;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2017/11/27.
 */
public class TestTeachers {
    public static void main(String[] args) {
        /*StudentsService studentsService = new StudentsServiceImpl();
        List<Students> studentsList = studentsService.selectStudentsAll();
        for (Students s:studentsList){
            System.out.println(s.getClasses().getCname());
        }*/
        List<Students> studentsList = new ArrayList<Students>();
        String filepath = "E:\\idea_gll\\Items\\out\\artifacts\\ExamModule_war_exploded\\file\\students.xlsx";
        try {
            InputStream inputStream = new FileInputStream(filepath);
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);
            XSSFSheet sheet = xssfWorkbook.getSheet("sheet1");
            for (int i=1;i<=sheet.getLastRowNum();i++){
                XSSFRow row = sheet.getRow(i);
                System.out.println("6666");
                XSSFCell cell = row.getCell(0);
                Integer snumber = (int)cell.getNumericCellValue();
                XSSFCell cell1 = row.getCell(1);
                String sname = cell1.getStringCellValue();
                XSSFCell cell2 = row.getCell(2);
                String ssex = cell2.getStringCellValue();
                XSSFCell cell3 = row.getCell(3);
                Integer senter = (int)cell3.getNumericCellValue();
                XSSFCell cell4 = row.getCell(4);
                Integer cname = (int)cell4.getNumericCellValue();
                System.out.println(snumber);
                System.out.println(sname);
                System.out.println(cname);
                Students students = new Students();

                students.setSnumber(snumber.toString());
                students.setSname(sname);
                students.setSsex(ssex);
                students.setSenter(senter.toString());

                Classes classes = new Classes();
                classes.setCname(cname.toString());
                students.setClasses(classes);
                studentsList.add(students);
            }
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
    }

    }

