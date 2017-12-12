package com.guolonglong.test;

import com.guolonglong.bean.TestPaper;
import com.guolonglong.service.TestPaperService;
import com.guolonglong.service.impl.TestPaperServiceImpl;

import java.util.List;

/**
 * Created by lenovo on 2017/12/10.
 */
public class TtestPaper {
    public static void main(String[] args) {
        TestPaperService testPaperService = new TestPaperServiceImpl();
        List<TestPaper> testPaperList = testPaperService.selectTestPaperList();
        for (TestPaper tp:testPaperList){
            System.out.println();
        }
    }
}
