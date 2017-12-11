package com.guolonglong.controller;

import com.guolonglong.bean.Teachers;
import com.guolonglong.service.PageService;
import com.guolonglong.service.impl.PageServiceImpl;
import com.guolonglong.util.Page;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;


import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by lenovo on 2017/11/30.
 */
public class PageController extends ActionSupport {
    private Integer pageSize;
    private Integer pageIndex;

    PageService service = new PageServiceImpl();
    //取session
    HttpSession session = ServletActionContext.getRequest().getSession();
    public String allpage(){
        //判断   并设置默认值
        if(pageSize==null){
            pageSize=5;
        }
        if (pageIndex==null){
            pageIndex=1;
        }
        //获取 totalCount
        List<Teachers> teachersList = service.selectTeachersTotalCountList();
        Integer pageCount = teachersList.size();

        //new Page
        Page page = new Page();
        page.setTotalCount(pageCount);
        page.setPageSize(pageSize);
        page.setPageIndex(pageIndex);

        //第二次从查询结果
        List<Teachers> teachersShowList = service.selectTeachersBydataStartAnddataEnd(page.getDataStart(),page.getDataEnd());

        session.setAttribute("page", page);
        session.setAttribute("teachersShowList",teachersShowList);
            return "teachers";
    }


    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }
}
