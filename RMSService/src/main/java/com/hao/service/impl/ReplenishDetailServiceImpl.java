package com.hao.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hao.dao.ReplenishDetailDao;
import com.hao.service.ReplenishDetailService;
import com.hao.vo.PageVo;
import com.hao.vo.Replenish;
import com.hao.vo.ReplenishDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ReplenishDetailServiceImpl implements ReplenishDetailService {
    @Autowired
    ReplenishDetailDao dao;
    @Override
    public int addReplenishDetail(ReplenishDetail rdl) {
        return dao.addReplenishDetail(rdl);
    }

    @Override
    public int delReplenishDetail(List<Integer> ids) {
        return dao.delReplenishDetail(ids);
    }

    @Override
    public ReplenishDetail xiuBeforeQueReplenishDetail(int id) {
        return dao.xiuBeforeQueReplenishDetail(id);
    }

    @Override
    public List<ReplenishDetail> isAllRepDetail(int id) {
        return dao.queryByRepIdRD(id);
    }

    @Override
    public PageVo<ReplenishDetail> queryByRepIdRD(int id,int page,int rows) {
        PageVo<ReplenishDetail> pv=new PageVo<>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queryByRepIdRD(id));
        ReplenishDetail rl=new ReplenishDetail();
        rl.setRepId(id);
        pv.setTotal(dao.queAllReplenishDetailCount(rl));
        return pv;
    }



    @Override
    public int xiuReplenishDetail(ReplenishDetail rdl) {
        return dao.xiuReplenishDetail(rdl);
    }

    @Override
    public PageVo<ReplenishDetail> queAllReplenishDetail(ReplenishDetail rdl, int page, int rows) {
        PageVo<ReplenishDetail> pv=new PageVo<>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllReplenishDetail(rdl));
        pv.setTotal(dao.queAllReplenishDetailCount(rdl));
        return pv;
    }
}
