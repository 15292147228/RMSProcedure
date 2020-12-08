package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.Replenish;

import java.util.List;

public interface ReplenishService {
    //增
    public int addReplenish(Replenish rep);
    //删
    public int delReplenish(List<Integer> ids);
    //修改前查询
    public Replenish xiuBeforeQueReplenish(int id);
    //改
    public int xiuReplenish(Replenish rep);
    //查
    public PageVo<Replenish> queAllReplenish(Replenish rep,int page,int rows);

    public List<Replenish> allReplenish(Replenish rep);
}
