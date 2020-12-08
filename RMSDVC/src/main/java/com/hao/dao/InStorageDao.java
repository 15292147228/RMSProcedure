package com.hao.dao;

import com.hao.vo.InStorage;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface InStorageDao {
    //增
    public void addInStorage(InStorage ins);
    //删
    public int delInStorage(List<Integer> ids);
    //修改前查询
    public InStorage xiuBeforeQueInStorage(int id);
    //改
    public int xiuInStorage(InStorage ins);
    //查
    public int queAllInStorageCount(InStorage ins);
    public List<InStorage> queAllInStorage(InStorage ins);

    //按时间查询
    public List<InStorage> queryByTimeOfIns(@Param("num")int num);
    public int queryByTimeOfCount(@Param("num")int num);
    public Float querySumOfMoney(@Param("num")int num);
}
