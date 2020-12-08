package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.SellService;
import com.hao.vo.Sell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SellControl {
    @Autowired
    SellService service;

    @PostMapping("/delSell.action")
    @ResponseBody
    public int delSell(@RequestBody List<Integer> ids){
        return service.delSell(ids);
    }

    @RequestMapping("/xiuBeforeQueSell.action")
    @ResponseBody
    public Sell xiuBeforeQueSell(int id){
        return service.xiuBeforeQueSell(id);
    }

    @RequestMapping(value = "/xiuSell.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuSell(@RequestParam("id2") String id, @RequestParam("roleId2")String roleId, @RequestParam("state2")String state){
        System.out.println(state+"----------=============="+id);
        Sell sell=new Sell();
        sell.setId(Integer.parseInt(id));
        if (roleId!=null&&roleId!=""){
            sell.setRoleId(Integer.parseInt(roleId));
        }
        sell.setState(Integer.parseInt(state));
        if(Integer.parseInt(state)<0){return "请选择状态！";}
        int result=service.xiuSell(sell);
        return result==1?"操作成功":"操作失败";
    }

    @RequestMapping("/allSell.action")
    @ResponseBody
    public String allSell(Sell sell,
                               @RequestParam(value = "page",defaultValue = "1") int page,
                               @RequestParam(value = "rows",defaultValue = "3") int rows){
        return JSONObject.toJSONString(service.queAllSell(sell, page, rows));
    }

    @RequestMapping("/queAllSell.action")
    @ResponseBody
    public List<Sell> queAllSell(Sell sell){
        return service.allSell(sell);
    }

    @RequestMapping("/queTimeSell.action")
    @ResponseBody
    public String queTimeSell(int num,
                              @RequestParam(value = "page",defaultValue = "1") int page,
                              @RequestParam(value = "rows",defaultValue = "3") int rows){
        return JSONObject.toJSONString(service.queryByTimeOfSell(num,page,rows));
    }
    @RequestMapping("/queMoneySell.action")
    @ResponseBody
    public Float queMoneyS(int num){
        Float sum=service.querySellOfMoney(num);
        return sum==null?0:sum;
    }
}
