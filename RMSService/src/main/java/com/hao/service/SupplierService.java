package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.Supplier;

import java.util.List;

public interface SupplierService {
    //增
    public int addSupplier(Supplier sup);
    //删
    public int delSupplier(List<Integer> ids);
    //修改前查询
    public Supplier xiuBeforeQueSupplier(int id);
    //改
    public int xiuSupplier(Supplier sup);
    //查
    public PageVo<Supplier> queAllSupplier(Supplier sup,int page,int rows);

    public List<Supplier> allSupplier(Supplier supplier);
}
