package com.hao.dao;

import com.hao.vo.Employee;
import com.hao.vo.Role;

import java.util.List;

public interface RoleDao {
    //增加角色权限连接
    public int addRole(Role ar);

    //删除
    public int delRole(int id);

    //修前查询
    public Role xiuBeforeRole(int id);
    //修改
    public int xiuRole(Role ar);

    public int queByVoCount(Role role);
    public List<Role> queByVoAll(Role role);
    //查询所有
    public List<Role> queAllRole();
}
