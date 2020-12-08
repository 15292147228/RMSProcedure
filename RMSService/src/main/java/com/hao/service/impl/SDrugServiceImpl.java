package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.SDrugDao;
import com.hao.service.SDrugService;
import com.hao.vo.PageVo;
import com.hao.vo.SDrug;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SDrugServiceImpl implements SDrugService {
    @Autowired
    SDrugDao dao;
    @Override
    public int addSDrug(SDrug sDrug) {
        return dao.addSDrug(sDrug);
    }

    @Override
    public int delSDrug(List<Integer> ids) {
        return dao.delSDrug(ids);
    }

    @Override
    public SDrug xiuBeforeQueSDrug(int id) {
        return dao.xiuBeforeQueSDrug(id);
    }

    @Override
    public int xiuSDrug(SDrug sDrug) {
        return dao.xiuSDrug(sDrug);
    }

    @Override
    public PageVo<SDrug> queAllSDrug(SDrug sDrug, int page, int rows) {
        PageVo<SDrug> pv=new PageVo<SDrug>();
        //放在 查询代码的前面 分页插件
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllSDrug(sDrug));
        pv.setTotal(dao.queAllSDrugCount(sDrug));
        return pv;
    }
}
