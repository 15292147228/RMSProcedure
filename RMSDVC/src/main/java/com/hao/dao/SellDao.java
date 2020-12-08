package com.hao.dao;

import com.hao.vo.InStorage;
import com.hao.vo.Sell;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SellDao {
    //增
    public void addSell(Sell sell);
    //删
    public int delSell(List<Integer> ids);
    //修改前查询
    public Sell xiuBeforeQueSell(int id);
    //改
    public int xiuSell(Sell sell);
    //查
    public int queAllSellCount(Sell sell);
    public List<Sell> queAllSell(Sell sell);

    //按时间查询
    public List<Sell> queryByTimeOfSell(@Param("num")int num);
    public int queryByTimeOfSellCount(@Param("num")int num);
    public Float querySellOfMoney(@Param("num")int num);
}
