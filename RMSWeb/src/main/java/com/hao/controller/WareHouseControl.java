package com.hao.controller;

import com.hao.service.WareHouseService;
import com.hao.vo.PageVo;
import com.hao.vo.WareHouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class WareHouseControl {
    @Autowired
    WareHouseService service;

    @RequestMapping(value = "/addWareHouse.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addWareHouse(WareHouse wareHouse){
        int result=service.addWareHouse(wareHouse);
        return result==1?"添加成功":"添加失败";
    }

    @PostMapping("/delWareHouse.action")
    @ResponseBody
    public int delWareHouse(@RequestBody List<Integer> ids){
        return service.delWareHouse(ids);
    }

    @RequestMapping("/xiuBeforeQueWareHouse.action")
    @ResponseBody
    public WareHouse xiuBeforeQueWareHouse(int id){
        return service.xiuBeforeQueWareHouse(id);
    }

    @RequestMapping(value = "/xiuWareHouse.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuWareHouse(@RequestParam("id1") String id,@RequestParam("wareName1") String wareName, @RequestParam("wareAddress1") String wareAddress,@RequestParam("saveState1") String saveState){
        WareHouse wh=new WareHouse();
        wh.setId(Integer.parseInt(id));
        wh.setWareName(wareName);
        wh.setWareAddress(wareAddress);
        wh.setSaveState(Integer.parseInt(saveState));
        int result= service.xiuWareHouse(wh);
        return result==1?"修改成功":"修改失败";
    }

    @RequestMapping("/allWareHouse.action")
    @ResponseBody
    public PageVo<WareHouse> allWareHouse(WareHouse wareHouse,
                                   @RequestParam(value = "page",defaultValue = "1") int page,
                                   @RequestParam(value = "rows",defaultValue = "3") int rows){
        return service.queAllWareHouse(wareHouse, page, rows);
    }

    @RequestMapping("/queAllWareHouse.action")
    @ResponseBody
    public List<WareHouse> queAllWareHouse(WareHouse wareHouse){
        return service.allWareHouse(wareHouse);
    }
}
