package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.OrderFormDao;
import com.hao.service.OrderFormService;
import com.hao.vo.OrderForm;
import com.hao.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderFormServiceImpl implements OrderFormService{
    @Autowired
    OrderFormDao dao;

    @Override
    public int addOrderForm(OrderForm oForm) {
            dao.addOrderForm(oForm);
            return oForm.getId();
    }

    @Override
    public int delOrderForm(List<Integer> ids) {
        return dao.delOrderForm(ids);
    }

    @Override
    public OrderForm xiuBeforeQueOrderForm(int id) {
        return dao.xiuBeforeQueOrderForm(id);
    }

    @Override
    public int xiuOrderForm(OrderForm oForm) {
        return dao.xiuOrderForm(oForm);
    }

    @Override
    public PageVo<OrderForm> queAllOrderForm(OrderForm oForm, int page, int rows) {
        PageVo<OrderForm> pv=new PageVo<OrderForm>();
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllOrderForm(oForm));
        pv.setTotal(dao.queAllOrderFormCount(oForm));
        return pv;
    }

    @Override
    public List<OrderForm> allOrderForm(OrderForm oForm) {
        return dao.queAllOrderForm(oForm);
    }
}
