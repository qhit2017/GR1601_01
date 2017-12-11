package com.yaokaiwen.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yaokaiwen.bean.Classes;
import com.yaokaiwen.bean.Teachers;
import com.yaokaiwen.service.ClassesService;
import com.yaokaiwen.service.impl.ClassesServiceImpl;
import com.yaokaiwen.util.Page;
import com.yaokaiwen.util.Tnumber;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
/**
 * Created by DELL on 2017/11/26.
 */
public class ClassesController extends ActionSupport implements ModelDriven{
    private JSONArray jsonArray;
    private JSONObject jsonObject;
    private String jsonstring;
    private String jsonpage;
    private Integer pageindex;
    private HttpSession httpSession = ServletActionContext.getRequest().getSession();
    private Page p = new Page();
    private ClassesService classesService = new ClassesServiceImpl();
    private Classes classes = new Classes();
    private Integer idl;
    private Integer idh;
    private Integer id;
//查询所有班级信息
    public String selectclassesallinfo(){
        List<Classes> classesList = classesService.selectClassesAllService();
        if(classesList!=null&&classesList.size()>0){
            Integer totalCount = classesList.size();
            if(pageindex==null){
                pageindex = 1;
            }
            p.page(totalCount,10,pageindex);
            ArrayList<Classes> list = new ArrayList<Classes>();
            for(int i=p.getDataStart()-1;i<p.getDataEnd();i++){
                Classes c = classesList.get(i);
                list.add(c);
            }
            jsonArray = JSONArray.fromObject(list);
            httpSession.setAttribute("page",p);
            jsonstring = jsonArray.toString();
        }
        return "jsonstring";
    }
    //分页
    public String getPage() {
        p = (Page) httpSession.getAttribute("page");
        jsonpage = JSONObject.fromObject(p).toString();
        return "jsonpage";
    }
    //讲师下拉框 查询所有讲师
    public String selecttidltname(){
        List<Teachers> teachersList = classesService.selecttidltname();
        if(teachersList!=null&&teachersList.size()>0){
            jsonstring = JSONArray.fromObject(teachersList).toString();
        }
        return "jsonstring";
    }
    //班主任下拉框 查询所有班主任
    public String selecttidhtname(){
        List<Teachers> teachersList = classesService.selecttidhtname();
        if(teachersList!=null&&teachersList.size()>0){
            jsonstring = JSONArray.fromObject(teachersList).toString();
        }
        return "jsonstring";
    }
    //查询开班日期
    public String selectcbegin(){
        List<Classes> classesList = classesService.selectdistinctcbeginService();
        if (classesList!=null&&classesList.size()>0){
            jsonstring = JSONArray.fromObject(classesList).toString();
        }
        return "jsonstring";
    }
    //分页查询班级信息
    public String selectclassesinfo(){
        List<Classes> classesList =classesService.selectClassesAllByService(classes,idl,idh);
        if(classesList!=null && classesList.size()>0){
            Integer totalCount = classesList.size();
            if(pageindex==null){
                pageindex = 1;
            }
            p.page(totalCount,10,pageindex);
            ArrayList<Classes> list = new ArrayList<Classes>();
            for(int i=p.getDataStart()-1;i<p.getDataEnd();i++){
                Classes c = classesList.get(i);
                list.add(c);
            }
            jsonArray = JSONArray.fromObject(list);
            httpSession.setAttribute("page",p);
            jsonstring = jsonArray.toString();
        }

        return "jsonstring";
    }
    //根据id查询班级
    public String selectbycid(){
        classes = classesService.selectClassesByCidService(id);
        return "selectbycid";
    }
    //添加班级
    public String insertorupdateclasses(){
        classesService.insertorupdateService(classes);
        return "classlist";
    }

    @Override
    public Object getModel() {
        return classes;
    }

    public String getJsonstring() {
        return jsonstring;
    }

    public void setJsonstring(String jsonstring) {
        this.jsonstring = jsonstring;
    }

    public String getJsonpage() {
        return jsonpage;
    }

    public void setJsonpage(String jsonpage) {
        this.jsonpage = jsonpage;
    }

    public Integer getPageindex() {
        return pageindex;
    }

    public void setPageindex(Integer pageindex) {
        this.pageindex = pageindex;
    }

    public Integer getIdl() {
        return idl;
    }

    public void setIdl(Integer idl) {
        this.idl = idl;
    }

    public Integer getIdh() {
        return idh;
    }

    public void setIdh(Integer idh) {
        this.idh = idh;
    }

    public Page getP() {
        return p;
    }

    public void setP(Page p) {
        this.p = p;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
