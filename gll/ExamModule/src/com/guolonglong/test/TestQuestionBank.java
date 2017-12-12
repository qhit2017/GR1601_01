package com.guolonglong.test;

import com.guolonglong.bean.QuestionBank;
import com.guolonglong.bean.Subject;
import com.guolonglong.dao.QuestionBankDao;
import com.guolonglong.dao.impl.QuestionBankDaoImpl;

import java.util.List;

/**
 * Created by lenovo on 2017/12/6.
 */
public class TestQuestionBank {
    public static void main(String[] args) {
        QuestionBankDao dao = new QuestionBankDaoImpl();
        List<QuestionBank> questionBankList = dao.selectQuestionBankList();

         for (QuestionBank q : questionBankList){
             System.out.println(q.getQtype());
         }


    }
}
