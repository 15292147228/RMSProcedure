package com.hao.controller;

import com.alibaba.fastjson.JSONObject;
import com.hao.service.InStorageService;
import com.hao.vo.InStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class InStorageControl {
    @Autowired
    InStorageService service;

    @PostMapping("/delInStorage.action")
    @ResponseBody
    public int delInStorage(@RequestBody List<Integer> ids){
        return service.delInStorage(ids);
    }

    @RequestMapping("/xiuBeforeQueInStorage.action")
    @ResponseBody
    public InStorage xiuBeforeQueInStorage(int id){
        return service.xiuBeforeQueInStorage(id);
    }

    @RequestMapping(value = "/xiuInStorage.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuInStorage(@RequestParam("id2") String id,@RequestParam("roleId2")String roleId,@RequestParam("state2")String state){
      //  System.out.println(state+"----------=============="+id);
        InStorage ins=new InStorage();
        ins.setId(Integer.parseInt(id));
        if (roleId!=null&&roleId!=""){
            ins.setRoleId(Integer.parseInt(roleId));
        }
        ins.setState(Integer.parseInt(state));
        if(Integer.parseInt(state)<0){return "请选择状态！";}
        int result=service.xiuInStorage(ins);
        return result==1?"操作成功":"操作失败";
    }

    @RequestMapping("/allInStorage.action")
    @ResponseBody
    public String allInStorage(InStorage ins,
                              @RequestParam(value = "page",defaultValue = "1") int page,
                              @RequestParam(value = "rows",defaultValue = "3") int rows){
        return JSONObject.toJSONString(service.queAllInStorage(ins, page, rows));
    }

    @RequestMapping("/queAllInStorage.action")
    @ResponseBody
    public List<InStorage> queAllInStorage(InStorage ins){
        return service.allInStorage(ins);
    }

    @RequestMapping("/queStorageS.action")
    @ResponseBody
    public String queStorageS(int num,
                              @RequestParam(value = "page",defaultValue = "1") int page,
                              @RequestParam(value = "rows",defaultValue = "3") int rows){
        return JSONObject.toJSONString(service.queryByTimeOfIns(num, page, rows));
    }

    @RequestMapping("/queMoneyS.action")
    @ResponseBody
    public Float queMoneyS(int num){
        Float sum=service.querySumOfMoney(num);
        return sum==null?0:sum;
    }
}
