package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.InStorageDetailDao;
import com.hao.service.InStorageDetailService;
import com.hao.vo.InStorageDetail;
import com.hao.vo.PageVo;
import com.hao.vo.ReplenishDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InStorageDetailServiceImpl implements InStorageDetailService {
    @Autowired
    InStorageDetailDao dao;

    @Override
    public int addInStorageDetail(InStorageDetail insDl) {
        return dao.addInStorageDetail(insDl);
    }

    @Override
    public int delInStorageDetail(List<Integer> ids) {
        return dao.delInStorageDetail(ids);
    }

    @Override
    public InStorageDetail xiuBeforeQueInStorageDetail(int id) {
        return dao.xiuBeforeQueInStorageDetail(id);
    }

    @Override
    public List<InStorageDetail> isAllInsDetail(int id) {
        return dao.queryByRepIdINSD(id);
    }

    @Override
    public PageVo<InStorageDetail> queryByRepIdINSD(int id, int page, int rows) {
        PageVo<InStorageDetail> pv=new PageVo<InStorageDetail>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queryByRepIdINSD(id));
        InStorageDetail il=new InStorageDetail();
        il.setInstId(id);
        pv.setTotal(dao.queAllInStorageDetailCount(il));
        return pv;
    }

    @Override
    public int xiuInStorageDetail(InStorageDetail insDl) {
        return dao.xiuInStorageDetail(insDl);
    }

    @Override
    public PageVo<InStorageDetail> queAllInStorageDetail(InStorageDetail insDl, int page, int rows) {
        PageVo<InStorageDetail> pv=new PageVo<InStorageDetail>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllInStorageDetail(insDl));
        pv.setTotal(dao.queAllInStorageDetailCount(insDl));
        return pv;
    }
}
