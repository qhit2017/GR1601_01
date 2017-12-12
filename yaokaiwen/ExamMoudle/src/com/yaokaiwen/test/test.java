package com.yaokaiwen.test;

import com.yaokaiwen.bean.*;
import com.yaokaiwen.dao.*;
import com.yaokaiwen.dao.impl.*;
import com.yaokaiwen.service.LoginService;
import com.yaokaiwen.service.TeachersService;
import com.yaokaiwen.service.impl.LoginServiceImpl;
import com.yaokaiwen.service.impl.TeachersServiceImpl;
import com.yaokaiwen.util.Page;
import com.yaokaiwen.util.Tnumber;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by DELL on 2017/11/24.
 */
public class test {
    public static void main(String[] args) {
        TestpaperDao testpaperDao = new TestpaperDaoImpl();
        List<Testpaper> list =testpaperDao.selecttestpaper(1,null);
        for(Testpaper t : list){
            System.out.println(t.getTid()+"  "+t.getSuid().getSuid());
        }
    }
}
