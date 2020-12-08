package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.ReplenishDetail;

import java.util.List;

public interface ReplenishDetailService {
    //增
    public int addReplenishDetail(ReplenishDetail rdl);
    //删
    public int delReplenishDetail(List<Integer> ids);
    //修改前查询
    public ReplenishDetail xiuBeforeQueReplenishDetail(int id);
    //cx
    public List<ReplenishDetail> isAllRepDetail(int id);
    public PageVo<ReplenishDetail> queryByRepIdRD(int id,int page,int rows);
    //改
    public int xiuReplenishDetail(ReplenishDetail rdl);
    //查
    public PageVo<ReplenishDetail> queAllReplenishDetail(ReplenishDetail rdl,int page,int rows);
}
