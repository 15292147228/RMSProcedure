package com.hao.dao;

import com.hao.vo.PurchaseDetail;

import java.util.List;

public interface PurchaseDetailDao {
    //增
    public int addPurchaseDetail(PurchaseDetail pdl);
    //删
    public int delPurchaseDetail(List<Integer> ids);
    //修改前查询
    public PurchaseDetail xiuBeforeQuePurchaseDetail(int id);
    public List<PurchaseDetail> queryByRepIdPD(int id);
    //改
    public int xiuPurchaseDetail(PurchaseDetail pdl);
    //查
    public int queAllPurchaseDetailCount(PurchaseDetail pdl);
    public List<PurchaseDetail> queAllPurchaseDetail(PurchaseDetail pdl);
}
