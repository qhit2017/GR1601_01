package com.guolonglong.util;

/**
 * Created by lenovo on 2017/11/30.
 */
public class Page {

    private Integer totalCount;
    private Integer pageSize;
    private Integer pageCount;
    private Integer pageIndex;
    private boolean pageUp;
    private boolean pageDown;
    private Integer dataStart;
    private Integer dataEnd;


    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public void setPageSize(Integer pageSize) {
        if (this.pageSize==null || this.pageSize<=0){
            this.pageSize=6;
        }
        else {
            this.pageSize = pageSize;
        }
    }

    public Integer getPageCount() {
        if (this.totalCount % this.pageSize == 0){
            this.pageCount=this.totalCount/this.pageSize;
        }
        else {
            this.pageCount=this.totalCount/this.pageSize+1;
        }
        return pageCount;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        if (this.pageIndex==null || this.pageIndex==0){
            this.pageIndex = 1;
        }
        else {
            this.pageIndex = pageIndex;
        }
    }

    public boolean isPageUp() {
        if (this.pageIndex<=1){
            this.pageUp=false;
        }
        else {
            this.pageUp=true;
        }
        return pageUp;
    }

    public boolean isPageDown() {
        if (this.pageIndex>=this.pageCount){
            this.pageDown=false;
        }
        else {
            this.pageDown=true;
        }
        return pageDown;
    }

    public Integer getDataStart() {
        this.dataStart=this.pageSize*(this.pageIndex-1)+1;
        return dataStart;
    }

    public Integer getDataEnd() {
        if (this.pageIndex<this.pageCount){
            this.dataEnd=this.dataStart+(this.pageSize-1);
        }
        else {
            this.dataEnd = this.totalCount;
        }
        return dataEnd;
    }
}
