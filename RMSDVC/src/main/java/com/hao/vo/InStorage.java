package com.hao.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class InStorage {
    private int id;// int primary key auto_increment,-- 入库单ID
    private float aggregate;// float,-- 进货总金额
    private int roleId;// int,-- 仓库管理员
    private int purId;// int,-- 采购单编号
    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")//控制层 返回数据到view层 起作用 自动转换
    private Date wareDate;// timestamp,-- 入库日期
    private int state;// int-- 状态 （0待入库 or 1拒绝入库 or 2成功入库）

    private List<InStorageDetail> insDetail;

    public InStorage(int id, float aggregate, int roleId, int purId, Date wareDate, int state) {
        this.id = id;
        this.aggregate = aggregate;
        this.roleId = roleId;
        this.purId = purId;
        this.wareDate = wareDate;
        this.state = state;
    }

    public InStorage() {
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

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getPurId() {
        return purId;
    }

    public void setPurId(int purId) {
        this.purId = purId;
    }

    public Date getWareDate() {
        return wareDate;
    }

    public void setWareDate(Date wareDate) {
        this.wareDate = wareDate;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public List<InStorageDetail> getInsDetail() {
        return insDetail;
    }

    public void setInsDetail(List<InStorageDetail> insDetail) {
        this.insDetail = insDetail;
    }

    @Override
    public String toString() {
        return "InStorage{" +
                "id=" + id +
                ", aggregate=" + aggregate +
                ", roleId=" + roleId +
                ", purId=" + purId +
                ", wareDate=" + wareDate +
                ", state=" + state +
                ", insDetail=" + insDetail +
                '}';
    }
}
