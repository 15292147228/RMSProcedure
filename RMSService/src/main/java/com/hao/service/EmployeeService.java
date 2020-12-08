package com.hao.service;

import com.hao.vo.Employee;
import com.hao.vo.PageVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface EmployeeService {
    //增
    public int addEmp(Employee emp);
    //删
    public int delEmp(List<Integer> ids);
    //修改前查询
    public Employee xiuBeforeQueEmp(int id);
    //改
    public int xiuEmp(Employee emp);
    //查
    public PageVo<Employee> queAllEmp(Employee empint, int page, int rows);
    public int empIsExist(String acc);
    public Employee queryAreEmp(String acc,String pwd);
}
