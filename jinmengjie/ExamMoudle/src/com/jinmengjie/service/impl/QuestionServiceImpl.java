package com.jinmengjie.service.impl;

import com.jinmengjie.bean.Questionbank;
import com.jinmengjie.bean.Subject;
import com.jinmengjie.dao.QuetionBankDao;
import com.jinmengjie.dao.SubjectDao;
import com.jinmengjie.dao.impl.QuetionBankDaoImpl;
import com.jinmengjie.dao.impl.SubjectDaoImpl;
import com.jinmengjie.service.QuestionbankService;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/5/005.
 */
public class QuestionServiceImpl implements QuestionbankService {
    private QuetionBankDao quetionBankDao = new QuetionBankDaoImpl();

    @Override
    public List<Questionbank> selectAllInfoBySuid(Integer suid) {

        List<Questionbank> questionbankList = quetionBankDao.selectAllInfoBySuid(suid);
        if (questionbankList.size() == 0 || questionbankList == null) {
            return null;
        } else {
            return questionbankList;
        }
    }

    @Override
    public void insertOrUpdate(Questionbank questionbank) {
        quetionBankDao.insertOrUpdate(questionbank);
    }

    //试题导入
    @Override
    public void uploadquestioninfo(String path) {
        System.out.println("38=" + path);
        List<Questionbank> questionbankList = new ArrayList<Questionbank>();
        try {
            InputStream inputStream = new FileInputStream(path);
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);
            XSSFSheet xssfSheet = xssfWorkbook.getSheet("Sheet1");
            XSSFRow xssfRow;
            XSSFCell xssfCell;

            for (int i = 1; i <= xssfSheet.getLastRowNum(); i++) {
                xssfRow = xssfSheet.getRow(i);
                xssfCell = xssfRow.getCell(0);
                Integer qtype = (int) xssfCell.getNumericCellValue();
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
                Subject subject = subjectDao.selectSubjectBysucourse(qchapter);
                System.out.println(subject.getSuid());
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
            quetionBankDao.insert(questionbankList);
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
        return;
    }
}