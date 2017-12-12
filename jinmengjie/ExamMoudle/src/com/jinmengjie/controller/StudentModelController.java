package com.jinmengjie.controller;

import com.jinmengjie.bean.Classes;
import com.jinmengjie.bean.Students;
import com.jinmengjie.service.ClassesService;
import com.jinmengjie.service.StudentServiceDao;
import com.jinmengjie.service.impl.ClassesServiceImpl;
import com.jinmengjie.service.impl.StudentServiceDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.List;

/**
 * Created by 金梦杰 on 2017/12/1/001.
 */
public class StudentModelController extends ActionSupport implements ModelDriven {
    private StudentServiceDao studentServiceDao = new StudentServiceDaoImpl();
    private ClassesService classesService = new ClassesServiceImpl();
    private  Students students = new Students();
    //定义一个jsonarry数组；
    private JSONArray studentjson;
    //定义一个json字符串；
    private  String jsonstring;

    //学号
    private  String number;
    //姓名
    private  String name;
    //班级名称
    private  Integer classesname;
    //入学年份
    private  String cbeginstudy;
    //就读方向
    private  String studentstudydirection;
    //编辑信息
    private  Integer id;

    //上传图片(定义四个成员变量①定义一个String字符串)
    private File upload;//②上传文件到服务器内存上，和界面File控件相同的变量
    private String uploadFileName;//③上传文件的名字，file控件名字
    private String uploadContenType;//④文件格式



    //学生信息空模板下载(定义两个变量接收页面传过来的值)
    private  String filename;
    private InputStream inputStream;




    //学生界面显示学生的所有信息
    public  String showallstudentinfo(){
        List<Students> studentsList =  studentServiceDao.selectAllStudentInfo();
        if (studentsList.size()!=0||studentsList!=null){
            //返回一个json字符串
           studentjson =  JSONArray.fromObject(studentsList);
        }  ////从控制器到界面只能以字符串的形式传输，所以要把studentjson转化成字符串的形式
        jsonstring = studentjson.toString();
        System.out.println("jsonstring" + jsonstring);

        return "studentmanage";

    }

    //++++++++++++++++++++++++++++++++++++++++上传图片+++++++++++++++++++++++++++++++++++++//
    public  String uploadimg(){
        System.out.println(upload);
        System.out.println(uploadFileName);
        System.out.println(uploadContenType);
        //把upload从内存里---->硬盘写到img文件夹里
        //①、先确定img的相对路径(动态获取相对路径)
      String imgpath =   ServletActionContext.getServletContext().getRealPath("/img");
        //②在img文件夹下创建文件名
        File desFile = new File(imgpath,uploadFileName);
        //upload  把文件内容读出来写到desFile
        try {
            FileUtils.copyFile(upload,desFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //③把图片的路径+图片的名字拼成字符串发回客户端
        String path = "img/"+uploadFileName;
        JSONObject jsonObject = new JSONObject();


        jsonObject.put("path",path);
        jsonstring = jsonObject.toString();

        System.out.println(jsonstring);
        return  "uploadimg";
    }

    //添加学生所有信息
    public  String insertallstudent(){
        System.out.println(students.getSnumber());
        studentServiceDao.saveOrupdateStudentInfo(students);
        return "studentmanage";
    }


    //根据五个条件查询信息
    public  String selectstudentbyfive(){
        List<Students> studentsList =  studentServiceDao.selectSutdentInfoBysnumberOrsnameOrsenterOrcid(number,name,classesname,cbeginstudy,studentstudydirection);
        if (studentsList.size()!=0||studentsList!=null){
            //返回一个json字符串
            studentjson =  JSONArray.fromObject(studentsList);
        }  ////从控制器到界面只能以字符串的形式传输，所以要把studentjson转化成字符串的形式
        jsonstring = studentjson.toString();
        System.out.println("jsonstring" + jsonstring);

        return "studentmanage";

    }

    //根据学生界面动态获取班级信息
    public String getclassesinfo(){
        List<Classes>list = classesService.selectAllClassInfo();
        if (!(list==null||list.size()<=0)){
            jsonstring = JSONArray.fromObject(list).toString();
        }
        return "jsonstring";
    }


    //学生界面点击编辑的功能
    public  String editstudentinfo(){
        System.out.println(id);
        students = studentServiceDao.selectStudentInfoBySid(id);
        System.out.println(JSONArray.fromObject(students).toString());
        return "editstudentinfo";
    }

    //学生界重置密码功能
    public String resetpassword(){
        students = studentServiceDao.selectStudentInfoBySid(id);
        students.setSpassword("88888888");
        studentServiceDao.saveOrupdateStudentInfo(students);

        return "resetpassword";

    }
    //学生界面删除学生信息
    public  String deletestudentinfo(){
        System.out.println(id);
        students = studentServiceDao.selectStudentInfoBySid(id);
        studentServiceDao.deleteStudentObject(students);
        return "deletestudentinfo";
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    //学生页面的学生导出功能
    public  String studentdown(){

        return "success";
    }
    //文件的下载功能
    public  String filedown(){
        return "success";
 }

    public InputStream getInputStream() {

        //学生信息空模板下载
        //①找到filename的完整路径
        String path  = ServletActionContext.getServletContext().getRealPath("/file");
        String filepath = path+ "\\" + filename;
        //②用inputStream向内存里读（是为了把文件写进去）

        //调用service
        studentServiceDao.downloadStudent(path);

        try {
            //先定义一个输入流
            InputStream inputStream1 = new FileInputStream(filepath);
            //再写一个缓冲区流（是为了读文件读的更快）
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream1);
            return  bufferedInputStream;

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }





    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }




    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContenType() {
        return uploadContenType;
    }

    public void setUploadContenType(String uploadContenType) {
        this.uploadContenType = uploadContenType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }

    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getClassesname() {
        return classesname;
    }

    public void setClassesname(Integer classesname) {
        this.classesname = classesname;
    }

    public String getCbeginstudy() {
        return cbeginstudy;
    }

    public void setCbeginstudy(String cbeginstudy) {
        this.cbeginstudy = cbeginstudy;
    }

    public String getStudentstudydirection() {
        return studentstudydirection;
    }

    public void setStudentstudydirection(String studentstudydirection) {
        this.studentstudydirection = studentstudydirection;
    }

    @Override
    public Object getModel() {
        return students;
    }
}
