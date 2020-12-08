package com.hao.controller;

import com.hao.service.DrugService;
import com.hao.vo.Drug;
import com.hao.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
public class DrugControl {
    @Autowired
    DrugService service;

    @RequestMapping(value = "/addDrug.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addDrug(Drug drug){
        int result=service.addDrug(drug);
        return result==1?"添加成功":"添加失败";
    }

    @PostMapping("/delDrug.action")
    @ResponseBody
    public int delDrug(@RequestBody List<Integer> ids){
        return service.delDrug(ids);
    }

    @RequestMapping("/xiuBeforeQueDrug.action")
    @ResponseBody
    public Drug xiuBeforeQueDrug(int id){
        return service.xiuBeforeQueDrug(id);
    }

    @RequestMapping(value = "/xiuDrug.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuDrug(@RequestParam("id1") String id, @RequestParam("drugNames1") String drugNames,
                          @RequestParam("purcost1") String purcost,@RequestParam("sellPrince1") String sellPrince,
                          @RequestParam("ingredient1") String ingredient,@RequestParam("specification1") String specification,
                          @RequestParam("place1") String place,@RequestParam("batchNum1") String batchNum,
                          @RequestParam("remark1") String remark,@RequestParam("producedDate1") Date producedDate,
                          @RequestParam("expirationDate1") Date expirationDate,
                          @RequestParam("packageInsert1") String packageInsert){
        Drug drug=new Drug();
        drug.setId(Integer.parseInt(id));
        drug.setDrugNames(drugNames);
        drug.setPurcost(Float.parseFloat(purcost));
        drug.setSellPrince(Float.parseFloat(sellPrince));
        drug.setIngredient(ingredient);
        drug.setSpecification(specification);
        drug.setPlace(place);
        drug.setBatchNum(batchNum);
        drug.setRemark(remark);
        drug.setProducedDate(producedDate);
        drug.setExpirationDate(expirationDate);
        drug.setPackageInsert(packageInsert);
        int result=service.xiuDrug(drug);
        return result==1?"修改成功":"修改失败";
    }

    @RequestMapping("/allDrug.action")
    @ResponseBody
    public PageVo<Drug> allDrug(Drug drug,
                                   @RequestParam(value = "page",defaultValue = "1") int page,
                                   @RequestParam(value = "rows",defaultValue = "3") int rows){
        return service.queAllDrug(drug, page, rows);
    }

    @RequestMapping("/queAllDrug.action")
    @ResponseBody
    public List<Drug> queAllDrug(Drug drug){
        return service.allDrug(drug);
    }
}
