package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.SupplierDao;
import com.hao.service.SupplierService;
import com.hao.vo.PageVo;
import com.hao.vo.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SupplierServiceImpl implements SupplierService {
    @Autowired
    SupplierDao dao;
    @Override
    public int addSupplier(Supplier sup) {
        return dao.addSupplier(sup);
    }

    @Override
    public int delSupplier(List<Integer> ids) {
        return dao.delSupplier(ids);
    }

    @Override
    public Supplier xiuBeforeQueSupplier(int id) {
        return dao.xiuBeforeQueSupplier(id);
    }

    @Override
    public int xiuSupplier(Supplier sup) {
        return dao.xiuSupplier(sup);
    }

    @Override
    public PageVo<Supplier> queAllSupplier(Supplier sup, int page, int rows) {
        PageVo<Supplier> pv=new PageVo<>();
        //放在 查询代码的前面 分页插件
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllSupplier(sup));
        pv.setTotal(dao.queAllSupplierCount(sup));
        return pv;
    }

    @Override
    public List<Supplier> allSupplier(Supplier supplier) {
        return dao.queAllSupplier(supplier);
    }


}
