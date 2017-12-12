package com.zhanglong.service.impl;

import com.zhanglong.bean.Classes;
import com.zhanglong.bean.Questionbank;
import com.zhanglong.bean.Students;
import com.zhanglong.bean.Subject;
import com.zhanglong.dao.QuestionDao;
import com.zhanglong.dao.StudentsDao;
import com.zhanglong.dao.impl.QuestionDaoImpl;
import com.zhanglong.dao.impl.StudentsDaoImpl;
import com.zhanglong.service.QuestionService;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/5 0005.
 */
public class QuestionServiceImpl implements QuestionService {
   private QuestionDao dao=new QuestionDaoImpl();
    @Override
    public List<Subject> selectchaxunBySudirectionandSustage(String sudirection, String sustage) {
       return dao.selectchaxunBySudirectionandSustage(sudirection,sustage);
    }

    @Override
    public List<Questionbank> selectshumu(Integer suid) {
         return dao.selectshumu(suid);
    }

    @Override
    public Subject selectname(Integer suid) {
        return dao.selectname(suid);
    }

    @Override
    public List<Questionbank> selectAllxinxi() {
        return dao.selectAllxinxi();
    }

    @Override
    public Questionbank selectQuestionbankByqid(Integer qid) {
        return dao.selectQuestionbankByqid(qid);
    }

    @Override
    public void shanxhuQuestionbank(Questionbank questionbank) {
        dao.shanxhuQuestionbank(questionbank);
        return;
    }

    @Override
    public void saveorupdatequestionbank(Questionbank questionbank) {
        dao.saveorupdatequestionbank(questionbank);
        return;
    }

    @Override
    public String daoruquestion(String path) {
        String filepath=path+"\\"+"question1.xlsx";
        try {
            InputStream inputStream = new FileInputStream(filepath);

            XSSFWorkbook xssfWorkbook=new XSSFWorkbook(inputStream);
            //从excel取到sheet
            XSSFSheet xssfSheet=xssfWorkbook.getSheet("Sheet1");

            for (int i=1;i<=xssfSheet.getLastRowNum();i++){
                XSSFRow xssfRow = xssfSheet.getRow(i);
                /*//从row中取到cell
                XSSFCell id = xssfRow.getCell(0);//这取到的只是单元格
                Integer sid = (int) id.getNumericCellValue();*/

                XSSFCell type = xssfRow.getCell(0);
                Integer qtype=(int)type.getNumericCellValue();


                XSSFCell content = xssfRow.getCell(1);
                String qcontent = content.getStringCellValue();

                XSSFCell qaa = xssfRow.getCell(2);
                String qa = qaa.getStringCellValue();

                XSSFCell qbb = xssfRow.getCell(3);
                String qb = qbb.getStringCellValue();

                XSSFCell qcc = xssfRow.getCell(4);
                String qc = qcc.getStringCellValue();

                XSSFCell qdd = xssfRow.getCell(5);
                String qd = qdd.getStringCellValue();

                XSSFCell answer = xssfRow.getCell(6);
                String qanswer = answer.getStringCellValue();

                XSSFCell difficulty = xssfRow.getCell(7);
                String qdifficulty = difficulty.getStringCellValue();


                System.out.println(qtype + ";" + qcontent + ";" + qa+ ";"+ qb + ";" + qc + ";" + qd+ ";" + qanswer+ ";"+ qdifficulty);
                Questionbank questionbank=new Questionbank();

                questionbank.setQtype(qtype);
                questionbank.setQcontent(qcontent);
                questionbank.setQa(qa);
                questionbank.setQb(qb);
                questionbank.setQc(qc);
                questionbank.setQd(qd);
                questionbank.setQanswer(qanswer);
                questionbank.setQdifficulty(qdifficulty);

                List<Questionbank> questionbankList=new ArrayList<Questionbank>();
                questionbankList.add(questionbank);
                dao.daoruquestion(questionbankList);

            }}
        catch (IOException e) {
            e.printStackTrace();
        }
        return filepath;
    }
}
