package com.hao.dao;
import com.hao.vo.InStorageDetail;

import java.util.List;

public interface InStorageDetailDao {
    //增
    public int addInStorageDetail(InStorageDetail insDl);
    //删
    public int delInStorageDetail(List<Integer> ids);
    //修改前查询
    public InStorageDetail xiuBeforeQueInStorageDetail(int id);
    //根据入库ID查询所有入库明细 带药品信息
    public List<InStorageDetail> queryByRepIdINSD(int id);
    //改
    public int xiuInStorageDetail(InStorageDetail insDl);
    //查
    public int queAllInStorageDetailCount(InStorageDetail insDl);
    public List<InStorageDetail> queAllInStorageDetail(InStorageDetail insDl);
}
