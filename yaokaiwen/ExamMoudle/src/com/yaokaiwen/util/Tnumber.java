package com.yaokaiwen.util;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by DELL on 2017/11/26.
 */
public class Tnumber {
//获取日期前八位 （20170329）
    public String date1(){
        //Calendar calendar = Calendar.getInstance();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        // s = calendar.get(Calendar.YEAR)+""+(calendar.get(Calendar.MONTH)+1)+""+calendar.get(Calendar.DAY_OF_MONTH);
        String s = simpleDateFormat.format(date);
        return s;
    }
    //根据日期生成账号（20170329001）
    public String date2(){
        Tnumber n = new Tnumber();
        String s = n.date1();
        s = s+"001";
        return s;
    }
    //传账号 生成最新账号+1（20170329002）
    public Long date3(String stnd){
        //Integer i =Integer.parseInt(stnd);
        Long l = Long.parseLong(stnd);
        l = l+1;
        return l;
    }
}
