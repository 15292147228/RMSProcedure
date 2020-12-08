package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.EmployeeDao;
import com.hao.service.EmployeeService;
import com.hao.vo.Authority;
import com.hao.vo.Employee;
import com.hao.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeDao dao;

    @Override
    public int addEmp(Employee emp) {
        return dao.addEmp(emp);
    }

    @Override
    public int delEmp(List<Integer> ids) {
        return dao.delEmp(ids);
    }

    @Override
    public Employee xiuBeforeQueEmp(int id) {
        return dao.xiuBeforeQueEmp(id);
    }

    @Override
    public int xiuEmp(Employee emp) {
        return dao.xiuEmp(emp);
    }


    public PageVo<Employee> queAllEmp(Employee emp, int page, int rows) {
        PageVo<Employee> pv=new PageVo<Employee>();
        //放在 查询代码的前面 分页插件
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllEmp(emp));
        pv.setTotal(dao.queAllEmpCount(emp));
        return pv;
    }

    @Override
    public int empIsExist(String acc) {
        return dao.empIsExist(acc);
    }

    @Override
    public Employee queryAreEmp(String acc, String pwd) {
        return dao.queryAreEmp(acc, pwd);
    }
}
