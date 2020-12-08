package com.hao.vo;

public class User {
    private int id;// int primary key auto_increment,-- 客户ID
    private String accNum;//varchar(30),-- 账号
    private String pwd;// varchar(30),-- 密码
    private String company;// varchar(66),-- 客户公司名称
    private String userName;// varchar(33),-- 客户姓名
    private String duty;// varchar(33),-- 职务
    private String companySite;// varchar(168),-- 客户公司地址
    private String userPhone;// varchar(33),-- 电话
    private String bankAccount;// varchar(36),-- 银行账号
    private int xinYu;// int,-- 信誉度
    private String destination;// varchar(168),-- 送货地址
    private int roleId;// int-- 角色ID

    public User() {
    }

    public User(int id, String accNum, String pwd, String company, String userName, String duty, String companySite, String userPhone, String bankAccount, int xinYu, String destination, int roleId) {
        this.id = id;
        this.accNum = accNum;
        this.pwd = pwd;
        this.company = company;
        this.userName = userName;
        this.duty = duty;
        this.companySite = companySite;
        this.userPhone = userPhone;
        this.bankAccount = bankAccount;
        this.xinYu = xinYu;
        this.destination = destination;
        this.roleId = roleId;
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

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public String getCompanySite() {
        return companySite;
    }

    public void setCompanySite(String companySite) {
        this.companySite = companySite;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public int getXinYu() {
        return xinYu;
    }

    public void setXinYu(int xinYu) {
        this.xinYu = xinYu;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", accNum='" + accNum + '\'' +
                ", pwd='" + pwd + '\'' +
                ", company='" + company + '\'' +
                ", userName='" + userName + '\'' +
                ", duty='" + duty + '\'' +
                ", companySite='" + companySite + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", bankAccount='" + bankAccount + '\'' +
                ", xinYu=" + xinYu +
                ", destination='" + destination + '\'' +
                ", roleId=" + roleId +
                '}';
    }
}
