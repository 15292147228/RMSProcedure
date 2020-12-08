package com.hao.service;

import com.hao.vo.PageVo;
import com.hao.vo.User;

import java.util.List;

public interface UserService {
    //增
    public int addUser(User user);
    //删
    public int delUser(List<Integer> ids);
    //修改前查询
    public User xiuBeforeQueUser(int id);
    //改
    public int xiuUser(User user);
    //查
    public PageVo<User> queAllUser(User user,int page, int rows);
    public List<User> allUser(User user);
}
