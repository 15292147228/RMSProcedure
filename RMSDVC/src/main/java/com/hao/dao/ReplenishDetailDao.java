package com.hao.dao;
import com.hao.vo.ReplenishDetail;

import java.util.List;

public interface ReplenishDetailDao {
    //增
    public int addReplenishDetail(ReplenishDetail rdl);
    //删
    public int delReplenishDetail(List<Integer> ids);
    //修改前查询
    public ReplenishDetail xiuBeforeQueReplenishDetail(int id);
    public List<ReplenishDetail> queryByRepIdRD(int id);
    //改
    public int xiuReplenishDetail(ReplenishDetail rdl);
    //查
    public int queAllReplenishDetailCount(ReplenishDetail rdl);
    public List<ReplenishDetail> queAllReplenishDetail(ReplenishDetail rdl);
}
