package com.hao.dao;

import com.hao.vo.Employee;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface EmployeeDao {
        //增
    public int addEmp(Employee emp);
        //删
    public int delEmp(List<Integer> ids);
       //修改前查询
    public Employee xiuBeforeQueEmp(int id);
        //改
    public int xiuEmp(Employee emp);
        //查
        public int queAllEmpCount(Employee emp);
    public List<Employee> queAllEmp(Employee emp);

    public int empIsExist(@Param("acc")String acc);
    public Employee queryAreEmp(@Param("acc")String acc,@Param("pwd")String pwd);
}
