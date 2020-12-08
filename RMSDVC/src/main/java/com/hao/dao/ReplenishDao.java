package com.hao.dao;
import com.hao.vo.Replenish;

import java.util.List;

public interface ReplenishDao {
    //增
    public void addReplenish(Replenish rep);
    //删
    public int delReplenish(List<Integer> ids);
    //修改前查询
    public Replenish xiuBeforeQueReplenish(int id);
    //改
    public int xiuReplenish(Replenish rep);
    //查
    public int queAllReplenishCount(Replenish rep);
    public List<Replenish> queAllReplenish(Replenish rep);
}
