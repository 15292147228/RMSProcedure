package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.PurchaseDetailDao;
import com.hao.service.PurchaseDetailService;
import com.hao.vo.PageVo;
import com.hao.vo.PurchaseDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PurchaseDetailServiceImpl implements PurchaseDetailService {
    @Autowired
    PurchaseDetailDao dao;

    @Override
    public int addPurchaseDetail(PurchaseDetail pdl) {
        return dao.addPurchaseDetail(pdl);
    }

    @Override
    public int delPurchaseDetail(List<Integer> ids) {
        return dao.delPurchaseDetail(ids);
    }

    @Override
    public PurchaseDetail xiuBeforeQuePurchaseDetail(int id) {
        return dao.xiuBeforeQuePurchaseDetail(id);
    }

    @Override
    public List<PurchaseDetail> isAllPurDetail(int id) {
        return dao.queryByRepIdPD(id);
    }

    @Override
    public PageVo<PurchaseDetail> queryByRepIdPD(int id, int page, int rows) {
        PageVo<PurchaseDetail> pv=new PageVo<PurchaseDetail>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queryByRepIdPD(id));
        PurchaseDetail pd=new PurchaseDetail();
        pd.setPurId(id);
        pv.setTotal(dao.queAllPurchaseDetailCount(pd));
        return pv;
    }

    @Override
    public int xiuPurchaseDetail(PurchaseDetail pdl) {
        return dao.xiuPurchaseDetail(pdl);
    }

    @Override
    public PageVo<PurchaseDetail> queAllPurchaseDetail(PurchaseDetail pdl, int page, int rows) {
        PageVo<PurchaseDetail> pv=new PageVo<PurchaseDetail>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllPurchaseDetail(pdl));
        pv.setTotal(dao.queAllPurchaseDetailCount(pdl));
        return pv;
    }
}
