package com.zhanglong.test;

import com.zhanglong.bean.Questionbank;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import sun.applet.Main;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/9 0009.
 */
public class test12 {
    public static void main(String[] args) {
        String filepath="C:\\Users\\Administrator\\Desktop\\question1.xlsx";
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
                /*String qtype=type.getStringCellValue();*/


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

               /* XSSFCell chapter = xssfRow.getCell(9);
                String qchapter = chapter.getStringCellValue();*/

                System.out.println(qtype + ";" + qcontent + ";" + qa+ ";"+ qb + ";" + qc + ";" + qd+ ";" + qanswer+ ";"+ qdifficulty );
                /*Questionbank questionbank=new Questionbank();
                questionbank.setQtype(qtype);
                questionbank.setQcontent(qcontent);
                questionbank.setQa(qa);
                questionbank.setQb(qb);
                questionbank.setQc(qc);
                questionbank.setQd(qd);
                questionbank.setQanswer(qanswer);
                questionbank.setQdifficulty(qdifficulty);
                questionbank.setQchapter(qchapter);

                List<Questionbank> questionbankList=new ArrayList<Questionbank>();
                questionbankList.add(questionbank);
                dao.daoruquestion(questionbankList);
*/
            }}
        catch (IOException e) {
            e.printStackTrace();
        }

    }
}
