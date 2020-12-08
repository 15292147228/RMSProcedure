package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.RepertoryService;
import com.hao.vo.PageVo;
import com.hao.vo.Repertory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
public class RepertoryControl {
    @Autowired
    RepertoryService service;

    @RequestMapping(value = "/addRepertory.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addRepertory(Repertory rep){
        int result=service.addRepertory(rep);
        return result==1?"添加成功":"添加失败";
    }

    @PostMapping("/delRepertory.action")
    @ResponseBody
    public int delRepertory(@RequestBody List<Integer> ids){
        return service.delRepertory(ids);
    }

    @RequestMapping("/xiuBeforeQueRepertory.action")
    @ResponseBody
    public String xiuBeforeQueRepertory(int id){
        return JSONObject.toJSONString(service.xiuBeforeQueRepertory(id));
    }

    @RequestMapping(value = "/xiuRepertory.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuRepertory(@RequestParam("id1") String id, @RequestParam("drugId1") String drugId,@RequestParam("saveNum1") String saveNum,
                               @RequestParam("wareId1")String wareId, @RequestParam("drugCode1")String drugCode,
                               @RequestParam("allSave1")String allSave){
        Repertory rep=new Repertory();
        rep.setId(Integer.parseInt(id));
        rep.setDrugId(Integer.parseInt(drugId));
        rep.setSaveNum(Integer.parseInt(saveNum));
        rep.setWareId(Integer.parseInt(wareId));
        rep.setDrugCode(drugCode);
        rep.setAllSave(Integer.parseInt(allSave));
        int result= service.xiuRepertory(rep);
        return result==1?"修改成功":"修改失败";
    }

    @RequestMapping("/allRepertory.action")
    @ResponseBody
    public String allRepertory(Repertory rep,
                                   @RequestParam(value = "page",defaultValue = "1") int page,
                                   @RequestParam(value = "rows",defaultValue = "3") int rows){
       return JSONObject.toJSONString(service.queAllRepertory(rep, page, rows));
    }
}
