package com.hao.service;

import com.hao.vo.InStorage;
import com.hao.vo.PageVo;

import java.util.Date;
import java.util.List;

public interface InStorageService {
    //增
    public int addInStorage(InStorage ins);
    //删
    public int delInStorage(List<Integer> ids);
    //修改前查询
    public InStorage xiuBeforeQueInStorage(int id);
    //改
    public int xiuInStorage(InStorage ins);
    //查
    public PageVo<InStorage> queAllInStorage(InStorage ins,int page,int rows);

    public List<InStorage> allInStorage(InStorage ins);

    //按时间查询
    public PageVo<InStorage> queryByTimeOfIns(int num,int page,int rows);
    public Float querySumOfMoney(int num);
}
