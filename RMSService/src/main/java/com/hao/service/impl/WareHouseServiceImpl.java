package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.WareHouseDao;
import com.hao.service.WareHouseService;
import com.hao.vo.PageVo;
import com.hao.vo.WareHouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class WareHouseServiceImpl implements WareHouseService {
    @Autowired
    WareHouseDao dao;
    @Override
    public int addWareHouse(WareHouse wh) {
        return dao.addWareHouse(wh);
    }

    @Override
    public int delWareHouse(List<Integer> ids) {
        return dao.delWareHouse(ids);
    }

    @Override
    public WareHouse xiuBeforeQueWareHouse(int id) {
        return dao.xiuBeforeQueWareHouse(id);
    }

    @Override
    public int xiuWareHouse(WareHouse wh) {
        return dao.xiuWareHouse(wh);
    }

    @Override
    public PageVo<WareHouse> queAllWareHouse(WareHouse wh, int page, int rows) {
        PageVo<WareHouse> pv=new PageVo<>();
        //放在 查询代码的前面 分页插件
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllWareHouse(wh));
        pv.setTotal(dao.queAllWareHouseCount(wh));
        return pv;
    }

    @Override
    public List<WareHouse> allWareHouse(WareHouse wh) {
        return dao.queAllWareHouse(wh);
    }
}
