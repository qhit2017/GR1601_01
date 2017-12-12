package com.chengshuai.controller;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.swing.plaf.synth.SynthOptionPaneUI;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Created by Administrator on 2017/12/4.
 */
public class FileDownController extends ActionSupport {
    private String filename;
    private InputStream inputStream;

    public String filedown(){
        return "success";
    }

    public String InputStream  () {
        System.out.println("getInputStream");
        //找到filename完整路径
        String path = ServletActionContext.getServletContext().getRealPath("/file");
        String filepath = path+"\\"+filename;

        try {
            InputStream inputStream1 = new FileInputStream(filepath);
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream1);
            return "bufferedInputStream";

        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
