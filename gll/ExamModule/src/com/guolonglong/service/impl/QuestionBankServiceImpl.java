package com.guolonglong.service.impl;

import com.guolonglong.bean.QuestionBank;
import com.guolonglong.bean.Subject;
import com.guolonglong.dao.QuestionBankDao;
import com.guolonglong.dao.impl.QuestionBankDaoImpl;
import com.guolonglong.service.QuestionBankService;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2017/12/6.
 */
public class QuestionBankServiceImpl implements QuestionBankService {
    QuestionBankDao questionBankDao = new QuestionBankDaoImpl();

    @Override
    public List<Subject> selectSubjectSuidCount(String sudirection, String sustage) {
        return questionBankDao.selectSubjectSuidCount(sudirection,sustage);
    }

    @Override
    public List<QuestionBank> selectQuestionBankBySucourse(String sucourse) {
        return questionBankDao.selectQuestionBankBySucourse(sucourse);
    }

    @Override
    public List<QuestionBank> selectQuestionBankBySuid(Integer suid) {
        return questionBankDao.selectQuestionBankBySuid(suid);
    }

    @Override
    public String questionbankImport(String path) {
        List<QuestionBank> questionBankList = new ArrayList<QuestionBank>();
        String filepath = path+"\\"+"questionbank.xlsx";
        try {
            InputStream inputStream = new FileInputStream(filepath);
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);
            XSSFSheet sheet = xssfWorkbook.getSheet("sheet1");
            for (int i=1;i<=sheet.getLastRowNum();i++){
                XSSFRow row = sheet.getRow(i);
                System.out.println("6666");
                XSSFCell cell = row.getCell(0);
                String qtype = cell.getStringCellValue();
                XSSFCell cell1 = row.getCell(1);
                String qcontent = cell1.getStringCellValue();
                XSSFCell cell2 = row.getCell(2);
                String qa = cell2.getStringCellValue();
                XSSFCell cell3 = row.getCell(3);
                String qb = cell3.getStringCellValue();
                XSSFCell cell4 = row.getCell(4);
                String qc = cell4.getStringCellValue();
                XSSFCell cell5 = row.getCell(5);
                String qd = cell5.getStringCellValue();
                XSSFCell cell6 = row.getCell(6);
                String qanswer = cell6.getStringCellValue();
                XSSFCell cell7 = row.getCell(7);
                String qdifficulty = cell7.getStringCellValue();
                XSSFCell cell8 = row.getCell(8);
                String qchapter = cell8.getStringCellValue();


                QuestionBank questionBank = new QuestionBank();

                questionBank.setQtype(qtype);
                questionBank.setQcontent(qcontent);
                questionBank.setQa(qa);
                questionBank.setQb(qb);
                questionBank.setQc(qc);
                questionBank.setQd(qd);
                questionBank.setQanswer(qanswer);
                questionBank.setQdifficulty(qdifficulty);
                questionBank.setQchapter(qchapter);
                questionBankList.add(questionBank);
            }
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
        questionBankDao.questionbankImport(questionBankList);
        return filepath;
    }

    @Override
    public List<QuestionBank> selectQuestionBankList() {
        return questionBankDao.selectQuestionBankList();
    }

    @Override
    public QuestionBank crearePaperByQid(Integer qid) {
        return questionBankDao.crearePaperByQid(qid);
    }
}
