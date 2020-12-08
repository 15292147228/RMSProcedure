package com.hao.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Repertory {
    private int id;// int primary key auto_increment,	-- 库存ID
   private int  drugId;// int,-- 药品ID  药品表嵌入
    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")//控制层 返回数据到view层 起作用 自动转换
   private Date wareDate;// timestamp,-- 入库日期
   private int  saveNum;// int,-- 存量
   private int  wareId;// int,-- 仓库ID
   private String  drugCode;// varchar(66),-- 药品编码（唯一）
    private int allSave;// int-- 最大存量1000

    private String wareName;// varchar(66),-- 仓库名
    private String drugNames;// varchar(666),-- 药品名

    private Drug drug;
    private WareHouse wh;

    public Repertory(int id, int drugId, Date wareDate, int saveNum, int wareId, String drugCode, int allSave, String wareName, String drugNames) {
        this.id = id;
        this.drugId = drugId;
        this.wareDate = wareDate;
        this.saveNum = saveNum;
        this.wareId = wareId;
        this.drugCode = drugCode;
        this.allSave = allSave;
        this.wareName = wareName;
        this.drugNames = drugNames;
    }

    public Repertory() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDrugId() {
        return drugId;
    }

    public void setDrugId(int drugId) {
        this.drugId = drugId;
    }

    public Date getWareDate() {
        return wareDate;
    }

    public void setWareDate(Date wareDate) {
        this.wareDate = wareDate;
    }

    public int getSaveNum() {
        return saveNum;
    }

    public void setSaveNum(int saveNum) {
        this.saveNum = saveNum;
    }

    public int getWareId() {
        return wareId;
    }

    public void setWareId(int wareId) {
        this.wareId = wareId;
    }

    public String getDrugCode() {
        return drugCode;
    }

    public void setDrugCode(String drugCode) {
        this.drugCode = drugCode;
    }

    public int getAllSave() {
        return allSave;
    }

    public void setAllSave(int allSave) {
        this.allSave = allSave;
    }

    public String getWareName() {
        return wareName;
    }

    public void setWareName(String wareName) {
        this.wareName = wareName;
    }

    public String getDrugNames() {
        return drugNames;
    }

    public void setDrugNames(String drugNames) {
        this.drugNames = drugNames;
    }

    public Drug getDrug() {
        return drug;
    }

    public void setDrug(Drug drug) {
        this.drug = drug;
    }

    public WareHouse getWh() {
        return wh;
    }

    public void setWh(WareHouse wh) {
        this.wh = wh;
    }

    @Override
    public String toString() {
        return "Repertory{" +
                "id=" + id +
                ", drugId=" + drugId +
                ", wareDate=" + wareDate +
                ", saveNum=" + saveNum +
                ", wareId=" + wareId +
                ", drugCode='" + drugCode + '\'' +
                ", allSave=" + allSave +
                ", wareName='" + wareName + '\'' +
                ", drugNames='" + drugNames + '\'' +
                ", drug=" + drug +
                ", wh=" + wh +
                '}';
    }
}
