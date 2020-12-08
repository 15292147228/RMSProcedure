package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.SellDao;
import com.hao.service.SellService;
import com.hao.vo.PageVo;
import com.hao.vo.Sell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SellServiceImpl implements SellService {
        @Autowired
        SellDao dao;
    @Override
    public int addSell(Sell sell) {
    dao.addSell(sell);
    return sell.getId();
    }

    @Override
    public int delSell(List<Integer> ids) {
        return dao.delSell(ids);
    }

    @Override
    public Sell xiuBeforeQueSell(int id) {
        return dao.xiuBeforeQueSell(id);
    }

    @Override
    public int xiuSell(Sell sell) {
        return dao.xiuSell(sell);
    }

    @Override
    public PageVo<Sell> queAllSell(Sell sell, int page, int rows) {
        PageVo<Sell> pv=new PageVo<Sell>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllSell(sell));
        pv.setTotal(dao.queAllSellCount(sell));
        return pv;
    }

    @Override
    public List<Sell> allSell(Sell sell) {
        return dao.queAllSell(sell);
    }

    @Override
    public PageVo<Sell> queryByTimeOfSell(int num,int page,int rows) {
        PageVo<Sell> pv=new PageVo<Sell>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queryByTimeOfSell(num));
        pv.setTotal(dao.queryByTimeOfSellCount(num));
        return pv;
    }

    @Override
    public Float querySellOfMoney(int num) {
        return dao.querySellOfMoney(num);
    }
}
