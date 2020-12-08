package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.DrugDao;
import com.hao.service.DrugService;
import com.hao.vo.Drug;
import com.hao.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DrugServiceImpl implements DrugService {
    @Autowired
    DrugDao dao;
    @Override
    public int addDrug(Drug drug) {
        return dao.addDrug(drug);
    }

    @Override
    public int delDrug(List<Integer> ids) {
        return dao.delDrug(ids);
    }

    @Override
    public Drug xiuBeforeQueDrug(int id) {
        return dao.xiuBeforeQueDrug(id);
    }

    @Override
    public int xiuDrug(Drug drug) {
        return dao.xiuDrug(drug);
    }

    @Override
    public PageVo<Drug> queAllDrug(Drug drug, int page, int rows) {
        PageVo<Drug> pv=new PageVo<>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllDrug(drug));
        pv.setTotal(dao.queAllDrugCount(drug));
        return pv;
    }

    @Override
    public List<Drug> allDrug(Drug drug) {
        return dao.queAllDrug(drug);
    }

}
