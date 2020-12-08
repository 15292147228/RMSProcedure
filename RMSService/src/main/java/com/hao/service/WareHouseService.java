package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.WareHouse;

import java.util.List;

public interface WareHouseService {
    //增
    public int addWareHouse(WareHouse wh);
    //删
    public int delWareHouse(List<Integer> ids);
    //修改前查询
    public WareHouse xiuBeforeQueWareHouse(int id);
    //改
    public int xiuWareHouse(WareHouse wh);
    //查
    public PageVo<WareHouse> queAllWareHouse(WareHouse wh,int page,int rows);

    public List<WareHouse> allWareHouse(WareHouse wh);
}
