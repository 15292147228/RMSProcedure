package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.*;
import com.hao.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Controller
public class ReplenishControl {
    @Autowired
    ReplenishService service;
    @Autowired
    PurchaseService purService;
    @Autowired
    PurchaseDetailService purDetailService;
    @Autowired
    InStorageService inService;
    @Autowired
    InStorageDetailService insDetailService;
    @RequestMapping(value = "/addReplenish.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public int addReplenish(Replenish rep){
        return service.addReplenish(rep);
    }

    @PostMapping("/delReplenish.action")
    @ResponseBody
    public int delReplenish(@RequestBody List<Integer> ids){
        return service.delReplenish(ids);
    }

    @RequestMapping("/xiuBeforeQueReplenish.action")
    @ResponseBody
    public Replenish xiuBeforeQueReplenish(int id){
        return service.xiuBeforeQueReplenish(id);
    }

    @RequestMapping(value = "/xiuReplenish.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuReplenish(@RequestParam("id1") String id, @RequestParam("state1")String state){
        System.out.println(id+"============添加返回ID："+state);
        Replenish rep=new Replenish();
        rep.setId(Integer.parseInt(id));
        rep.setState(Integer.parseInt(state));
        if(Integer.parseInt(state)<0){return "请选择状态！";}
        int result=service.xiuReplenish(rep);
        //通过则生成采购单
        if (result==1&&rep.getState()==2){
            Replenish replenish=service.xiuBeforeQueReplenish(rep.getId());
            Purchase pur=new Purchase();
            pur.setAggregate(replenish.getAggregate());
            int pid=purService.addPurchase(pur);
            for (ReplenishDetail pdl:replenish.getRepDetail()){
                PurchaseDetail purDetail=new PurchaseDetail();
                purDetail.setSupId(pdl.getSupId());
                purDetail.setRepQuantity(pdl.getRepQuantity());
                purDetail.setAmount(pdl.getAmount());
                purDetail.setRemark(pdl.getRemark());
                purDetail.setPurId(pid);
                purDetailService.addPurchaseDetail(purDetail);
            }
            //通过则生成入库单
            InStorage ins=new InStorage();
            ins.setAggregate(replenish.getAggregate());
            ins.setPurId(pid);
            int insId=inService.addInStorage(ins);
            for (ReplenishDetail pdl:replenish.getRepDetail()){
                InStorageDetail insDetail=new InStorageDetail();
                insDetail.setSupId(pdl.getSupId());
                insDetail.setRepQuantity(pdl.getRepQuantity());
                insDetail.setAmount(pdl.getAmount());
                insDetail.setRemark(pdl.getRemark());
                insDetail.setInstId(insId);
                insDetailService.addInStorageDetail(insDetail);
            }
        }
        return result==1?"操作成功":"操作失败";
    }

    @RequestMapping("/allReplenish.action")
    @ResponseBody
    public String allReplenish(Replenish rep,
                                   @RequestParam(value = "page",defaultValue = "1") int page,
                                   @RequestParam(value = "rows",defaultValue = "3") int rows){
        return JSONObject.toJSONString(service.queAllReplenish(rep, page, rows));
    }

    @RequestMapping("/queAllReplenish.action")
    @ResponseBody
    public List<Replenish> queAllReplenish(Replenish rep){
        return service.allReplenish(rep);
    }

}
