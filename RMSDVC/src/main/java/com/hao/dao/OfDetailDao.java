package com.hao.dao;

import com.hao.vo.OfDetail;

import java.util.List;

public interface OfDetailDao {
    //增
    public int addOfDetail(OfDetail ofDetail);
    //删
    public int delOfDetail(List<Integer> ids);
    //修改前查询
    public OfDetail xiuBeforeQueOfDetail(int id);
    public List<OfDetail> queryByRepIdOFD(int id);
    //改
    public int xiuOfDetail(OfDetail ofDetail);
    //查
    public int queAllOfDetailCount(OfDetail ofDetail);
    public List<OfDetail> queAllOfDetail(OfDetail ofDetail);
}
