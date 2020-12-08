package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.SDrugService;
import com.hao.vo.PageVo;
import com.hao.vo.SDrug;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SDrugControl {
    @Autowired
    SDrugService service;

    @RequestMapping(value = "/addSDrug.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addSDrug(SDrug sDrug){
        int result=service.addSDrug(sDrug);
        return result==1?"添加成功":"添加失败";
    }

    @PostMapping("/delSDrug.action")
    @ResponseBody
    public int delSDrug(@RequestBody List<Integer> ids){
        return service.delSDrug(ids);
    }

    @RequestMapping("/xiuBeforeQueSDrug.action")
    @ResponseBody
    public SDrug xiuBeforeQueSDrug(int id){
        return service.xiuBeforeQueSDrug(id);
    }

    @RequestMapping(value = "/xiuSDrug.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuSDrug(@RequestParam("id1") String id, @RequestParam("supId1") String supId,
                              @RequestParam("drugId1") String drugId, @RequestParam("num1") String num,
                              @RequestParam("combPrice1")float combPrice){
        SDrug sDrug=new SDrug();
        sDrug.setId(Integer.parseInt(id));
        sDrug.setSupId(Integer.parseInt(supId));
        sDrug.setDrugId(Integer.parseInt(drugId));
        sDrug.setNum(Integer.parseInt(num));
        sDrug.setCombPrice(combPrice);
        System.out.println("药品is："+sDrug);
        int result= service.xiuSDrug(sDrug);
        return result==1?"修改成功":"修改失败";
    }

    @RequestMapping("/allSDrug.action")
    @ResponseBody
    public String allSDrug(SDrug sDrug,
                                   @RequestParam(value = "page",defaultValue = "1") int page,
                                   @RequestParam(value = "rows",defaultValue = "3") int rows){
        return JSONObject.toJSONString(service.queAllSDrug(sDrug, page, rows));
    }
}
