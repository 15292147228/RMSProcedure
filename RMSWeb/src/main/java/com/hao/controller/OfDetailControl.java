package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.OfDetailService;
import com.hao.service.OrderFormService;
import com.hao.service.RepertoryService;
import com.hao.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class OfDetailControl{
    @Autowired
    OfDetailService service;

    @Autowired
    RepertoryService repService;

    @Autowired
    OrderFormService ofService;

    @RequestMapping(value = "/addOfDetail.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addOfDetail(OfDetail ofDetail){
        Repertory rep=repService.xiuBeforeQueRepertory(ofDetail.getReperId());
        ofDetail.setAmount(rep.getDrug().getSellPrince()*ofDetail.getCount());
        List<OfDetail> ofs=service.isAllOFDetail(ofDetail.getOformId());
        for (OfDetail of:ofs){
            if (ofDetail.getReperId()==of.getReperId()){
                OfDetail ol=new OfDetail();
               ol.setId(of.getId());
               ol.setCount(of.getCount()+ofDetail.getCount());
               ol.setAmount(of.getAmount()+ofDetail.getAmount());
               ol.setRemark(ofDetail.getRemark());
                System.out.println("--------------======================"+ol);
                int flag=service.xiuOfDetail(ol);
                return flag==1?"入单成功":"入单失败";
            }
        }
        System.out.println("--------------======================"+ofDetail);
        int result=service.addOfDetail(ofDetail);
        return result==1?"入单成功":"入单失败";
    }

    @PostMapping("/delOfDetail.action")
    @ResponseBody
    public int delOfDetail(@RequestBody List<Integer> ids){
        return service.delOfDetail(ids);
    }

    @RequestMapping("/xiuBeforeQueOfDetail.action")
    @ResponseBody
    public OfDetail xiuBeforeQueOfDetail(int id){
        return service.xiuBeforeQueOfDetail(id);
    }

    @RequestMapping(value = "/xiuOfDetail.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuOfDetail(@RequestParam("idH") String id, @RequestParam("perIdH") String reperId,
                                     @RequestParam("countH") String count,
                                     @RequestParam("remarkH")String remark){
        OfDetail ofDetail=new OfDetail();
        ofDetail.setId(Integer.parseInt(id));
        ofDetail.setReperId(Integer.parseInt(reperId));
        ofDetail.setCount(Integer.parseInt(count));
        ofDetail.setRemark(remark);
        Repertory rep=repService.xiuBeforeQueRepertory(ofDetail.getReperId());
        ofDetail.setAmount(rep.getDrug().getSellPrince()*ofDetail.getCount());
        int result= service.xiuOfDetail(ofDetail);
        return result==1?"操作成功":"操作失败";
    }

    @RequestMapping("/allOfDetail.action")
    @ResponseBody
    public PageVo<OfDetail> allOfDetail(OfDetail ofDetail, int page, int rows){
        return service.queAllOfDetail(ofDetail, page, rows);
    }

    @RequestMapping("/queryByRepIdOFD.action")
    @ResponseBody
    public String queryByRepIdOFD(int id,int page,int rows){
        return JSONObject.toJSONString(service.queryByRepIdOFD(id, page, rows));
    }

    @RequestMapping("/OFPutIn.action")
    @ResponseBody
    public int submitOrderForm(int id){
        float sum=0;
        List<OfDetail> list=service.isAllOFDetail(id);
        for (OfDetail ofDetail:list){
            sum+=ofDetail.getAmount();
        }
        OrderForm of=new OrderForm();
        of.setAggregate(sum);
        of.setId(id);
        return ofService.xiuOrderForm(of);
    }
}
