package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.InStorageDetailService;
import com.hao.service.RepertoryService;
import com.hao.service.SDrugService;
import com.hao.vo.InStorageDetail;
import com.hao.vo.PageVo;
import com.hao.vo.Repertory;
import com.hao.vo.SDrug;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class InStorageDetailControl {
    @Autowired
    InStorageDetailService service;
    @Autowired
    RepertoryService repService;
    @Autowired
    SDrugService sDrugService;

    @PostMapping("/delInStorageDetail.action")
    @ResponseBody
    public int delInStorageDetail(@RequestBody List<Integer> ids){
        return service.delInStorageDetail(ids);
    }

    @RequestMapping("/xiuBeforeQueInStorageDetail.action")
    @ResponseBody
    public InStorageDetail xiuBeforeQueInStorageDetail(int id){
        return service.xiuBeforeQueInStorageDetail(id);
    }

    @RequestMapping(value = "/xiuInStorageDetail.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuInStorageDetail(@RequestParam("idE")String id,@RequestParam("wareId3")String wareId){
        System.out.println(id+"--==========="+wareId);
        InStorageDetail insD=service.xiuBeforeQueInStorageDetail(Integer.parseInt(id));
        if (insD.getReperId()>0){
            return "药品已入库!";
        }
        InStorageDetail insDetail=new InStorageDetail();
        insDetail.setId(Integer.parseInt(id));
        List<Repertory> reps=repService.byWareIdQueAllRep(Integer.parseInt(wareId));
        for (Repertory rep:reps){
            System.out.println(insD+"----------============"+rep);
            if(rep.getDrugId()==insD.getsDrug().getDrugId()) {
                //入库数量+库存 ?= 最大存量
                int sum = insD.getRepQuantity() + rep.getSaveNum();
                if (sum > rep.getAllSave()) {
                    return "库存已满!";
                }
                insDetail.setReperId(rep.getId());

                rep.setSaveNum(rep.getSaveNum()+insD.getRepQuantity());
                repService.xiuRepertory(rep);

                SDrug sDrug=sDrugService.xiuBeforeQueSDrug(insD.getSupId());
                sDrug.setNum(sDrug.getNum()-insD.getRepQuantity());
                sDrugService.xiuSDrug(sDrug);

                int result= service.xiuInStorageDetail(insDetail);
                return result==1?"操作成功":"操作失败";
            }
        }
        return "该仓库不存放此药品!";
    }

    @RequestMapping("/allInStorageDetail.action")
    @ResponseBody
    public PageVo<InStorageDetail> allInStorageDetail(InStorageDetail idl, int page, int rows){
        return service.queAllInStorageDetail(idl, page, rows);
    }

    @RequestMapping("/queryByRepIdINSD.action")
    @ResponseBody
    public String queryByRepIdINSD(int id,int page,int rows){
        return JSONObject.toJSONString(service.queryByRepIdINSD(id, page, rows));
    }

}
