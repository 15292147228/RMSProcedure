package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.PurchaseDetailService;
import com.hao.service.PurchaseService;
import com.hao.service.SDrugService;
import com.hao.vo.PageVo;
import com.hao.vo.Purchase;
import com.hao.vo.PurchaseDetail;
import com.hao.vo.SDrug;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PurchaseDetailControl {
    @Autowired
    PurchaseDetailService service;
    @Autowired
    SDrugService sDrugService;
    @Autowired
    PurchaseService purService;

    @RequestMapping(value = "/addPurchaseDetail.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addPurchaseDetail(PurchaseDetail pdl){
        SDrug sDrug=sDrugService.xiuBeforeQueSDrug(pdl.getSupId());
        pdl.setAmount(sDrug.getCombPrice()*pdl.getRepQuantity());
        System.out.println("--------------======================"+pdl);
        int result=service.addPurchaseDetail(pdl);
        return result==1?"入单成功":"入单失败";
    }

    @PostMapping("/delPurchaseDetail.action")
    @ResponseBody
    public int delPurchaseDetail(@RequestBody List<Integer> ids){
        return service.delPurchaseDetail(ids);
    }

    @RequestMapping("/xiuBeforeQuePurchaseDetail.action")
    @ResponseBody
    public PurchaseDetail xiuBeforeQuePurchaseDetail(int id){
        return service.xiuBeforeQuePurchaseDetail(id);
    }

    @RequestMapping(value = "/xiuPurchaseDetail.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuPurchaseDetail(@RequestParam("id1") String id,
                                     @RequestParam("repQuantity1") String repQuantity,
                                     @RequestParam("remark1")String remark){
       PurchaseDetail pdl=new PurchaseDetail();
        pdl.setId(Integer.parseInt(id));
        pdl.setRepQuantity(Integer.parseInt(repQuantity));
        pdl.setRemark(remark);
        int result= service.xiuPurchaseDetail(pdl);
        return result==1?"操作成功":"操作失败";
    }

    @RequestMapping("/allPurchaseDetail.action")
    @ResponseBody
    public PageVo<PurchaseDetail> allPurchaseDetail(PurchaseDetail pdl, int page, int rows){
        return service.queAllPurchaseDetail(pdl, page, rows);
    }

    @RequestMapping("/queryByRepIdPD.action")
    @ResponseBody
    public String queryByRepIdPD(int id,int page,int rows){
        return JSONObject.toJSONString(service.queryByRepIdPD(id, page, rows));
    }

    @RequestMapping("/purPutIn.action")
    @ResponseBody
    public int submitPurchase(int id){
        float sum=0;
        List<PurchaseDetail> list=service.isAllPurDetail(id);
        for (PurchaseDetail pdl:list){
            sum+=pdl.getAmount();
        }
        Purchase pur=new Purchase();
        pur.setAggregate(sum);
        pur.setId(id);
        return purService.xiuPurchase(pur);
    }
}
