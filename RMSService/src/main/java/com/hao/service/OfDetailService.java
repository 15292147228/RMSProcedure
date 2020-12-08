package com.hao.service;

import com.hao.vo.OfDetail;
import com.hao.vo.PageVo;

import java.util.List;

public interface OfDetailService {
    //增
    public int addOfDetail(OfDetail ofDetail);
    //删
    public int delOfDetail(List<Integer> ids);
    //修改前查询
    public OfDetail xiuBeforeQueOfDetail(int id);

    public List<OfDetail> isAllOFDetail(int id);
    public PageVo<OfDetail> queryByRepIdOFD(int id,int page,int rows);

    //改
    public int xiuOfDetail(OfDetail ofDetail);
    //查
    public PageVo<OfDetail> queAllOfDetail(OfDetail ofDetail,int page,int rows);
}
