package com.zhangerhui.service.impl;

import com.zhangerhui.bean.Classes;
import com.zhangerhui.bean.Students;
import com.zhangerhui.dao.StudentDao;
import com.zhangerhui.dao.impl.StudentDaoImpl;
import com.zhangerhui.service.StudentService;
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
 * Created by Administrator on 2017/11/23/023.
 */
public class StudentServiceImpl implements StudentService {

    private StudentDao dao = new StudentDaoImpl();

    @Override
    public List<Students> selectStudentsBysnameAndspassword(String sname, String spassword) {
        return dao.queryStudentsBysnameandspassword(sname, spassword);
    }

    @Override
    public List<Students> selectStudentsallinfo() {
        return dao.queryStudentsallinfo();
    }

    @Override
    public void saveStudent(Students students) {
        dao.insert(students);
        return;
    }

    @Override
    public List<Students> selectfive(String snumber, String sname, String cid, String senter, String smahor) {
        return dao.queryfive(snumber,sname,cid,senter,smahor);
    }

    @Override
    public void update(Students students) {
        dao.upadte(students);
        return;
    }

    @Override
    public Students selectStudentInfoBySid(Integer sid) {
        return dao.queryStudentInfoBySid(sid);
    }

    @Override
    public void deleteStudent(Students students) {
        dao.delete(students);
        return;
    }

    @Override
    public String downloadStudentAllInfoService(String path) {
        List<Students> studentsList=dao.queryStudentsallinfo();
        String filepath=path+"\\"+"studentsinfo.xlsx";

        //excel  HSSFWorkbook xls 是2007版本前的用
        XSSFWorkbook xssfWorkbook=new XSSFWorkbook();
        //在excel文件里面  创建sheet   createSheet()可以在括号中起模块名
        XSSFSheet xssfSheet=xssfWorkbook.createSheet();
        //在sheet创建row
        //XSSFRow xssfRow=xssfSheet.createRow(0);
        //在row中创建cell(单元格)
        //XSSFCell xssfCell=xssfRow.createCell(0);

        XSSFRow xssfRow=xssfSheet.createRow(0);

        XSSFCell tid=xssfRow.createCell(0);
        tid.setCellType(CellType.STRING);
        tid.setCellValue("序号");
        XSSFCell tnumber=xssfRow.createCell(1);
        tnumber.setCellType(CellType.STRING);
        tnumber.setCellValue("学号");
        XSSFCell tname=xssfRow.createCell(2);
        tname.setCellType(CellType.STRING);
        tname.setCellValue("姓名");
        XSSFCell classes=xssfRow.createCell(3);
        classes.setCellType(CellType.STRING);
        xssfSheet.setColumnWidth(3,100*69);
        classes.setCellValue("班级");
        XSSFCell sex=xssfRow.createCell(4);
        sex.setCellType(CellType.STRING);
        sex.setCellValue("性别");
        XSSFCell tel=xssfRow.createCell(5);
        tel.setCellType(CellType.STRING);
        xssfSheet.setColumnWidth(5,100*69);
        tel.setCellValue("联系电话");
        XSSFCell etime=xssfRow.createCell(6);
        etime.setCellType(CellType.STRING);
        xssfSheet.setColumnWidth(6,100*69);
        etime.setCellValue("入学年份");


        //向cell中放值  for循环
        for (int i=0;i<studentsList.size();i++){
            XSSFRow row=xssfSheet.createRow(i+1);
            Students students=studentsList.get(i);
            XSSFCell tid1=row.createCell(0);
            tid1.setCellType(CellType.NUMERIC);
            tid1.setCellValue(students.getSid());

            XSSFCell tnumber1=row.createCell(1);
            tnumber1.setCellType(CellType.STRING);
            tnumber1.setCellValue(students.getSnumber());

            XSSFCell tname1=row.createCell(2);
            tname1.setCellType(CellType.STRING);
            tname1.setCellValue(students.getSname());

            XSSFCell classes1=row.createCell(3);
            classes1.setCellType(CellType.STRING);
            classes1.setCellValue(students.getClasses().getCname());

            XSSFCell sex1=row.createCell(4);
            sex1.setCellType(CellType.STRING);
            sex1.setCellValue(students.getSsex());

            XSSFCell tel1=row.createCell(5);
            tel1.setCellType(CellType.STRING);
            tel1.setCellValue(students.getStel());

            XSSFCell etime1=row.createCell(6);
            etime1.setCellType(CellType.STRING);
            etime1.setCellValue(students.getSenter());
        }
        //输出流
        try {
            FileOutputStream fileOutputStream=new FileOutputStream(filepath);
            xssfWorkbook.write(fileOutputStream);
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //把路径带回去
        return filepath;
    }

    @Override
    public String importStudentInfos(String path) {
        String filepath=path+"\\"+"students_import1.xlsx";

        try {
            InputStream inputStream=new FileInputStream(filepath);

            //这样就跟个界面所传过来的名字动态改变（与ExportStudentInfoController中的2呼应）
            //导入导出都可这样用
            //如果用下面这个方法  就不用     String filepath=path+"\\"+"students_import1.xlsx";
            //2. InputStream inputStream=new FileInputStream(path);

            XSSFWorkbook xssfWorkbook=new XSSFWorkbook(inputStream);
            //从excel取到sheet
            XSSFSheet xssfSheet=xssfWorkbook.getSheet("Sheet1");
            //从sheet中取到row
            //可以得到excel中的最后一行是第几行数据 xssfSheet.getLastRowNum();
            System.out.println("xssfSheet.getLastRowNum()"+xssfSheet.getLastRowNum());
            for (int i=1;i<=xssfSheet.getLastRowNum();i++){
                XSSFRow xssfRow=xssfSheet.getRow(i);
                //从row中取到cell
                XSSFCell number=xssfRow.getCell(0);//这取到的只是单元格
                Integer snumber=(int)number.getNumericCellValue();

                XSSFCell classes=xssfRow.getCell(1);
                Integer sclasses=(int)classes.getNumericCellValue();

                XSSFCell name=xssfRow.getCell(2);
                String sname=name.getStringCellValue();

                XSSFCell sex=xssfRow.getCell(3);
                String ssex=sex.getStringCellValue();

                XSSFCell tel=xssfRow.getCell(4);
                Long stel=(long)tel.getNumericCellValue();

                System.out.println(snumber+";"+sclasses+";"+sname+";"+ssex+";"+stel);
                Students students=new Students();
                students.setSnumber(String.valueOf(snumber));

                Classes classes1=new Classes();
                classes1.setCid(sclasses);
                students.setClasses(classes1);

                students.setSname(sname);

                students.setSsex(ssex);

                students.setStel(String.valueOf(stel));
                List<Students> studentsList1=new ArrayList<Students>();
                studentsList1.add(students);

                dao.importStudentInfodao(studentsList1);
            }
        }  catch (IOException e) {
            e.printStackTrace();
        }

        return filepath;
    }

}
