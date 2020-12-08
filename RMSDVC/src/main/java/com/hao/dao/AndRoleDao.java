package com.hao.dao;

import com.hao.vo.AndRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AndRoleDao {
    //增加角色权限连接
    public int addAndRole(@Param("auId") int authId,@Param("rId") int roleId);

    //删除
    public int delAndRole(int rid);

    //修前查询
    public AndRole xiuBeforeAndRole(int id);
    //修改
    public int xiuAndRole(int authId,int roleId);

    //查询所有
    public List<AndRole> queAllAndRole();
}
