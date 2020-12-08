package com.hao.service;
import com.hao.vo.InStorageDetail;
import com.hao.vo.PageVo;

import java.util.List;

public interface InStorageDetailService {
    //增
    public int addInStorageDetail(InStorageDetail insDl);
    //删
    public int delInStorageDetail(List<Integer> ids);
    //修改前查询
    public InStorageDetail xiuBeforeQueInStorageDetail(int id);
    //根据入库ID查询所有入库明细 带药品信息
    public List<InStorageDetail> isAllInsDetail(int id);
    public PageVo<InStorageDetail> queryByRepIdINSD(int id,int page,int rows);
    //改
    public int xiuInStorageDetail(InStorageDetail insDl);
    //查
    public PageVo<InStorageDetail> queAllInStorageDetail(InStorageDetail insDl,int page,int rows);
}
