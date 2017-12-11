package com.yaokaiwen.util;

/**
 * Created by Administrator on 17-9-22.
 */
public class Page {

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
    private Integer dataEnd;

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    /*默认pageSize  10条*/
    public void setPageSize(Integer pageSize) {
        if(pageSize==null || pageSize<=0){
            this.pageSize = 10;
        }
        else{
            this.pageSize = pageSize;
        }
    }


    public Integer getPageCount() {
        if(this.totalCount%this.pageSize == 0){
            this.pageCount = this.totalCount/this.pageSize;
        }
        else{
            this.pageCount = this.totalCount/this.pageSize +1;
        }

        return pageCount;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        if(pageIndex==null || pageIndex<=0){
            this.pageIndex = 1;
        }
        else{
            this.pageIndex = pageIndex;
        }
    }

    public boolean getUppage() {
        if(this.pageIndex <=1){
            this.uppage = false;
        }
        else{
            this.uppage = true;
        }
        return uppage;
    }

    public boolean getNextpage() {
        if(this.pageIndex<this.pageCount){
            this.nextpage = true;
        }
        else{
            this.nextpage = false;
        }
        return nextpage;
    }


    public Integer getDataStart() {
        this.dataStart = this.pageSize*(this.pageIndex-1)+1;
        return dataStart;
    }

    public Integer getDataEnd() {
        if(this.pageIndex < this.pageCount){
            this.dataEnd = this.dataStart +(this.pageSize-1);
        }
        else{
            this.dataEnd = this.totalCount;
        }
        return dataEnd;
    }

    public void page(){

    }

    public void page(Integer totalCount,Integer pageSize,Integer pageIndex){
        setTotalCount(totalCount);
        setPageSize(pageSize);
        setPageIndex(pageIndex);

        getTotalCount();
        getPageSize();
        getPageCount();
        getPageIndex();
        getUppage();
        getNextpage();
        getDataStart();
        getDataEnd();
    }

}
