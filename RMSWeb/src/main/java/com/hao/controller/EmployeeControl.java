package com.hao.controller;

import com.hao.service.EmployeeService;
import com.hao.vo.Employee;
import com.hao.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class EmployeeControl {
    @Autowired
    EmployeeService service;

    @RequestMapping(value = "/addEmployee.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addEmployee(Employee emp){
        int result=service.addEmp(emp);
        return result==1?"添加成功":"添加失败";
    }

    @PostMapping("/delEmployee.action")
    @ResponseBody
    public int delEmployee(@RequestBody List<Integer> ids){
        return service.delEmp(ids);
    }

    @RequestMapping("/xiuBeforeQueEmp.action")
    @ResponseBody
    public Employee xiuBeforeQueEmp(int id){
        return service.xiuBeforeQueEmp(id);
    }

    @RequestMapping(value = "/xiuEmployee.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String xiuEmployee(@RequestParam("id1") String id,
                              @RequestParam("empName1") String empName,@RequestParam("empSex1") String empSex,
                              @RequestParam("empImage1")/*MultipartFile*/String empImage,@RequestParam("department1") String department,
                              @RequestParam("idCard1")String idCard,@RequestParam("eduback1")String eduback,
                              @RequestParam("empPhone1")String empPhone,@RequestParam("roleId1")String roleId){
        Employee emp=new Employee();
        emp.setId(Integer.parseInt(id));
        emp.setEmpName(empName);
        emp.setEmpSex(empSex);
        emp.setEmpImage(empImage);
        emp.setDepartment(department);
        emp.setIdCard(idCard);
        emp.setEduback(eduback);
        emp.setEmpPhone(empPhone);
        emp.setRoleId(Integer.parseInt(roleId));
        int result= service.xiuEmp(emp);
        return result==1?"修改成功":"修改失败";
    }

    @RequestMapping("/allEmployee.action")
    @ResponseBody
    public PageVo<Employee> allEmp(Employee emp,
             @RequestParam(value = "page",defaultValue = "1") int page,
                                      @RequestParam(value = "rows",defaultValue = "3") int rows){
        return service.queAllEmp(emp, page, rows);
    }

    @RequestMapping(value = "/empLogin.action",produces = "text/json;charset=utf-8")
    @ResponseBody
    public String empLogin(String acc, String pwd, HttpSession session){
        int exist=service.empIsExist(acc);
        if (exist>0) {
            Employee emp = service.queryAreEmp(acc, pwd);
            if (emp != null) {
                session.setAttribute("emp", emp);
                return "1";
            }
        }else{
            return "您输入的账号不存在!";
        }
            return "账号或密码有误!";
    }

}
