package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.Repertory;

import java.util.List;

public interface RepertoryService {
    //增
    public int addRepertory(Repertory rep);
    //删
    public int delRepertory(List<Integer> ids);
    //修改前查询
    public Repertory xiuBeforeQueRepertory(int id);
    //改
    public int xiuRepertory(Repertory rep);
    //查
    public PageVo<Repertory> queAllRepertory(Repertory rep, int page, int rows);

    //根据仓库ID查询药品库存
    public List<Repertory> byWareIdQueAllRep(int id);
}
