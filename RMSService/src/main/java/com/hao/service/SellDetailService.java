package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.SellDetail;

import java.util.List;

public interface SellDetailService {
    //增
    public int addSellDetail(SellDetail sellDetail);
    //删
    public int delSellDetail(List<Integer> ids);
    //修改前查询
    public SellDetail xiuBeforeQueSellDetail(int id);

    public PageVo<SellDetail> isAllSellDetail(int id,int page,int rows);
    public List<SellDetail> queryByRepIdSD(int id);
    //改
    public int xiuSellDetail(SellDetail sellDetail);
    //查
    public PageVo<SellDetail> queAllSellDetail(SellDetail sellDetail,int page,int rows);
}
