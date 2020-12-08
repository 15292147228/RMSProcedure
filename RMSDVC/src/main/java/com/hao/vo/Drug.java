package com.hao.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Drug {
    private int id;// int primary key auto_increment,-- 药品ID
    private String drugNames;// varchar(666),-- 药品名
    private Float purcost;// float,-- 进货价
    private Float sellPrince;// float,-- 销售价
    private String ingredient;// varchar(168),-- 药品成分
    private String specification;// varchar(168),-- 药品规格
    private String place;// varchar(133),-- 药品产地
    private String batchNum;// varchar(99),-- 批号
    private String remark;// varchar(136),-- 备注
    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone = "GMT+8")//控制层 返回数据到view层 起作用 自动转换
    private Date producedDate;// timestamp,-- 生产日期
   // @JSONField(format = "yyyy-MM-dd hh:mm:ss") //转换的格式为时间戳
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone = "GMT+8")//控制层 返回数据到view层 起作用 自动转换
    private Date expirationDate;// timestamp,-- 有效期
    private String packageInsert;// varchar(666)-- 说明书

    public Drug() {
    }

    public Drug(int id, String drugNames, Float purcost, Float sellPrince, String ingredient, String specification, String place, String batchNum, String remark, Date producedDate, Date expirationDate, String packageInsert) {
        this.id = id;
        this.drugNames = drugNames;
        this.purcost = purcost;
        this.sellPrince = sellPrince;
        this.ingredient = ingredient;
        this.specification = specification;
        this.place = place;
        this.batchNum = batchNum;
        this.remark = remark;
        this.producedDate = producedDate;
        this.expirationDate = expirationDate;
        this.packageInsert = packageInsert;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDrugNames() {
        return drugNames;
    }

    public void setDrugNames(String drugNames) {
        this.drugNames = drugNames;
    }

    public Float getPurcost() {
        return purcost;
    }

    public void setPurcost(Float purcost) {
        this.purcost = purcost;
    }

    public Float getSellPrince() {
        return sellPrince;
    }

    public void setSellPrince(Float sellPrince) {
        this.sellPrince = sellPrince;
    }

    public String getIngredient() {
        return ingredient;
    }

    public void setIngredient(String ingredient) {
        this.ingredient = ingredient;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getBatchNum() {
        return batchNum;
    }

    public void setBatchNum(String batchNum) {
        this.batchNum = batchNum;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getProducedDate() {
        return producedDate;
    }

    public void setProducedDate(Date producedDate) {
        this.producedDate = producedDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getPackageInsert() {
        return packageInsert;
    }

    public void setPackageInsert(String packageInsert) {
        this.packageInsert = packageInsert;
    }

    @Override
    public String toString() {
        return "Drug{" +
                "id=" + id +
                ", drugNames='" + drugNames + '\'' +
                ", purcost=" + purcost +
                ", sellPrince=" + sellPrince +
                ", ingredient='" + ingredient + '\'' +
                ", specification='" + specification + '\'' +
                ", place='" + place + '\'' +
                ", batchNum='" + batchNum + '\'' +
                ", remark='" + remark + '\'' +
                ", producedDate=" + producedDate +
                ", expirationDate=" + expirationDate +
                ", packageInsert='" + packageInsert + '\'' +
                '}';
    }
}
