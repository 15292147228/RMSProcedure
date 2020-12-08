package com.hao.service;

import com.hao.vo.AndRole;

import java.util.List;

public interface AndRoleService {
    //增加角色权限连接
    public int addAndRole(int auId,int rid);

    //删除
    public int delAndRole(int rid);

    //修前查询
    public AndRole xiuBeforeAndRole(int id);
    //修改
    public int xiuAndRole(int auId,int rid);

    //查询所有
    public List<AndRole> queAllAndRole();
}
