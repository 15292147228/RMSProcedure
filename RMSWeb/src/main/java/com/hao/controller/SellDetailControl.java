package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.RepertoryService;
import com.hao.service.SellDetailService;
import com.hao.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SellDetailControl {
    @Autowired
    SellDetailService service;
    @Autowired
    RepertoryService repService;

    @PostMapping("/delSellDetail.action")
    @ResponseBody
    public int delSellDetail(@RequestBody List<Integer> ids){
        return service.delSellDetail(ids);
    }

    @RequestMapping("/xiuBeforeQueSellDetail.action")
    @ResponseBody
    public SellDetail xiuBeforeQueSellDetail(int id){
        return service.xiuBeforeQueSellDetail(id);
    }

    @RequestMapping(value = "/xiuSellDetail.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuSellDetail(@RequestParam("idE")String id, @RequestParam("wareId3")String reperId){
        SellDetail sellD=service.xiuBeforeQueSellDetail(Integer.parseInt(id));
        if (sellD.getReperId()>0){
            return "已出库!";
        }
        SellDetail sellDetail=new SellDetail();
        sellDetail.setId(Integer.parseInt(id));
        sellDetail.setReperId(Integer.parseInt(reperId));
        Repertory rep=repService.xiuBeforeQueRepertory(Integer.parseInt(reperId));
        rep.setSaveNum(rep.getSaveNum()-sellDetail.getCount());
        repService.xiuRepertory(rep);

        int result= service.xiuSellDetail(sellDetail);
        return result==1?"操作成功":"操作失败";
    }

    @RequestMapping("/allSellDetail.action")
    @ResponseBody
    public PageVo<SellDetail> allSellDetail(SellDetail sellDetail, int page, int rows){
        return service.queAllSellDetail(sellDetail, page, rows);
    }

    @RequestMapping("/queryBySellIdINSellD.action")
    @ResponseBody
    public String queryBySellIdINSellD(int id,int page,int rows){
        return JSONObject.toJSONString(service.isAllSellDetail(id, page, rows));
    }

}
