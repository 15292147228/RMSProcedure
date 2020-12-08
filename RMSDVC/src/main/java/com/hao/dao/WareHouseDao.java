package com.hao.dao;

import com.hao.vo.WareHouse;

import java.util.List;

public interface WareHouseDao {
    //增
    public int addWareHouse(WareHouse wh);
    //删
    public int delWareHouse(List<Integer> ids);
    //修改前查询
    public WareHouse xiuBeforeQueWareHouse(int id);
    //改
    public int xiuWareHouse(WareHouse wh);
    //查
    public int queAllWareHouseCount(WareHouse wh);
    public List<WareHouse> queAllWareHouse(WareHouse wh);
}
