package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.RepertoryDao;
import com.hao.service.RepertoryService;
import com.hao.vo.PageVo;
import com.hao.vo.Repertory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RepertoryServiceImpl implements RepertoryService {
    @Autowired
    RepertoryDao dao;

    @Override
    public int addRepertory(Repertory rep) {
        return dao.addRepertory(rep);
    }

    @Override
    public int delRepertory(List<Integer> ids) {
        return dao.delRepertory(ids);
    }

    @Override
    public Repertory xiuBeforeQueRepertory(int id) {
        return dao.xiuBeforeQueRepertory(id);
    }

    @Override
    public int xiuRepertory(Repertory rep) {
        return dao.xiuRepertory(rep);
    }

    @Override
    public PageVo<Repertory> queAllRepertory(Repertory rep, int page, int rows) {
        PageVo<Repertory> pv=new PageVo<Repertory>();
        //放在 查询代码的前面 分页插件
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllRepertory(rep));
        pv.setTotal(dao.queAllRepertoryCount(rep));
        return pv;
    }

    @Override
    public List<Repertory> byWareIdQueAllRep(int id) {
        return dao.byWareIdQueAllRep(id);
    }

}
