package com.hao.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class Sell {
    private int id;// int primary key auto_increment,-- 销售ID
    private int userId;// int,-- 客户ID
    private float aggregate;// float,-- 总金额
    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")//控制层 返回数据到view层 起作用 自动转换
    private Date sellDate;// timestamp,-- 出货日期
    private int roleId;// int,-- 仓库管理员
    private int state;// int-- 状态 （0待审查 or 1缺货 or 2出货）

    private List<SellDetail> sellDetails;
    private User userS;

    public Sell() {
    }

    public Sell(int id, int userId, float aggregate, Date sellDate, int roleId, int state) {
        this.id = id;
        this.userId = userId;
        this.aggregate = aggregate;
        this.sellDate = sellDate;
        this.roleId = roleId;
        this.state = state;
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

    public Date getSellDate() {
        return sellDate;
    }

    public void setSellDate(Date sellDate) {
        this.sellDate = sellDate;
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

    public List<SellDetail> getSellDetails() {
        return sellDetails;
    }

    public void setSellDetails(List<SellDetail> sellDetails) {
        this.sellDetails = sellDetails;
    }

    public User getUserS() {
        return userS;
    }

    public void setUserS(User userS) {
        this.userS = userS;
    }

    @Override
    public String toString() {
        return "Sell{" +
                "id=" + id +
                ", userId=" + userId +
                ", aggregate=" + aggregate +
                ", sellDate=" + sellDate +
                ", roleId=" + roleId +
                ", state=" + state +
                ", sellDetails=" + sellDetails +
                '}';
    }
}
