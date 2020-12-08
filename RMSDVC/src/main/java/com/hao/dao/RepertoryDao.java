package com.hao.dao;

import com.hao.vo.Repertory;

import java.util.List;

public interface RepertoryDao {
    //增
    public int addRepertory(Repertory rep);
    //删
    public int delRepertory(List<Integer> ids);
    //修改前查询
    public Repertory xiuBeforeQueRepertory(int id);
    //改
    public int xiuRepertory(Repertory rep);
    //查
    public int queAllRepertoryCount(Repertory rep);
    public List<Repertory> queAllRepertory(Repertory rep);

    //根据仓库ID查询药品库存
    public List<Repertory> byWareIdQueAllRep(int id);
}
