package com.yaokaiwen.service.impl;

import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Students;
import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.dao.ClassesDao;
import com.yaokaiwen.dao.StudentsDao;
import com.yaokaiwen.dao.impl.ClassesDaoImpl;
import com.yaokaiwen.dao.impl.StudentDaoImpl;
import com.yaokaiwen.service.StudentService;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class StundentServiceImpl implements StudentService{
    private StudentsDao studentsDao = new StudentDaoImpl();
    private ClassesDao classesDao = new ClassesDaoImpl();
    @Override
    public List<Students> selectStudentsAllService() {
        List<Students> list = studentsDao.selectStudentsAll();
        if(list==null||list.size()<=0) {
            return null;
        }else {
            return list;
        }

    }

    @Override
    public Students selectStudentsBysidService(Integer sid) {
        Students students = studentsDao.selectStudentsBysid(sid);
        if (students == null) {
            return null;
        } else {
            return students;
        }
    }
    @Override
    public List<Students> selectStudentAllByService(Students students, Integer cid) {
        List<Students> list = studentsDao.selectStudentsAllBy(students, cid);
        if(list==null||list.size()<=0) {
            return null;
        }else {
            return list;
        }
    }

    @Override
    public void insertOrUpdateStudents(Students students) {
        studentsDao.insertOrUpdate(students);
        return;
    }

    @Override
    public void daleteStudentsService(Students students) {
        studentsDao.delete(students);
        return;
    }

    @Override
    public List<Classes> selectclassesService() {
        ClassesDao classesDao = new ClassesDaoImpl();
        List<Classes> list = classesDao.selectClassesAll();
        if(list==null||list.size()==0){
            return null;
        }else {
            return list;
        }
    }

    @Override
    public String filedownstudentService(String path) {
        XSSFRow xssfRow;
        XSSFCell xssfCell;
        List<Students>studentsList = studentsDao.selectStudentsAll();
        String filepath = path+"\\"+"student.xlsx";
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook();
        XSSFSheet xssfSheet = xssfWorkbook.createSheet();
        xssfRow= xssfSheet.createRow(0);
        xssfCell = xssfRow.createCell(0);
        xssfCell.setCellType(CellType.STRING);
        xssfCell.setCellValue("学号");
        xssfCell = xssfRow.createCell(1);
        xssfCell.setCellType(CellType.STRING);
        xssfCell.setCellValue("姓名");
        xssfCell = xssfRow.createCell(2);
        xssfCell.setCellType(CellType.STRING);
        xssfCell.setCellValue("性别");
        xssfCell = xssfRow.createCell(3);
        xssfCell.setCellType(CellType.NUMERIC);
        xssfCell.setCellValue("入学年份");
        xssfCell = xssfRow.createCell(4);
        xssfCell.setCellType(CellType.NUMERIC);
        xssfCell.setCellValue("班级");

        for(int i=0;i<studentsList.size();i++){
            Students s = studentsList.get(i);
            xssfRow= xssfSheet.createRow(i+1);
            xssfCell = xssfRow.createCell(0);
            xssfCell.setCellType(CellType.STRING);
            xssfCell.setCellValue(s.getSnumber());
            xssfCell = xssfRow.createCell(1);
            xssfCell.setCellType(CellType.STRING);
            xssfCell.setCellValue(s.getSname());
            xssfCell = xssfRow.createCell(2);
            xssfCell.setCellType(CellType.STRING);
            xssfCell.setCellValue(s.getSsex());
            xssfCell = xssfRow.createCell(3);
            xssfCell.setCellType(CellType.NUMERIC);
            xssfCell.setCellValue(s.getSenter());
            xssfCell = xssfRow.createCell(4);
            xssfCell.setCellType(CellType.NUMERIC);
            xssfCell.setCellValue(s.getCid().getCname());
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

    @Override
    public void fileupinsertstudentService(String filepath) {
        System.out.println("134="+filepath);
        List<Students> studentsList = new ArrayList<Students>();
        try {
            InputStream inputStream = new FileInputStream(filepath);
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);
            XSSFSheet xssfSheet = xssfWorkbook.getSheet("s");
            XSSFRow xssfRow ;
            XSSFCell xssfCell;
            for(int i=0;i<=xssfSheet.getLastRowNum();i++){
                xssfRow = xssfSheet.getRow(i);
                xssfCell = xssfRow.getCell(0);
                String snumber = xssfCell.getRawValue();
                xssfCell = xssfRow.getCell(1);
                String sname = xssfCell.getStringCellValue();
                xssfCell = xssfRow.getCell(2);
                String ssex = xssfCell.getStringCellValue();
                xssfCell = xssfRow.getCell(3);
                String senter = xssfCell.getStringCellValue();
                xssfCell = xssfRow.getCell(4);
                String cname = xssfCell.getRawValue();
                Classes classes = classesDao.selectclassesbyname(cname);
                Students students = new Students();
                students.setSnumber(snumber);
                students.setSname(sname);
                students.setSsex(ssex);
                students.setSenter(senter);
                students.setCid(classes);
                studentsList.add(students);
            }
            studentsDao.insertsavestudent(studentsList);
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }

    }
}
