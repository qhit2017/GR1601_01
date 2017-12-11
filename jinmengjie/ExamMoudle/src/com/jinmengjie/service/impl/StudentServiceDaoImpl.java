package com.jinmengjie.service.impl;

import com.jinmengjie.bean.Students;
import com.jinmengjie.dao.ClassesDao;
import com.jinmengjie.dao.StudentDao;
import com.jinmengjie.dao.impl.ClassesDaoImpl;
import com.jinmengjie.dao.impl.StudentsDaoImpl;
import com.jinmengjie.service.ClassesService;
import com.jinmengjie.service.StudentServiceDao;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.jinmengjie.bean.Classes;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 金梦杰 on 2017/11/23/023.
 */
public class StudentServiceDaoImpl implements StudentServiceDao {
    private StudentDao studentDao = new StudentsDaoImpl();

    @Override
    public Students selectstudents(Students students) {
        return studentDao.selectstudents(students);
    }

    @Override
    public List<Students> selectAllStudentInfo() {
        return studentDao.selectAllStudentInfo();
    }

    @Override
    public List<Students> selectSutdentInfoBysnumberOrsnameOrsenterOrcid(String snumber, String sname, Integer cid, String senter, String studydirection) {
        return studentDao.selectSutdentInfoBysnumberOrsnameOrsenterOrcid(snumber, sname, cid, senter, studydirection);
    }

    @Override
    public Students selectStudentInfoBySid(Integer sid) {
        return studentDao.selectStudentInfoBySid(sid);
    }

    @Override
    public void saveOrupdateStudentInfo(Students students) {
        studentDao.saveOrupdateStudentInfo(students);
    }

    @Override
    public void deleteStudentObject(Students students) {
        studentDao.deleteStudentObject(students);

    }


    //学生页面的导出功能
    @Override
    public String downloadStudent(String path) {
        //行
        XSSFRow xssfRow;
        //单元格
        XSSFCell xssfCell;

        //调用dao 查询所有数据
        List<Students> studentsList = studentDao.selectAllStudentInfo();
        //teachersList -- excel
        String filepath = path + "\\" + "studentinfo.xlsx";

        //HSSFWorkbook
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook();

        //在excel文件里面 创建sheet
        XSSFSheet xssfSheet = xssfWorkbook.createSheet();

        //写一个标题
        xssfRow = xssfSheet.createRow(0);


        xssfCell = xssfRow.createCell(0);
        xssfCell.setCellType(CellType.STRING);
        xssfCell.setCellValue("序号");

        xssfCell = xssfRow.createCell(1);
        xssfCell.setCellType(CellType.STRING);
        xssfCell.setCellValue("学号");

        xssfCell = xssfRow.createCell(2);
        xssfCell.setCellType(CellType.STRING);
        xssfCell.setCellValue("班级");

        xssfCell = xssfRow.createCell(3);
        xssfCell.setCellType(CellType.STRING);
        xssfCell.setCellValue("姓名");

        xssfCell = xssfRow.createCell(4);
        xssfCell.setCellType(CellType.STRING);
        xssfCell.setCellValue("性别");


        for (int i = 0; i < studentsList.size(); i++) {
            //在sheet 创建 row
            xssfRow = xssfSheet.createRow(i + 1);
            Students students = studentsList.get(i);

            xssfCell = xssfRow.createCell(0);
            xssfCell.setCellType(CellType.NUMERIC);
            xssfCell.setCellValue(students.getSid());


            xssfCell = xssfRow.createCell(1);
            xssfCell.setCellType(CellType.STRING);
            xssfCell.setCellValue(students.getSnumber());

            xssfCell = xssfRow.createCell(2);
            xssfCell.setCellType(CellType.STRING);
            xssfCell.setCellValue(students.getCid().getCname());

            xssfCell = xssfRow.createCell(3);
            xssfCell.setCellType(CellType.STRING);
            xssfCell.setCellValue(students.getSname());

            xssfCell = xssfRow.createCell(4);
            xssfCell.setCellType(CellType.STRING);
            xssfCell.setCellValue(students.getSsex());

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

    //导入学生信息
    @Override
    public void uploadstudentinfo(String path) {
        //行
        XSSFRow xssfRow;
        //单元格
        XSSFCell xssfCell;

        List<Students> studentsList = new ArrayList<Students>();

        String filepath = path + "\\" + "s.xlsx";
        System.out.println(filepath);
        try {
            InputStream inputStream = new FileInputStream(filepath);
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);

            //从excel取到sheel
            XSSFSheet xssfSheet = xssfWorkbook.getSheet("s");
            //从sheel 取row   取到的是最后一行的数据
            System.out.println(xssfSheet.getLastRowNum());
            for (int i =1; i <=xssfSheet.getLastRowNum(); i++) {
                System.out.println(xssfSheet.getLastRowNum());
                //先取到的是第0行
                xssfRow = xssfSheet.getRow(i);
                //从row 取 cell
                xssfCell = xssfRow.getCell(0);//这取到的只是单元格
                String xuehao = xssfCell.getRawValue();//(取学号)
                xssfCell = xssfRow.getCell(1);//（取姓名）
                String sname = xssfCell.getStringCellValue();  //只要单元格带有字母就用String类型
                xssfCell =  xssfRow.getCell(2);//（取性别）
                String sex = xssfCell.getStringCellValue();
                xssfCell =  xssfRow.getCell(3);//入学年份
                String senter = xssfCell.getStringCellValue();
                xssfCell =  xssfRow.getCell(4);//班级
                String cname = xssfCell.getRawValue();//只要单元格是纯数字就用Numeric类型
                //取班级信息
                ClassesDao classesDao = new ClassesDaoImpl();
                Classes classes = classesDao.selectClassescnameByCid(cname);
                System.out.println(xuehao+""+sname+""+cname+""+senter+""+sex);
                //把数据放到student对象中
                Students students = new Students();
                students.setSnumber(xuehao);
                students.setSname(sname);
                students.setSsex(sex);
                students.setSenter(senter);
                students.setCid(classes);
                //把对象添加到list
                studentsList.add(students);
             }
             //调用数据添加方法
            studentDao.insert(studentsList);

        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
        return ;
    }

}
