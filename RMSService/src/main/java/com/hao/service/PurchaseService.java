package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.Purchase;

import java.util.List;

public interface PurchaseService {
    //增
    public int addPurchase(Purchase pur);
    //删
    public int delPurchase(List<Integer> ids);
    //修改前查询
    public Purchase xiuBeforeQuePurchase(int id);
    //改
    public int xiuPurchase(Purchase pur);
    //查
    public PageVo<Purchase> queAllPurchase(Purchase pur,int page,int rows);
    public List<Purchase> allPurchase(Purchase pur);
}
