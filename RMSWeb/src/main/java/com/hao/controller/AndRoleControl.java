package com.hao.controller;

import com.hao.service.AndRoleService;
import com.hao.vo.AndRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class AndRoleControl {
    @Autowired
    AndRoleService service;

    @RequestMapping("/queAllAndRole.action")
    @ResponseBody
    public List<AndRole> queAllAndRole(){
        return service.queAllAndRole();
    }

    @RequestMapping(value = "/addAndRole.action",produces = "text/json;charset=utf-8")
    @ResponseBody
    public String addAndRole(@RequestParam(value = "rid",defaultValue = "0") int rid,
                             @RequestParam("auths")String auths){
        String[] arry=auths.split(",");
        List<String> ids=new ArrayList<>(arry.length);
        Collections.addAll(ids,arry);
        int result=service.delAndRole(rid);
        System.out.println("成功删除"+result+"条数据");
        int s=0;
        for (int i = 0; i < ids.size(); i++) {
            int y=service.addAndRole(Integer.parseInt(ids.get(i)),rid);
            s+=y;
        }
        String str="";
        if (s==0){
            str="授权失败！";
        }else {
            str="授权成功！";
        }
        return str;
    }
}
