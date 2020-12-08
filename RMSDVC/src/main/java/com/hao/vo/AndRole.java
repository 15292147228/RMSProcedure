package com.hao.vo;

public class AndRole {
    private int id;// int  primary key auto_increment, -- 权限&权限表ID
    private int authId;// int, -- 权限ID
    private int roleId;// int -- 角色ID

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAuthId() {
        return authId;
    }

    public void setAuthId(int authId) {
        this.authId = authId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public AndRole() {
    }

    public AndRole(int id, int authId, int roleId) {
        this.id = id;
        this.authId = authId;
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "AndRole{" +
                "id=" + id +
                ", authId=" + authId +
                ", roleId=" + roleId +
                '}';
    }
}
