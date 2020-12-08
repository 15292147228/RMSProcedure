package com.hao.service.impl;

import com.hao.dao.AndRoleDao;
import com.hao.service.AndRoleService;
import com.hao.vo.AndRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AndRoleServiceImpl implements AndRoleService {
    @Autowired
    AndRoleDao dao;
    @Override
    public int addAndRole(int auId, int rid) {
        return dao.addAndRole(auId, rid);
    }

    @Override
    public int delAndRole(int rid) {
        return dao.delAndRole(rid);
    }

    @Override
    public AndRole xiuBeforeAndRole(int id) {
        return dao.xiuBeforeAndRole(id);
    }

    @Override
    public int xiuAndRole(int auId, int rid) {
        return dao.xiuAndRole(auId, rid);
    }

    @Override
    public List<AndRole> queAllAndRole() {
        return dao.queAllAndRole();
    }
}
