package com.hao.dao;

import com.hao.vo.ReplenishDetail;
import com.hao.vo.SellDetail;

import java.util.List;

public interface SellDetailDao {
    //增
    public int addSellDetail(SellDetail sellDetail);
    //删
    public int delSellDetail(List<Integer> ids);
    //修改前查询
    public SellDetail xiuBeforeQueSellDetail(int id);
    public List<SellDetail> queryByRepIdSD(int id);
    //改
    public int xiuSellDetail(SellDetail sellDetail);
    //查
    public int queAllSellDetailCount(SellDetail sellDetail);
    public List<SellDetail> queAllSellDetail(SellDetail sellDetail);
}
