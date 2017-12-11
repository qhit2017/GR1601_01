package com.yanlihua.test;

import com.yanlihua.bean.Questionbank;
import com.yanlihua.bean.Testpaper;
import com.yanlihua.dao.CreatepaperDao;
import com.yanlihua.dao.QuestionBankDao;
import com.yanlihua.dao.impl.CreatepaperDaoImpl;
import com.yanlihua.dao.impl.QuestionBankDaoImpl;
import com.yanlihua.service.impl.CreatepaperServiceImpl;

import java.util.List;
import java.util.Random;

/**
 * Created by 晏利花 on 2017/12/7.
 */
public class Test2 {


    public static void main(String[] args) {
        CreatepaperDao createpaperDao = new CreatepaperDaoImpl();
        Testpaper testpaper=new Testpaper();
        testpaper.setTtype("笔试");
        testpaper.setTstate("未开考");

        Integer ojd = 1;//单选简单题题数
        Integer oyb = 1;//单选一般题题数
        Integer okn = 1;//单选困难题题数
        Integer mjd = 1;//多选简单题题数
        Integer myb = 1;//多选一般题题数
        Integer mkn = 1;//多选困难题题数
        //总题数
        Integer totalsum=ojd+oyb+okn+mjd+myb+mkn;
        //根据总数量定义数组长度
        Integer[] questionid=new Integer[totalsum];

        int index = 0;
        //调用dao查询符合条件随机生成的题
        QuestionBankDao questionBankDao=new QuestionBankDaoImpl();
        //判断不同类型题选择的题数

        if (ojd!=0){
            //flg中的数是daoimpl中规定（如果是0就是查询单选简单题）
            List<Questionbank> questionbankList= questionBankDao.selectQuestion(0);
            index= Test2.findQuestionQidBylist(questionbankList,ojd,index,questionid);
        }
        if (oyb!=0){
            //flg中的数是daoimpl中规定（如果是1就是查询单选一般题）
            List<Questionbank> questionbankList= questionBankDao.selectQuestion(1);
            index=Test2.findQuestionQidBylist(questionbankList,oyb,index,questionid);
        }
        if (okn!=0){
            //flg中的数是daoimpl中规定（如果是2就是单选困难题）
            List<Questionbank> questionbankList= questionBankDao.selectQuestion(2);
            index=Test2.findQuestionQidBylist(questionbankList,okn,index,questionid);
        }
        if (mjd!=0){
            //flg中的数是daoimpl中规定（如果是3就是多选简单题）
            List<Questionbank> questionbankList= questionBankDao.selectQuestion(3);
            index=Test2.findQuestionQidBylist(questionbankList,mjd,index,questionid);
        }
        if (myb!=0){
            //flg中的数是daoimpl中规定（如果是4就是查询多选一般题）
            List<Questionbank> questionbankList= questionBankDao.selectQuestion(4);
            index=Test2.findQuestionQidBylist(questionbankList,myb,index,questionid);
        }
        if (mkn!=0){
            //flg中的数是daoimpl中规定（如果是5就是查询多选困难题）
            List<Questionbank> questionbankList= questionBankDao.selectQuestion(5);
            index=Test2.findQuestionQidBylist(questionbankList,mkn,index,questionid);
        }
        //createpaperDao.insertTestPareperCreatepaperDao(testpaper,questionid);
        for (int i=0;i<questionid.length;i++){
            System.out.println(questionid[i]);
        }
    }

    //根据数据条件随机无重复生成相应的qid号
    public static int findQuestionQidBylist(List<Questionbank> questionbankList,int sum,int index,Integer[] questionid){
        //在list下面  查询题号
        //判断符合条件下有多少道题
        Integer listsize=questionbankList.size();
        //死循环（需要标识符协助来一步步跳出循环）
        while (true){
            boolean tag = true;
            //设定随机范围
            Random random=new Random(System.currentTimeMillis());
            Integer id=random.nextInt(listsize);//从0----符合条件题数
            //以下循环防止出现重复数据
            for(int i=0;i<index;i++){
                //(questionid[i]第一次取出的qid
                if (questionid[i]  ==id){
                    tag = false;
                    break;
                }
            }
            //此处是跳出while循环
            if (tag==false){
                continue;
            }
            //根据随机出来的题号去查询题
            //根据id取出下标符合条件的题
            Questionbank questionbank=questionbankList.get(id);
            //查询出题的qid
            questionid[index]=questionbank.getQid();

            //依据循环（下标不断增加;取出一道，题数减少一道）
            index++;
            sum--;
            if (sum==0){
                break;
            }
        }
        return index;

    }
}
