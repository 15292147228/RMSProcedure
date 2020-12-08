package com.hao.vo;

public class Role {
    private int id;// int primary key auto_increment, -- 角色ID
    private String rname;// varchar(100),-- 角色名称
    private String remark;// varchar(99)-- 备注

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Role() {
    }

    public Role(int id, String rname, String remark) {
        this.id = id;
        this.rname = rname;
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", rname='" + rname + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
