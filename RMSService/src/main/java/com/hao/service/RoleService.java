package com.hao.service;

import com.hao.vo.Employee;
import com.hao.vo.PageVo;
import com.hao.vo.Role;

import java.util.List;

public interface RoleService {
    //增加角色权限连接
    public int addRole(Role ar);

    //删除
    public int delRole(int id);

    //修前查询
    public Role xiuBeforeRole(int id);
    //修改
    public int xiuRole(Role role);

    //按条件查询
    public PageVo<Role> queByVoAll(Role role, int page, int rows);

    //查询所有
    public List<Role> queAllRole();
}
