package com.hao.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class OrderForm {
    private int id;// int primary key auto_increment,-- 出货申请单ID
    private int userId;// int,-- 客户ID
    private float aggregate;// float,-- 总金额
    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")//控制层 返回数据到view层 起作用 自动转换
    private Date ofDate;// timestamp,-- 申请日期
    private int roleId;// int,-- 业务员
    private int state;// int-- 状态 （0待审核 or 1作废 or 2已批准）

    private List<OfDetail> ofDetail;

    private User user;

    public OrderForm() {
    }

    public OrderForm(int id, int userId, float aggregate, Date ofDate, int roleId, int state) {
        this.id = id;
        this.userId = userId;
        this.aggregate = aggregate;
        this.ofDate = ofDate;
        this.roleId = roleId;
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public float getAggregate() {
        return aggregate;
    }

    public void setAggregate(float aggregate) {
        this.aggregate = aggregate;
    }

    public Date getOfDate() {
        return ofDate;
    }

    public void setOfDate(Date ofDate) {
        this.ofDate = ofDate;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public List<OfDetail> getOfDetail() {
        return ofDetail;
    }

    public void setOfDetail(List<OfDetail> ofDetail) {
        this.ofDetail = ofDetail;
    }

    @Override
    public String toString() {
        return "OrderForm{" +
                "id=" + id +
                ", userId=" + userId +
                ", aggregate=" + aggregate +
                ", ofDate=" + ofDate +
                ", roleId=" + roleId +
                ", state=" + state +
                ", ofDetail=" + ofDetail +
                '}';
    }
}
