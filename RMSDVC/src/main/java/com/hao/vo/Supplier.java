package com.hao.vo;

public class Supplier {
    private int  id;// int primary key auto_increment,-- 供货商ID
    private String supName;// varchar(33),-- 供货商名
    private String location;// varchar(168),-- 所在地区
   private String  suPhone;// varchar(33),-- 联系电话
    private String remark;// varchar(66)-- 备注

    public Supplier() {
    }

    public Supplier(int id, String supName, String location, String suPhone, String remark) {
        this.id = id;
        this.supName = supName;
        this.location = location;
        this.suPhone = suPhone;
        this.remark = remark;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getSuPhone() {
        return suPhone;
    }

    public void setSuPhone(String suPhone) {
        this.suPhone = suPhone;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "id=" + id +
                ", supName='" + supName + '\'' +
                ", location='" + location + '\'' +
                ", suPhone='" + suPhone + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
