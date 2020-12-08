package com.hao.dao;

import com.hao.vo.OrderForm;

import java.util.List;

public interface OrderFormDao {
    //增
    public void addOrderForm(OrderForm oForm);
    //删
    public int delOrderForm(List<Integer> ids);
    //修改前查询
    public OrderForm xiuBeforeQueOrderForm(int id);
    //改
    public int xiuOrderForm(OrderForm oForm);
    //查
    public int queAllOrderFormCount(OrderForm oForm);
    public List<OrderForm> queAllOrderForm(OrderForm oForm);
}
