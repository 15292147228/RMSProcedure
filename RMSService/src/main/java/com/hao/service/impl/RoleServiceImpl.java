package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.RoleDao;
import com.hao.service.RoleService;
import com.hao.vo.Employee;
import com.hao.vo.PageVo;
import com.hao.vo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleDao dao;

    @Override
    public int addRole(Role ar) {
        return dao.addRole(ar);
    }

    @Override
    public int delRole(int id) {
        return dao.delRole(id);
    }

    @Override
    public Role xiuBeforeRole(int id) {
        return dao.xiuBeforeRole(id);
    }

    @Override
    public int xiuRole(Role ar) {
        return dao.xiuRole(ar);
    }

    @Override
    public PageVo<Role> queByVoAll(Role role, int page, int rows) {
        PageVo<Role> pv=new PageVo<Role>();
        //放在 查询代码的前面 分页插件
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queByVoAll(role));
        pv.setTotal(dao.queByVoCount(role));
        return pv;
    }

    @Override
    public List<Role> queAllRole() {
        return dao.queAllRole();
    }
}
