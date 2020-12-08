package com.hao.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class Replenish {
    private int id;// int primary key auto_increment,-- 进货申请ID
    private float aggregate;// float,-- 进货总金额
    private int roleId;// int,-- 进货申请员
    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")//控制层 返回数据到view层 起作用 自动转换
    private Date applyDate;// timestamp,-- 进货申请日期
    private int state;// int -- 状态 （0待审核 or 1作废 or 2已批准）
    private List<ReplenishDetail> repDetail;

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

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Date getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public List<ReplenishDetail> getRepDetail() {
        return repDetail;
    }

    public void setRepDetail(List<ReplenishDetail> repDetail) {
        this.repDetail = repDetail;
    }

    public Replenish() {
    }

    public Replenish(int id, float aggregate, int roleId, Date applyDate, int state) {
        this.id = id;
        this.aggregate = aggregate;
        this.roleId = roleId;
        this.applyDate = applyDate;
        this.state = state;
    }

    @Override
    public String toString() {
        return "Replenish{" +
                "id=" + id +
                ", aggregate=" + aggregate +
                ", roleId=" + roleId +
                ", applyDate=" + applyDate +
                ", state=" + state +
                ", repDetail=" + repDetail +
                '}';
    }
}
