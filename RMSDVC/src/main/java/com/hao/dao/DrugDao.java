package com.hao.dao;

import com.hao.vo.Drug;

import java.util.List;

public interface DrugDao {
    //增
    public int addDrug(Drug drug);
    //删
    public int delDrug(List<Integer> ids);
    //修改前查询
    public Drug xiuBeforeQueDrug(int id);
    //改
    public int xiuDrug(Drug drug);
    //查
    public int queAllDrugCount(Drug drug);
    public List<Drug> queAllDrug(Drug drug);
}
