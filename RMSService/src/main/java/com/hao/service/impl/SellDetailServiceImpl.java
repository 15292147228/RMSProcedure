package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.SellDetailDao;
import com.hao.service.SellDetailService;
import com.hao.vo.PageVo;
import com.hao.vo.SellDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SellDetailServiceImpl implements SellDetailService {
    @Autowired
    SellDetailDao dao;
    @Override
    public int addSellDetail(SellDetail sellDetail) {
        return dao.addSellDetail(sellDetail);
    }

    @Override
    public int delSellDetail(List<Integer> ids) {
        return dao.delSellDetail(ids);
    }

    @Override
    public SellDetail xiuBeforeQueSellDetail(int id) {
        return dao.xiuBeforeQueSellDetail(id);
    }

    @Override
    public PageVo<SellDetail> isAllSellDetail(int id, int page, int rows) {
        PageVo<SellDetail> pv=new PageVo<SellDetail>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queryByRepIdSD(id));
        SellDetail sellD=new SellDetail();
        sellD.setSellId(id);
        pv.setTotal(dao.queAllSellDetailCount(sellD));
        return pv;
    }

    @Override
    public List<SellDetail> queryByRepIdSD(int id) {
        return dao.queryByRepIdSD(id);
    }

    @Override
    public int xiuSellDetail(SellDetail sellDetail) {
        return dao.xiuSellDetail(sellDetail);
    }

    @Override
    public PageVo<SellDetail> queAllSellDetail(SellDetail sellDetail, int page, int rows) {
        PageVo<SellDetail> pv=new PageVo<SellDetail>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllSellDetail(sellDetail));
        pv.setTotal(dao.queAllSellDetailCount(sellDetail));
        return pv;
    }
}
