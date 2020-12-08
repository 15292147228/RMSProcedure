package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.PurchaseDao;
import com.hao.service.PurchaseService;
import com.hao.vo.PageVo;
import com.hao.vo.Purchase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PurchaseServiceImpl implements PurchaseService {
    @Autowired
    PurchaseDao dao;

    @Override
    public int addPurchase(Purchase pur) {
        dao.addPur(pur);
        return pur.getId();
    }

    @Override
    public int delPurchase(List<Integer> ids) {
        return dao.delPurchase(ids);
    }

    @Override
    public Purchase xiuBeforeQuePurchase(int id) {
        return dao.xiuBeforeQuePurchase(id);
    }

    @Override
    public int xiuPurchase(Purchase pur) {
        return dao.xiuPurchase(pur);
    }

    @Override
    public PageVo<Purchase> queAllPurchase(Purchase pur, int page, int rows) {
        PageVo<Purchase> pv=new PageVo<Purchase>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllPurchase(pur));
        pv.setTotal(dao.queAllPurchaseCount(pur));
        return pv;
    }

    @Override
    public List<Purchase> allPurchase(Purchase pur) {
        return dao.queAllPurchase(pur);
    }
}
