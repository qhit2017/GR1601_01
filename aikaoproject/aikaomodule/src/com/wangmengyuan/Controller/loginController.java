package com.wangmengyuan.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.wangmengyuan.Service.loginService;
import com.wangmengyuan.Service.loginServiceImpl;
import com.wangmengyuan.bean.Students;
import com.wangmengyuan.bean.Teachers;

import java.util.List;

/**
 * Created by Administrator on 2017/12/4.
 */
public class loginController extends ActionSupport {
    private String uname;
    private String upwd;
    private String loginselect;

    public String login() {
        loginService loginService =new loginServiceImpl();
      /*  HttpSession session = ServletActionContext.getRequest().getSession();*/

        if (loginselect.equals("0")){
            return "hi";
        }
        else if (loginselect.equals("1")){
            List<Teachers> teachersList = loginService.querynameAndpassword(uname,upwd);
            if (teachersList==null||teachersList.size()==0){
                return "fail";
            }else {
               /*Teachers teachers=teachersList.get(0);
               session.getAttribute("loginuser",teachers);*/
                return "hi";
            }

        }
        else if (loginselect.equals("2")){
            List<Students> studentsList  = loginService.querysnameAndspassword(uname,upwd);
            if (studentsList==null||studentsList.size()==0){
                return "fail";
            }else {
              /*  Students students=studentsList.get(0);
                session.getAttribute("loginuser",students);
*/
                return "hi";
            }
        }
        return "";
    }


    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getLoginselect() {
        return loginselect;
    }

    public void setLoginselect(String loginselect) {
        this.loginselect = loginselect;
    }
}
