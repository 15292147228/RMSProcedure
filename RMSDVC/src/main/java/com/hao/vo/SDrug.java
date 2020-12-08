package com.hao.vo;

public class SDrug {
    private int id;// int primary key auto_increment,-- 供货商仓库ID
    private int supId;// int,-- 供货商ID
    private int drugId;// int,-- 药品ID
    private int num;// int,-- 库存数量
    private float combPrice;// float-- 药品售价

    private Drug drug;
    private Supplier sup;

    private String drugNames;// varchar(666),-- 药品名
    private String supName;// varchar(33),-- 供货商名

    public SDrug() {
    }

    public SDrug(int id, int supId, int drugId, int num, float combPrice) {
        this.id = id;
        this.supId = supId;
        this.drugId = drugId;
        this.num = num;
        this.combPrice = combPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSupId() {
        return supId;
    }

    public void setSupId(int supId) {
        this.supId = supId;
    }

    public int getDrugId() {
        return drugId;
    }

    public void setDrugId(int drugId) {
        this.drugId = drugId;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public float getCombPrice() {
        return combPrice;
    }

    public void setCombPrice(float combPrice) {
        this.combPrice = combPrice;
    }

    public Drug getDrug() {
        return drug;
    }

    public void setDrug(Drug drug) {
        this.drug = drug;
    }

    public Supplier getSup() {
        return sup;
    }

    public void setSup(Supplier sup) {
        this.sup = sup;
    }

    public String getDrugNames() {
        return drugNames;
    }

    public void setDrugNames(String drugNames) {
        this.drugNames = drugNames;
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    @Override
    public String toString() {
        return "SDrug{" +
                "id='" + id + '\'' +
                ", supId='" + supId + '\'' +
                ", drugId='" + drugId + '\'' +
                ", num='" + num + '\'' +
                ", combPrice='" + combPrice + '\'' +
                '}';
    }
}
