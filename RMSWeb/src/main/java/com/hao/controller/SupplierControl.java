package com.hao.controller;

import com.hao.service.SupplierService;
import com.hao.vo.PageVo;
import com.hao.vo.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SupplierControl {
    @Autowired
    SupplierService service;

    @RequestMapping(value = "/addSupplier.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addSupplier(Supplier sup){
        int result=service.addSupplier(sup);
        return result==1?"添加成功":"添加失败";
    }

    @PostMapping("/delSupplier.action")
    @ResponseBody
    public int delSupplier(@RequestBody List<Integer> ids){
        return service.delSupplier(ids);
    }

    @RequestMapping("/xiuBeforeQueSupplier.action")
    @ResponseBody
    public Supplier xiuBeforeQueSupplier(int id){
        return service.xiuBeforeQueSupplier(id);
    }

    @RequestMapping(value = "/xiuSupplier.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuSupplier(@RequestParam("id1") String id, @RequestParam("supName1") String supName,
                              @RequestParam("location1") String location, @RequestParam("suPhone1") String suPhone, @RequestParam("remark1") String remark){
        Supplier sup=new Supplier();
        sup.setId(Integer.parseInt(id));
        sup.setSupName(supName);
        sup.setLocation(location);
        sup.setSuPhone(suPhone);
        sup.setRemark(remark);
        int result= service.xiuSupplier(sup);
        return result==1?"修改成功":"修改失败";
    }

    @RequestMapping("/allSupplier.action")
    @ResponseBody
    public PageVo<Supplier> allSupplier(Supplier sup,
                                   @RequestParam(value = "page",defaultValue = "1") int page,
                                   @RequestParam(value = "rows",defaultValue = "3") int rows){
        return service.queAllSupplier(sup, page, rows);
    }

    @RequestMapping("/queAllSupplier.action")
    @ResponseBody
    public List<Supplier> queAllSupplier(Supplier sup){
        return service.allSupplier(sup);
    }
}
