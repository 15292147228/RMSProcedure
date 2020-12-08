package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.OrderFormService;
import com.hao.service.RepertoryService;
import com.hao.service.SellDetailService;
import com.hao.service.SellService;
import com.hao.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class OrderFormControl {
    @Autowired
    OrderFormService service;
    @Autowired
    SellService sellService;
    @Autowired
    SellDetailService sellDService;
    @Autowired
    RepertoryService repService;

    @RequestMapping(value = "/addOrderForm.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public int addOrderForm(OrderForm oForm){
        return service.addOrderForm(oForm);
    }

    @PostMapping("/delOrderForm.action")
    @ResponseBody
    public int delOrderForm(@RequestBody List<Integer> ids){
        return service.delOrderForm(ids);
    }

    @RequestMapping("/xiuBeforeQueOrderForm.action")
    @ResponseBody
    public OrderForm xiuBeforeQueOrderForm(int id){
        return service.xiuBeforeQueOrderForm(id);
    }

    @RequestMapping(value = "/xiuOrderForm.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuOrderForm(@RequestParam("idU") String id, @RequestParam("stateU")String state){
        OrderForm oForm=new OrderForm();
        oForm.setId(Integer.parseInt(id));
        oForm.setState(Integer.parseInt(state));
        if(Integer.parseInt(state)<0){return "请选择状态！";}
        int result=service.xiuOrderForm(oForm);
        //通过则生成销售单
        if (result==1&&oForm.getState()==2){
            OrderForm orderForm=service.xiuBeforeQueOrderForm(oForm.getId());
            Sell sell=new Sell();
            sell.setUserId(orderForm.getUserId());
            sell.setAggregate(orderForm.getAggregate());
            sell.setState(orderForm.getState());
            int sid=sellService.addSell(sell);
            for (OfDetail ofDetail:orderForm.getOfDetail()){
               SellDetail sellD=new SellDetail();
                sellD.setReperId(ofDetail.getReperId());
                sellD.setCount(ofDetail.getCount());
                sellD.setAmount(ofDetail.getAmount());
                sellD.setRemark(ofDetail.getRemark());
                sellD.setSellId(sid);
                sellDService.addSellDetail(sellD);
                //从库存里面减掉卖出的
                Repertory repertory=repService.xiuBeforeQueRepertory(ofDetail.getReperId());
                Repertory rep=new Repertory();
                rep.setSaveNum(repertory.getSaveNum()-ofDetail.getCount());
                rep.setId(repertory.getId());
                repService.xiuRepertory(rep);
            }
        }
        return result==1?"操作成功":"操作失败";
    }

    @RequestMapping("/allOrderForm.action")
    @ResponseBody
    public String allOrderForm(OrderForm oForm,
                               @RequestParam(value = "page",defaultValue = "1") int page,
                               @RequestParam(value = "rows",defaultValue = "3") int rows){
        return JSONObject.toJSONString(service.queAllOrderForm(oForm, page, rows));
    }

    @RequestMapping("/queAllOrderForm.action")
    @ResponseBody
    public List<OrderForm> queAllOrderForm(OrderForm oForm){
        return service.allOrderForm(oForm);
    }
}
