package com.wangdoudou.test;

import com.wangdoudou.bean.Teachers;
import com.wangdoudou.dao.TeachersDao;
import com.wangdoudou.dao.TeachersDaoImpl;
import com.wangdoudou.service.TeachersService;
import com.wangdoudou.service.TeachersServiceImpl;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.helpers.XSSFXmlColumnPr;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
/**
 * Created by 王豆豆 on 2017/12/5.
 */
public class Testlist {
    public static void main(String[] args) {
        List<Teachers> teachersList = new ArrayList<Teachers>();

        String filepath = "C:\\work\\ExamMoudle1\\web\\file\\student.xlsx";

        try {
            InputStream inputStream =new FileInputStream(filepath);
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);

            //从excel取到sheel
            XSSFSheet xssfSheet= xssfWorkbook.getSheet("Sheet1" );

            //从sheel 取row(行)
            for(int i =1;i<=xssfSheet.getLastRowNum();i++){
                XSSFRow xssfRow = xssfSheet.getRow(i);

                //从row 取 cell(单元格)
                XSSFCell xssfCell1 =xssfRow.getCell(0);
                //从cell 取值
                Integer id = (int) xssfCell1.getNumericCellValue();

                XSSFCell xssfCell2 =xssfRow.getCell(1);
                String name = xssfCell2.getStringCellValue();

                System.out.println(name +" "+id);
                Teachers teachers = new Teachers();
                teachers.setTid(id);
                teachers.setTname(name);
                teachersList.add(teachers);
            }
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }


    }
}



