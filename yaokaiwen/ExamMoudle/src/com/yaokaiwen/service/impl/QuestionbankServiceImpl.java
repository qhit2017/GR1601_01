package com.yaokaiwen.service.impl;

import com.yaokaiwen.bean.Questionbank;
import com.yaokaiwen.bean.Subject;
import com.yaokaiwen.dao.QuestionbankDao;
import com.yaokaiwen.dao.SubjectDao;
import com.yaokaiwen.dao.impl.QuestionbankDaoImpl;
import com.yaokaiwen.dao.impl.SubjectDaoImpl;
import com.yaokaiwen.service.QuestionbankService;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by DELL on 2017/12/5.
 */
public class QuestionbankServiceImpl implements QuestionbankService {
    private QuestionbankDao questionbankDao = new QuestionbankDaoImpl();

    @Override
    public String selectnumberBySuidService(Integer suid) {
        String number = questionbankDao.selectnumberBySuid(suid);
         if(number==null||number==""){
             return null;
         }else {
             return number;
         }
    }

    @Override
    public List<Questionbank> selectQuestionbankBySuidService(Integer suid) {
        List<Questionbank> list = questionbankDao.selectQuestionbankBySuid(suid);
        if(list==null||list.size()<=0){
            return null;
        }else {
            return list;
        }
    }

    @Override
    public void fileupInsertQuestionService(String filepath) {
        System.out.println("38="+filepath);
        List<Questionbank>questionbankList = new ArrayList<Questionbank>();
        try {
            InputStream inputStream = new FileInputStream(filepath);
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);
            XSSFSheet xssfSheet = xssfWorkbook.getSheet("Sheet1");
            XSSFRow xssfRow;
            XSSFCell xssfCell;
            for (int i=1;i<=xssfSheet.getLastRowNum();i++){
                xssfRow = xssfSheet.getRow(i);
                xssfCell = xssfRow.getCell(0);
                Integer qtype =(int)xssfCell.getNumericCellValue();
                xssfCell = xssfRow.getCell(1);
                String qcontent = xssfCell.getStringCellValue();
                xssfCell = xssfRow.getCell(2);
                String qa = xssfCell.getRawValue();
                xssfCell = xssfRow.getCell(3);
                String qb = xssfCell.getRawValue();
                xssfCell = xssfRow.getCell(4);
                String qc = xssfCell.getRawValue();
                xssfCell = xssfRow.getCell(5);
                String qd = xssfCell.getRawValue();
                xssfCell = xssfRow.getCell(6);
                String qanswer = xssfCell.getStringCellValue();
                xssfCell = xssfRow.getCell(7);
                String qdifficulty = xssfCell.getStringCellValue();
                xssfCell = xssfRow.getCell(8);
                String qchapter = xssfCell.getStringCellValue();
                SubjectDao subjectDao = new SubjectDaoImpl();
                Subject subject = subjectDao.selectSubjectBySucourse(qchapter);
                Questionbank questionbank = new Questionbank();
                questionbank.setQtype(qtype);
                questionbank.setQcontent(qcontent);
                questionbank.setQa(qa);
                questionbank.setQb(qb);
                questionbank.setQc(qc);
                questionbank.setQd(qd);
                questionbank.setQanswer(qanswer);
                questionbank.setQdifficulty(qdifficulty);
                questionbank.setQchapter(qchapter);
                questionbank.setSuid(subject);
                questionbankList.add(questionbank);
            }
            questionbankDao.insertsavequestionbanks(questionbankList);
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void insertQuestionSerice(Questionbank questionbank) {
        questionbankDao.insertOrUpdate(questionbank);
        return ;
    }
}
