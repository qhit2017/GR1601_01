package com.guolonglong.test;

import com.guolonglong.bean.Students;
import com.guolonglong.dao.StudentsDao;
import com.guolonglong.dao.impl.StudentsDaoImpl;
import com.guolonglong.service.StudentsService;
import com.guolonglong.service.impl.StudentsServiceImpl;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileOutputStream;
import java.util.List;

/**
 * Created by lenovo on 2017/12/3.
 */
public class TestStudents {
    public static void main(String[] args) {
        StudentsDao studentsDao = new StudentsDaoImpl();
        List<Students> studentsList = studentsDao.selectStudentsAll();
       /* for (Students s:studentsList){
            System.out.println(s.getSname()+s.getSenter()+s.getSsex()+s.getSnumber()+s.getClasses().getCname());
        }*/
        //studentsList----> excel
        /*String filepath = path+"\\"+"student.xlsx";
        System.out.println(filepath);*/
        String filepath = "E:\\idea_gll\\Items\\out\\artifacts\\ExamModule_war_exploded\\file\\student.xlsx";
        //创建一个excel
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook();
        //在excel中创建一个sheet
        XSSFSheet sheet = xssfWorkbook.createSheet();

        //写一个标题
        XSSFRow row = sheet.createRow(0);//从0开始（通常0为标题）
        XSSFCell celltitle = row.createCell(0);
        celltitle.setCellType(CellType.STRING);
        celltitle.setCellValue("学号");
        XSSFCell celltitle1 = row.createCell(1);
        celltitle1.setCellType(CellType.STRING);
        celltitle1.setCellValue("姓名");
        XSSFCell celltitle2 = row.createCell(2);
        celltitle2.setCellType(CellType.STRING);
        celltitle2.setCellValue("性别");
        XSSFCell celltitle3 = row.createCell(3);
        celltitle3.setCellType(CellType.STRING);
        celltitle3.setCellValue("入学年份");
        XSSFCell celltitle4 = row.createCell(4);
        celltitle4.setCellType(CellType.STRING);
        celltitle4.setCellValue("所属班级");

        for (int i=0;i<studentsList.size();i++){
            //在sheet中创建一个row
            XSSFRow row1 = sheet.createRow(i+1);
            Students s = studentsList.get(i);
            System.out.println("students"+s);
            //在row中创建一个cell
            XSSFCell cell = row1.createCell(0);
            cell.setCellType(CellType.STRING);//设置列的类型
            cell.setCellValue(s.getSnumber());
            System.out.println(s.getSnumber());
            XSSFCell cell1 = row1.createCell(1);
            cell1.setCellType(CellType.STRING);//设置列的类型
            cell1.setCellValue(s.getSname());
            System.out.println(s.getSname());
            XSSFCell cell2 = row1.createCell(2);
            cell2.setCellType(CellType.STRING);//设置列的类型
            cell2.setCellValue(s.getSsex());
            System.out.println(s.getSsex());
            XSSFCell cell3 = row1.createCell(3);
            cell3.setCellType(CellType.STRING);//设置列的类型
            cell3.setCellValue(s.getSenter());
            System.out.println(s.getSenter());
            XSSFCell cell4 = row1.createCell(4);
            cell4.setCellType(CellType.STRING);//设置列的类型
            cell4.setCellValue(s.getClasses().getCname());
            System.out.println(s.getClasses().getCname());
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(filepath);
            xssfWorkbook.write(fileOutputStream);
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (java.io.IOException e) {
            e.printStackTrace();
            return;
        }

    }

    }

