package com.wangyinghao.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by 金梦杰 on 2017/11/24/024.
 */
public class test {
    public static void main(String[] args) {
        Date date = new Date();
        SimpleDateFormat format0 = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
        String time = format0.format(date.getTime())+"____" ;//这个就是把时间戳经过处理得到期望格式的时间
        System.out.println("格式化结果0：" + time);


    }
}
