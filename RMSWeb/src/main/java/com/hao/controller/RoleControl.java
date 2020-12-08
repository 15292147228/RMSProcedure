package com.hao.controller;

import com.hao.service.RoleService;
import com.hao.vo.PageVo;
import com.hao.vo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class RoleControl {
    @Autowired
    RoleService service;

    @RequestMapping("/queAllRole.action")
    @ResponseBody
    public List<Role> queAllRole(){
        return service.queAllRole();
    }


    @RequestMapping(value = "/addRole.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addRole(Role role){
        int result=service.addRole(role);
        return result==1?"添加成功":"添加失败";
    }

    @RequestMapping("/delRole.action")
    @ResponseBody
    public int delRole(@RequestParam("id")int id){
        return service.delRole(id);
    }

    @RequestMapping("/xiuBeforeQueRole.action")
    @ResponseBody
    public Role xiuBeforeQueRole(@RequestParam("id")int id){
        return service.xiuBeforeRole(id);
    }

    @RequestMapping(value = "/xiuRole.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuRole(@RequestParam("id1")String id,@RequestParam("rname1")String rname,@RequestParam("remark1")String remark){
        Role role = new Role();
        role.setId(Integer.parseInt(id));
        role.setRname(rname);
        role.setRemark(remark);
        int result= service.xiuRole(role);
        return result==1?"修改成功":"修改失败";
    }

    @RequestMapping("/queryVoRole.action")
    @ResponseBody
    public PageVo<Role> queryVoRole(Role role,
                                   @RequestParam(value = "page",defaultValue = "1") int page,
                                   @RequestParam(value = "rows",defaultValue = "3") int rows){
        return service.queByVoAll(role,page,rows);
    }
}
