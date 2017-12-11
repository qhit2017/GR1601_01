package com.yaokaiwen.util;

import com.yaokaiwen.bean.Dtnumber;
import com.yaokaiwen.bean.Questionbank;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by DELL on 2017/12/10.
 */
public class RandomPaper {
    private static Set<Questionbank> questionbankSet = new HashSet<Questionbank>();

    public static Set<Questionbank> randomquestion(Dtnumber dtnumber){


        return questionbankSet;
    }

    public void findquestionIdBylist(List<Questionbank> questionbankList, int sum, int index, Integer []questionid) {


    }
}
