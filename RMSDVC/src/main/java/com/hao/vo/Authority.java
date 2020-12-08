package com.hao.vo;

import java.util.*;

public class Authority {
    private int id;//int primary key auto_increment, -- 权限ID
    private String text;//varchar (99) not null,-- 权限列名称
    private String url;//varchar (168),-- 权限列网址
    private String iconCls;//varchar (168),-- 权限列图片
    private String state;//varchar (30),-- 父权限自动加上closed  下拉列表 子:null
    private int parentid;//int-- 父列权限ID

    private Map<String,String> attributes=new TreeMap<String,String>();

    //子菜单集合
    private List<Authority> children =new ArrayList<Authority>();
    //授权页面  子菜单选中  非选中状态
    private boolean checked;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getParentid() {
        return parentid;
    }

    public void setParentid(int parentid) {
        this.parentid = parentid;
    }

    public Map<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }

    public List<Authority> getChildren() {
        return children;
    }

    public void setChildren(List<Authority> children) {
        this.children = children;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public Authority() {}

    public Authority(int id, String text, String url, String iconCls, String state, int parentid) {
        this.id = id;
        this.text = text;
        this.url = url;
        this.iconCls = iconCls;
        this.state = state;
        this.parentid = parentid;
    }

    @Override
    public String toString() {
        return "Authority{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", url='" + url + '\'' +
                ", iconCls='" + iconCls + '\'' +
                ", state='" + state + '\'' +
                ", parentid=" + parentid +
                '}';
    }
}
