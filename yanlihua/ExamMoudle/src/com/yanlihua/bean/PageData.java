package com.yanlihua.bean;

import java.io.Serializable;

/**
 * Created by 晏利花 on 2017/11/27.
 */
public class PageData implements Serializable{
    //数据总数
    private Integer totalCount;

    //每一页显示的条数
    private Integer pageSize;

    //总页数
    private Integer pageCount;

    //当前页号
    private Integer pageIndex;

    //是否有上一页
    private boolean uppage;

    //是否有下一页
    private boolean nextpage;

    //数据开始位置
    private Integer dataStart;

    //数据结束位置
    private Integer dataEnd ;

    public PageData(Integer totalCount, Integer pageSize, Integer pageCount, Integer pageIndex, boolean uppage, boolean nextpage, Integer dataStart, Integer dataEnd) {
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.pageCount = pageCount;
        this.pageIndex = pageIndex;
        this.uppage = uppage;
        this.nextpage = nextpage;
        this.dataStart = dataStart;
        this.dataEnd = dataEnd;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public boolean isUppage() {
        return uppage;
    }

    public void setUppage(boolean uppage) {
        this.uppage = uppage;
    }

    public boolean isNextpage() {
        return nextpage;
    }

    public void setNextpage(boolean nextpage) {
        this.nextpage = nextpage;
    }

    public Integer getDataStart() {
        return dataStart;
    }

    public void setDataStart(Integer dataStart) {
        this.dataStart = dataStart;
    }

    public Integer getDataEnd() {
        return dataEnd;
    }

    public void setDataEnd(Integer dataEnd) {
        this.dataEnd = dataEnd;
    }
}
