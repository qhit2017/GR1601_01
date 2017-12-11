package com.zhanglong.service.impl;

import com.zhanglong.bean.Classes;
import com.zhanglong.bean.Students;
import com.zhanglong.dao.StudentsDao;

import com.zhanglong.dao.impl.StudentsDaoImpl;
import com.zhanglong.service.StudentService;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/2 0002.
 */
public class StudentServiceImpl implements StudentService {
    private StudentsDao dao=new StudentsDaoImpl();
    //查询所有学生信息
    @Override
    public List<Students> selectAllInfo() {
        return dao.selectAllInfo();
    }

    @Override
    public List<Students> selectchaxunfive(String snumber, String sname, String cid, String senter, String smahor) {
     return dao.selectchaxunfive(snumber,sname,cid,senter,smahor);
    }

    @Override
    public void SaveoruodateStudent(Students students) {
        dao.SaveoruodateStudent(students);
        return;
    }

    @Override
    public Students selectStudentsBysid(Integer sid) {
        return dao.selectStudentsBysid(sid);
    }

    @Override
    public void deleteStudent(Students students) {
        dao.deleteStudent(students);
        return;
    }

    @Override
    public String downloadStudent(String path) {
        //调用dao 查询所有数据
       List<Students>studentsList= dao.selectAllInfo();
        //teachersList -- excel
        String filepath = path+"\\"+"studentdaochu.xlsx";
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
        //输出流
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(filepath);
            xssfWorkbook.write(fileOutputStream);
            fileOutputStream.flush();
            fileOutputStream.close();

        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
        //把路径带回去
        return filepath;
    }

    @Override
    public String daoruStudent(String path) {
        String filepath=path+"\\"+"Book1.xlsx";
        try {
            InputStream inputStream = new FileInputStream(filepath);

            XSSFWorkbook xssfWorkbook=new XSSFWorkbook(inputStream);
            //从excel取到sheet
            XSSFSheet xssfSheet=xssfWorkbook.getSheet("Sheet1");

       /* XSSFSheet xssfSheet=xssfWorkbook.getSheet("Sheet1");*/
            for (int i=1;i<=xssfSheet.getLastRowNum();i++){
                XSSFRow xssfRow = xssfSheet.getRow(i);
                /*//从row中取到cell
                XSSFCell id = xssfRow.getCell(0);//这取到的只是单元格
                Integer sid = (int) id.getNumericCellValue();*/

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



                System.out.println(snumber + ";"+ sname + ";" + ssex + ";" + stel);
                Students students = new Students();
                students.setSnumber(String.valueOf(snumber));

                Classes classes1 = new Classes();
                classes1.setCid(cid1);
                students.setClasses(classes1);

                students.setSname(sname);
                students.setSsex(ssex);
                students.setStel(String.valueOf(stel));
                List<Students> studentsList1 = new ArrayList<Students>();
                studentsList1.add(students);
                StudentsDao studentsDao = new StudentsDaoImpl();
                studentsDao.daoruxuesheng(studentsList1);
            }}
                catch (IOException e) {
                e.printStackTrace();
            }
                return filepath;
    }
}
