package com.hao.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class Purchase {
    private int id;// int primary key auto_increment,-- 采购ID
    private float aggregate;// float,-- 预计总金额
    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")//控制层 返回数据到view层 起作用 自动转换
    private Date buyDate;// timestamp,-- 采购日期
    private int state;// int-- 状态 （0购置中 or 1未置齐 or 2购置完毕）

    private List<PurchaseDetail> purDetail;

    public Purchase() {
    }

    public Purchase(int id, float aggregate, Date buyDate, int state) {
        this.id = id;
        this.aggregate = aggregate;
        this.buyDate = buyDate;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getAggregate() {
        return aggregate;
    }

    public void setAggregate(float aggregate) {
        this.aggregate = aggregate;
    }

    public Date getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(Date buyDate) {
        this.buyDate = buyDate;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public List<PurchaseDetail> getPurDetail() {
        return purDetail;
    }

    public void setPurDetail(List<PurchaseDetail> purDetail) {
        this.purDetail = purDetail;
    }

    @Override
    public String toString() {
        return "Purchase{" +
                "id=" + id +
                ", aggregate=" + aggregate +
                ", buyDate=" + buyDate +
                ", state=" + state +
                ", purDetail=" + purDetail +
                '}';
    }
}
