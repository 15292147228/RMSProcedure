package com.hao.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Employee {
    private int id;// int primary key auto_increment, -- 职员ID
    private String accNum;// varchar(30),-- 账号
    private String pwd;// varchar(30),-- 密码
    private String empName;// varchar(199),-- 职员姓名
    private String empSex;// varchar(2),-- 职员性别
    @JSONField(format = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")//控制层 返回数据到view层 起作用 自动转换
    private Date empBirthday;// date,-- 职员生日
    private String empImage;// varchar(333),-- 工作照片
    private String department;// varchar(100),-- 部门
    private String idCard;// varchar(66),-- 身份证
    private String eduback;// varchar(99),-- 学历
    private String empPhone;// varchar(33),-- 电话
    private int roleId;// int-- 角色ID

    public Employee() {
    }

    public Employee(int id, String accNum, String pwd, String empName, String empSex, Date empBirthday, String empImage, String department, String idCard, String eduback, String empPhone, int roleId) {
        this.id = id;
        this.accNum = accNum;
        this.pwd = pwd;
        this.empName = empName;
        this.empSex = empSex;
        this.empBirthday = empBirthday;
        this.empImage = empImage;
        this.department = department;
        this.idCard = idCard;
        this.eduback = eduback;
        this.empPhone = empPhone;
        this.roleId = roleId;
    }

    private Role role;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccNum() {
        return accNum;
    }

    public void setAccNum(String accNum) {
        this.accNum = accNum;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpSex() {
        return empSex;
    }

    public void setEmpSex(String empSex) {
        this.empSex = empSex;
    }

    public Date getEmpBirthday() {
        return empBirthday;
    }

    public void setEmpBirthday(Date empBirthday) {
        this.empBirthday = empBirthday;
    }

    public String getEmpImage() {
        return empImage;
    }

    public void setEmpImage(String empImage) {
        this.empImage = empImage;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getEduback() {
        return eduback;
    }

    public void setEduback(String eduback) {
        this.eduback = eduback;
    }

    public String getEmpPhone() {
        return empPhone;
    }

    public void setEmpPhone(String empPhone) {
        this.empPhone = empPhone;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", accNum='" + accNum + '\'' +
                ", pwd='" + pwd + '\'' +
                ", empName='" + empName + '\'' +
                ", empSex='" + empSex + '\'' +
                ", empBirthday=" + empBirthday +
                ", empImage='" + empImage + '\'' +
                ", department='" + department + '\'' +
                ", idCard='" + idCard + '\'' +
                ", eduback='" + eduback + '\'' +
                ", empPhone='" + empPhone + '\'' +
                ", roleId=" + roleId +
                '}';
    }
}
