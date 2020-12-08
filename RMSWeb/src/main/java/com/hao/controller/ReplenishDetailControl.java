package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.ReplenishDetailService;
import com.hao.service.ReplenishService;
import com.hao.service.SDrugService;
import com.hao.vo.PageVo;
import com.hao.vo.Replenish;
import com.hao.vo.ReplenishDetail;
import com.hao.vo.SDrug;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Controller
public class ReplenishDetailControl {
    @Autowired
    ReplenishDetailService service;
    @Autowired
    SDrugService sDrugService;
    @Autowired
    ReplenishService repService;
    @RequestMapping(value = "/addReplenishDetail.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addReplenishDetail(ReplenishDetail rdl){
        SDrug sDrug=sDrugService.xiuBeforeQueSDrug(rdl.getSupId());
        rdl.setAmount(sDrug.getCombPrice()*rdl.getRepQuantity());
        List<ReplenishDetail> reps=service.isAllRepDetail(rdl.getRepId());
        for (ReplenishDetail rep:reps){
            if (rdl.getSupId()==rep.getSupId()){
                ReplenishDetail rl=new ReplenishDetail();
                rl.setId(rep.getId());
                rl.setRepQuantity(rep.getRepQuantity()+rdl.getRepQuantity());
                rl.setAmount(rep.getAmount()+rdl.getAmount());
                rl.setRemark(rdl.getRemark());
                int flag=service.xiuReplenishDetail(rl);
                return flag==1?"入单成功":"入单失败";
            }
        }
        System.out.println("--------------======================"+rdl);
        int result=service.addReplenishDetail(rdl);
        return result==1?"入单成功":"入单失败";
    }

    @PostMapping("/delReplenishDetail.action")
    @ResponseBody
    public int delReplenishDetail(@RequestBody List<Integer> ids){
        return service.delReplenishDetail(ids);
    }

    @RequestMapping("/xiuBeforeQueReplenishDetail.action")
    @ResponseBody
    public ReplenishDetail xiuBeforeQueReplenishDetail(int id){
        return service.xiuBeforeQueReplenishDetail(id);
    }

    @RequestMapping(value = "/xiuReplenishDetail.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuReplenishDetail(@RequestParam("id1") String id,@RequestParam("supId1") String supId,
                              @RequestParam("repQuantity1") String repQuantity,
                              @RequestParam("remark1")String remark){
        ReplenishDetail rdl = new ReplenishDetail();
        rdl.setId(Integer.parseInt(id));
        rdl.setSupId(Integer.parseInt(supId));
        rdl.setRepQuantity(Integer.parseInt(repQuantity));
        rdl.setRemark(remark);
        SDrug sDrug=sDrugService.xiuBeforeQueSDrug(rdl.getSupId());
        rdl.setAmount(sDrug.getCombPrice()*rdl.getRepQuantity());
        int result= service.xiuReplenishDetail(rdl);
        return result==1?"操作成功":"操作失败";
    }

    @RequestMapping("/allReplenishDetail.action")
    @ResponseBody
    public PageVo<ReplenishDetail> allReplenishDetail(ReplenishDetail rdl,int page,int rows){
        return service.queAllReplenishDetail(rdl, page, rows);
    }

    @RequestMapping("/queryByRepIdRD.action")
    @ResponseBody
    public String queryByRepIdRD(int id,int page,int rows){
        return JSONObject.toJSONString(service.queryByRepIdRD(id,page,rows));
    }

    @RequestMapping("/ReplPutIn.action")
    @ResponseBody
    public int submitReplenish(int id){
        float sum=0;
        List<ReplenishDetail> list=service.isAllRepDetail(id);
        for (ReplenishDetail rdl:list){
            sum+=rdl.getAmount();
        }
        Replenish repl=new Replenish();
        repl.setAggregate(sum);
        repl.setId(id);
        return repService.xiuReplenish(repl);
    }
}
