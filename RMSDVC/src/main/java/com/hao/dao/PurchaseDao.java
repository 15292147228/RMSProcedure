package com.hao.dao;

import com.hao.vo.Purchase;

import java.util.List;

public interface PurchaseDao {
    //增
    public void addPur(Purchase pur);
    //删
    public int delPurchase(List<Integer> ids);
    //修改前查询
    public Purchase xiuBeforeQuePurchase(int id);
    //改
    public int xiuPurchase(Purchase pur);
    //查
    public int queAllPurchaseCount(Purchase pur);
    public List<Purchase> queAllPurchase(Purchase pur);
}
