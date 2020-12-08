package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.PurchaseService;
import com.hao.vo.Purchase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PurchaseControl {
    @Autowired
    PurchaseService service;
    @RequestMapping(value = "/addPurchase.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public int addPurchase(Purchase pur){
        return service.addPurchase(pur);
    }

    @PostMapping("/delPurchase.action")
    @ResponseBody
    public int delPurchase(@RequestBody List<Integer> ids){
        return service.delPurchase(ids);
    }

    @RequestMapping("/xiuBeforeQuePurchase.action")
    @ResponseBody
    public Purchase xiuBeforeQuePurchase(int id){
        return service.xiuBeforeQuePurchase(id);
    }

    @RequestMapping(value = "/xiuPurchase.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuPurchase(@RequestParam("id1") String id, @RequestParam("state1")String state){
        Purchase pur = new Purchase();
        pur.setId(Integer.parseInt(id));
        pur.setState(Integer.parseInt(state));
        if(Integer.parseInt(state)<0){return "请选择状态！";}
        int result=service.xiuPurchase(pur);
        return result==1?"操作成功":"操作失败";
    }

    @RequestMapping("/allPurchase.action")
    @ResponseBody
    public String allPurchase(Purchase pur,
                               @RequestParam(value = "page",defaultValue = "1") int page,
                               @RequestParam(value = "rows",defaultValue = "3") int rows){
        return JSONObject.toJSONString(service.queAllPurchase(pur, page, rows));
    }

    @RequestMapping("/queAllPurchase.action")
    @ResponseBody
    public List<Purchase> queAllPurchase(Purchase pur){
        return service.allPurchase(pur);
    }
}
