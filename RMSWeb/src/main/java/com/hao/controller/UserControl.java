package com.hao.controller;

import com.hao.service.UserService;
import com.hao.vo.PageVo;
import com.hao.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserControl {
    @Autowired
    UserService service;

    @RequestMapping(value = "/addUser.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addUser(User user){
        int result=service.addUser(user);
        return result==1?"添加成功":"添加失败";
    }

    @PostMapping("/delUser.action")
    @ResponseBody
    public int delUser(@RequestBody List<Integer> ids){
        return service.delUser(ids);
    }

    @RequestMapping("/xiuBeforeQueUser.action")
    @ResponseBody
    public User xiuBeforeQueUser(int id){
        return service.xiuBeforeQueUser(id);
    }

    @RequestMapping(value = "/xiuUser.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuUser(@RequestParam("id1") String id,
                              @RequestParam("userName1") String userName, @RequestParam("company1") String company,
                              @RequestParam("duty1") String duty, @RequestParam("companySite1") String companySite,
                              @RequestParam("userPhone1")String userPhone, @RequestParam("bankAccount1")String bankAccount,
                              @RequestParam("xinYu1")String xinYu,@RequestParam("destination1")String destination){
        User user=new User();
        user.setId(Integer.parseInt(id));
        user.setUserName(userName);
        user.setCompany(company);
        user.setDuty(duty);
        user.setCompanySite(companySite);
        user.setUserPhone(userPhone);
        user.setBankAccount(bankAccount);
        System.out.println("=============="+xinYu);
        if(xinYu!=null&&xinYu!="") {
            user.setXinYu(Integer.parseInt(xinYu));
        }else {
            user.setXinYu(100);
        }
        user.setDestination(destination);
        int result= service.xiuUser(user);
        return result==1?"修改成功":"修改失败";
    }

    @RequestMapping("/allUser.action")
    @ResponseBody
    public PageVo<User> allUser(User user,
                                   @RequestParam(value = "page",defaultValue = "1") int page,
                                   @RequestParam(value = "rows",defaultValue = "3") int rows){
        return service.queAllUser(user, page, rows);
    }

    @RequestMapping("/queAllUser.action")
    @ResponseBody
    public List<User> queAllUser(User user){
        return service.allUser(user);
    }

}
