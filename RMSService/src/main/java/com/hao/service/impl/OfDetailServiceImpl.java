package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.OfDetailDao;
import com.hao.service.OfDetailService;
import com.hao.vo.OfDetail;
import com.hao.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfDetailServiceImpl implements OfDetailService {
    @Autowired
    OfDetailDao dao;
    @Override
    public int addOfDetail(OfDetail ofDetail) {
        return dao.addOfDetail(ofDetail);
    }

    @Override
    public int delOfDetail(List<Integer> ids) {
        return dao.delOfDetail(ids);
    }

    @Override
    public OfDetail xiuBeforeQueOfDetail(int id) {
        return dao.xiuBeforeQueOfDetail(id);
    }

    @Override
    public List<OfDetail> isAllOFDetail(int id) {
        return dao.queryByRepIdOFD(id);
    }

    @Override
    public PageVo<OfDetail> queryByRepIdOFD(int id, int page, int rows) {
        PageVo<OfDetail> pv=new PageVo<OfDetail>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queryByRepIdOFD(id));
        OfDetail ofDetail=new OfDetail();
        ofDetail.setOformId(id);
        pv.setTotal(dao.queAllOfDetailCount(ofDetail));
        return pv;
    }

    @Override
    public int xiuOfDetail(OfDetail ofDetail) {
        return dao.xiuOfDetail(ofDetail);
    }

    @Override
    public PageVo<OfDetail> queAllOfDetail(OfDetail ofDetail, int page, int rows) {
        PageVo<OfDetail> pv=new PageVo<OfDetail>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllOfDetail(ofDetail));
        pv.setTotal(dao.queAllOfDetailCount(ofDetail));
        return pv;
    }
}
