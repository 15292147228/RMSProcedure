package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.InStorageDao;
import com.hao.service.InStorageService;
import com.hao.vo.InStorage;
import com.hao.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InStorageServiceImpl implements InStorageService {
    @Autowired
    InStorageDao dao;
    @Override
    public int addInStorage(InStorage ins) {
        dao.addInStorage(ins);
        System.out.println("添加返回ID："+ins);
        return ins.getId();
    }

    @Override
    public int delInStorage(List<Integer> ids) {
        return dao.delInStorage(ids);
    }

    @Override
    public InStorage xiuBeforeQueInStorage(int id) {
        return dao.xiuBeforeQueInStorage(id);
    }

    @Override
    public int xiuInStorage(InStorage ins) {
        return dao.xiuInStorage(ins);
    }

    @Override
    public PageVo<InStorage> queAllInStorage(InStorage ins, int page, int rows) {
        PageVo<InStorage> pv=new PageVo<InStorage>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllInStorage(ins));
        pv.setTotal(dao.queAllInStorageCount(ins));
        return pv;
    }

    @Override
    public List<InStorage> allInStorage(InStorage ins) {
        return dao.queAllInStorage(ins);
    }

    @Override
    public PageVo<InStorage> queryByTimeOfIns(int num,int page,int rows) {
        PageVo<InStorage> pv=new PageVo<InStorage>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queryByTimeOfIns(num));
        pv.setTotal(dao.queryByTimeOfCount(num));
        return pv;
    }

    @Override
    public Float querySumOfMoney(int num) {
        return dao.querySumOfMoney(num);
    }


}
