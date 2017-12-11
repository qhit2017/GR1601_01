package com.yaokaiwen.util;

import org.apache.commons.io.FileUtils;

import java.io.*;

/**
 * Created by DELL on 2017/12/5.
 */
public class Upfile {
    //upload上传的文件 uploadFileName上传文件名 file文件夹的路径
    public String UpFileCreate(File upload,String uploadFileName,String path){
        //文件路径
        String filepath = path+"\\"+uploadFileName;
        //创建文件
        File desfile = new File(path,uploadFileName);
        try {
            //把数据写到文件里
            FileUtils.copyFile(upload,desfile);
            return filepath;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
    public InputStream GetFileDown(String filepath){
        try {
            InputStream inputStream1 =inputStream1 = new FileInputStream(filepath);
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream1);
            return bufferedInputStream;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
}
