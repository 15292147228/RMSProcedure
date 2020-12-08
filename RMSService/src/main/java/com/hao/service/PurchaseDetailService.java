package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.PurchaseDetail;

import java.util.List;

public interface PurchaseDetailService {
    //增
    public int addPurchaseDetail(PurchaseDetail pdl);
    //删
    public int delPurchaseDetail(List<Integer> ids);
    //修改前查询
    public PurchaseDetail xiuBeforeQuePurchaseDetail(int id);
    //cx
    public List<PurchaseDetail> isAllPurDetail(int id);
    public PageVo<PurchaseDetail> queryByRepIdPD(int id,int page,int rows);
    //改
    public int xiuPurchaseDetail(PurchaseDetail pdl);
    //查
    public PageVo<PurchaseDetail> queAllPurchaseDetail(PurchaseDetail pdl,int page,int rows);
}
