package com.yanlihua.test;

import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Testpaper;
import com.yanlihua.dao.QuestionBankDao;
import com.yanlihua.dao.impl.QuestionBankDaoImpl;
import com.yanlihua.service.CreatepaperService;
import com.yanlihua.service.impl.CreatepaperServiceImpl;

import java.util.List;
import java.util.Random;

/**
 * Created by Administrator on 2017/11/23.
 */
public class Test1 {
    public static void main(String[] args) {
       Integer sum1 = 1;//单选简单题题数
        Integer sum2 = 1;//单选一般题题数
        Integer sum3 = 1;//单选困难题题数
        Integer sum4 = 1;//多选简单题题数
        Integer sum5 = 1;//多选一般题题数
        Integer sum6 = 1;//多选困难题题数

        QuestionBankDao dao = new QuestionBankDaoImpl();
        Integer totalsum = sum1 + sum2 + sum3 + sum4 + sum5 + sum6;//总题数

        //总数组的长度
        Integer[] questionid = new Integer[totalsum];

        Test1 testTeacher = new Test1();
        int index = 0;


        if (sum1 != 0) {
            //查询单选简单的题
            List<Questionbank> questionbankList = dao.selectQuestion(0);
            //调用随机生成(questionbankList所有单选简单的题，sum1查询个数 )
            index=testTeacher.findquestionIdBylist(questionbankList, sum1, index, questionid);

        }
        if (sum2 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(1);
            index=testTeacher.findquestionIdBylist(questionbankList, sum2, index, questionid);

        }
        if (sum3 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(2);
            index=testTeacher.findquestionIdBylist(questionbankList, sum3, index, questionid);

        }
        if (sum4 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(3);
            index=testTeacher.findquestionIdBylist(questionbankList, sum4, index, questionid);

        }
        if (sum5 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(4);
            index=testTeacher.findquestionIdBylist(questionbankList, sum5, index, questionid);

        }
        if (sum6 != 0) {
            List<Questionbank> questionbankList = dao.selectQuestion(5);
            index= testTeacher.findquestionIdBylist(questionbankList, sum6, index, questionid);

        }
        /*for (int i=0;i<questionid.length;i++){
            System.out.println(questionid[i]);
        }



        */


        Testpaper testpaper = new Testpaper();
        testpaper.setTtype("笔试1");
        CreatepaperService createpaperService = new CreatepaperServiceImpl();
        //createpaperService.insertrandomTestPareperCreatepaperService(testpaper,questionid);
    }

    public int  findquestionIdBylist(List<Questionbank> questionbankList,
                                     int sum, int index, Integer[] questionid) {
        // 在list下面  查找题号  sum1  index是下标(取出questionbankList中的qid)
        Integer listsize = questionbankList.size();
        while (true) {
            //标识符
            boolean flg = true;
            Random random = new Random(System.currentTimeMillis());
            Integer radint = random.nextInt(listsize);//0--listsize中随机生成随机数

            for (int i = 0; i < index; i++) {
                if (questionid[i] == radint) {//防止取出重复qid
                    flg = false;
                    break;
                }
            }

            if (flg == false) {
                continue;
            }

            Questionbank questionbank = questionbankList.get(radint);
            //随机生成的几道题
            questionid[index] = questionbank.getQid();

            index++;
            sum--;
            if (sum == 0) {
                break;
            }

        }
        return index;


    }
}
