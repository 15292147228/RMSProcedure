package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.Sell;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SellService {
    //增
    public int addSell(Sell sell);
    //删
    public int delSell(List<Integer> ids);
    //修改前查询
    public Sell xiuBeforeQueSell(int id);
    //改
    public int xiuSell(Sell sell);
    //查
    public PageVo<Sell> queAllSell(Sell sell,int page,int rows);
    public List<Sell> allSell(Sell sell);

    //按时间查询
    public PageVo<Sell> queryByTimeOfSell(int num,int page,int rows);
    public Float querySellOfMoney(int num);
}
