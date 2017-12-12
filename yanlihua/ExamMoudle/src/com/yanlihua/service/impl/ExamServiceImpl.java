package com.yanlihua.service.impl;

import com.yanlihua.bean.*;
import com.yanlihua.dao.ExamDao;
import com.yanlihua.dao.StudentsDao;
import com.yanlihua.dao.impl.ExamDaoImpl;
import com.yanlihua.dao.impl.StudentDaoImpl;
import com.yanlihua.service.ExamService;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by 晏利花 on 2017/12/3.
 */
public class ExamServiceImpl implements ExamService {
    private ExamDao examDao=new ExamDaoImpl();

    @Override
    public List<Testpaper> selectTestpaperAllInfoExamService() {
        return examDao.selectTestpaperAllInfoExamDao();
    }

    @Override
    public List<Subject> selectSubjectAllInfoExamService() {
        return examDao.selectSubjectAllInfoExamDao();
    }

    @Override
    public List<Testpaper> selectTestpaperInfoByFiveConditionExamService(Integer suid, String ttype, String tstate) {
        return examDao.selectTestpaperInfoByFiveConditionExamDao(suid,ttype,tstate);
    }

    @Override
    public void saveTestpaperInfoExamService(Testpaper testpaper) {
        examDao.saveTestpaperInfoExamDao(testpaper);
        return;
    }

    @Override
    public String importExamInfoExamService(String path) {
        String filepath=path+"\\"+"examinfo.xlsx";
        try {

            InputStream inputStream = new FileInputStream(filepath);
            XSSFWorkbook xssfWorkbook=new XSSFWorkbook(inputStream);
            //从excel取到sheet
            XSSFSheet xssfSheet=xssfWorkbook.getSheet("Sheet1");
            //从sheet中取到row
            //可以得到excel中的最后一行是第几行数据 xssfSheet.getLastRowNum();
            for (int i=1;i<=xssfSheet.getLastRowNum();i++){
                XSSFRow xssfRow=xssfSheet.getRow(i);
                //从row中取到cell
                XSSFCell type=xssfRow.getCell(0);//这取到的只是单元格
                Integer qtype=(int)type.getNumericCellValue();


                XSSFCell content=xssfRow.getCell(1);
                String qcontent=content.getStringCellValue();

                XSSFCell a=xssfRow.getCell(2);
                String qa=a.getStringCellValue();

                XSSFCell b=xssfRow.getCell(3);
                String qb=b.getStringCellValue();

                XSSFCell c=xssfRow.getCell(4);
                String qc=c.getStringCellValue();

                XSSFCell d=xssfRow.getCell(5);
                String qd=d.getStringCellValue();

                XSSFCell answer=xssfRow.getCell(6);
                String qanswer=answer.getStringCellValue();

                XSSFCell difficult=xssfRow.getCell(7);
                String qdifficult=difficult.getStringCellValue();
                //放数据
                Questionbank questionbank=new Questionbank();
                questionbank.setQtype(qtype);
                questionbank.setQcontent(qcontent);
                questionbank.setQa(qa);
                questionbank.setQb(qb);
                questionbank.setQc(qc);
                questionbank.setQd(qd);
                questionbank.setQanswer(qanswer);
                questionbank.setQdifficulty(qdifficult);

                List<Questionbank> questionbankList=new ArrayList<Questionbank>();
                questionbankList.add(questionbank);

                examDao.importExamInfoExamDao(questionbankList);
            }
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }

        return path;
    }

    @Override
    public void saveinfointogradeExamService(Grade grade, Classes classes, Testpaper testpaper) {
        examDao.saveinfointogradeExamDao(grade,classes,testpaper);
        return;
    }

    @Override
    public Testpaper updateTestpaperExamService(Testpaper testpaper,String cname) {
         examDao.updateTestpaperExamDao(testpaper,cname);
        return testpaper;
    }

    @Override
    public Testpaper updateTestpaperByTidExamService(Integer tid) {
        return examDao.updateTestpaperByTidExamDao(tid);
    }

    @Override
    public Grade selectGradeendInfoExamService() {
        return examDao.selectGradeendInfoExamDao();
    }

    @Override
    public void updateGradeExamService(Grade grade) {
        examDao.updateGradeExamDao(grade);
        return;
    }

    @Override
    public void updatetestpapertstateExamService(Testpaper testpaper, Integer tid) {
        examDao.updatetestpapertstateExamDao(testpaper, tid);
        return;
    }
}
