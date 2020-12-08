package com.hao.dao;

import com.hao.vo.Supplier;

import java.util.List;

public interface SupplierDao {
    //增
    public int addSupplier(Supplier sup);
    //删
    public int delSupplier(List<Integer> ids);
    //修改前查询
    public Supplier xiuBeforeQueSupplier(int id);
    //改
    public int xiuSupplier(Supplier sup);
    //查
    public int queAllSupplierCount(Supplier sup);
    public List<Supplier> queAllSupplier(Supplier sup);
}
