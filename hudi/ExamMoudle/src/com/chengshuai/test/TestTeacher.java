package com.chengshuai.test;

import com.chengshuai.bean.Questionbank;
import com.chengshuai.bean.Teachers;
import com.chengshuai.bean.Testpaper;
import com.chengshuai.dao.QuestionbankDao;
import com.chengshuai.dao.QuestionbankDaoImpl;
import com.chengshuai.dao.TeachersDao;
import com.chengshuai.dao.TeachersDaoImpl;
import com.chengshuai.service.TeacherService;
import com.chengshuai.service.TeacherServiceImpl;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.helpers.XSSFXmlColumnPr;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by Administrator on 2017/11/23.
 */
public class TestTeacher {
    public static void main(String[] args) {
        Integer sum1 = 0;//单选简单题题数
        Integer sum2 = 1;//单选一般题题数
        Integer sum3 = 2;//单选困难题题数
        Integer sum4 = 4;//多选简单题题数
        Integer sum5 = 5;//多选一般题题数
        Integer sum6 = 6;//多选困难题题数

        QuestionbankDao dao = new QuestionbankDaoImpl();
        Integer totalsum = sum1 + sum2 + sum3 + sum4 + sum5 + sum6;//总题数

        Integer[] questionid = new Integer[totalsum];

        TestTeacher testTeacher = new TestTeacher();
        int index = 0;

        if (sum1 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(0);
            testTeacher.findquestionIdBylist(questionbankList,sum1,index,questionid);
        }
        if (sum2 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(1);
            testTeacher.findquestionIdBylist(questionbankList,sum1,index,questionid);
        }
        if (sum3 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(2);
            testTeacher.findquestionIdBylist(questionbankList,sum1,index,questionid);

        }
        if (sum4 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(3);
            testTeacher.findquestionIdBylist(questionbankList,sum1,index,questionid);
        }
        if (sum5 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(4);
            testTeacher.findquestionIdBylist(questionbankList,sum1,index,questionid);
        }
        if (sum6 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(5);
            testTeacher.findquestionIdBylist(questionbankList,sum1,index,questionid);
        }



    }

    public void findquestionIdBylist(List<Questionbank> questionbankList,
                                          int sum, int index, Integer []questionid) {
        // 在list下面  查找题号  sum1
        Integer listsize = questionbankList.size();
        while (true) {

            boolean flg = true;
            Random random = new Random(System.currentTimeMillis());
            Integer radint = random.nextInt(listsize);

            for (int i = 0; i < index; i++) {
                if (questionid[i] == radint) {
                    flg = false;
                    break;
                }








            }

            if (flg == false) {
                continue;
            }

            Questionbank questionbank = questionbankList.get(radint);
            questionid[index] = questionbank.getQid();
            index++;
            sum--;
            if (sum == 0) {
                break;
            }
        }
     }
}
