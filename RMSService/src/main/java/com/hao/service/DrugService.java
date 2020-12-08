package com.hao.service;

import com.hao.vo.Drug;
import com.hao.vo.PageVo;

import java.util.List;

public interface DrugService {
    //增
    public int addDrug(Drug drug);
    //删
    public int delDrug(List<Integer> ids);
    //修改前查询
    public Drug xiuBeforeQueDrug(int id);
    //改
    public int xiuDrug(Drug drug);
    //查
    public PageVo<Drug> queAllDrug(Drug drug, int page, int rows);

    public List<Drug> allDrug(Drug drug);
}
