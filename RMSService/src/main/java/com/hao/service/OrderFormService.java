package com.hao.service;

import com.hao.vo.OrderForm;
import com.hao.vo.PageVo;

import java.util.List;

public interface OrderFormService {
    //增
    public int addOrderForm(OrderForm oForm);
    //删
    public int delOrderForm(List<Integer> ids);
    //修改前查询
    public OrderForm xiuBeforeQueOrderForm(int id);
    //改
    public int xiuOrderForm(OrderForm oForm);
    //查
    public PageVo<OrderForm> queAllOrderForm(OrderForm oForm,int page,int rows);
    public List<OrderForm> allOrderForm(OrderForm oForm);
}
