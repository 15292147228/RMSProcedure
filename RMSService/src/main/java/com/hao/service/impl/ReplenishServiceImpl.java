package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.ReplenishDao;
import com.hao.service.ReplenishService;
import com.hao.vo.PageVo;
import com.hao.vo.Replenish;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ReplenishServiceImpl implements ReplenishService {
    @Autowired
    ReplenishDao dao;
    @Override
    public int addReplenish(Replenish rep) {
       /* Replenish repl=new Replenish();
        repl.setAggregate(rep.getAggregate());
        repl.setRoleId(rep.getRoleId());
        repl.setApplyDate(rep.getApplyDate());
        repl.setState(rep.getState());*/
        dao.addReplenish(rep);
       // System.out.println("添加返回ID："+rep);
        return rep.getId();
    }

    @Override
    public int delReplenish(List<Integer> ids) {
        return dao.delReplenish(ids);
    }

    @Override
    public Replenish xiuBeforeQueReplenish(int id) {
        return dao.xiuBeforeQueReplenish(id);
    }

    @Override
    public int xiuReplenish(Replenish rep) {
        return dao.xiuReplenish(rep);
    }

    @Override
    public PageVo<Replenish> queAllReplenish(Replenish rep, int page, int rows) {
        PageVo<Replenish> pv=new PageVo<Replenish>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllReplenish(rep));
        pv.setTotal(dao.queAllReplenishCount(rep));
        return pv;
    }

    @Override
    public List<Replenish> allReplenish(Replenish rep) {
        return dao.queAllReplenish(rep);
    }
}
