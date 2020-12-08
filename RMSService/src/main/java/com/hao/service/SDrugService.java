package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.SDrug;

import java.util.List;

public interface SDrugService {
    //增
    public int addSDrug(SDrug sDrug);
    //删
    public int delSDrug(List<Integer> ids);
    //修改前查询
    public SDrug xiuBeforeQueSDrug(int id);
    //改
    public int xiuSDrug(SDrug sDrug);
    //查
    public PageVo<SDrug> queAllSDrug(SDrug sDrug,int page,int rows);
}
