package com.hao.dao;

import com.hao.vo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    //增
    public int addUser(User user);
    //删
    public int delUser(List<Integer> ids);
    //修改前查询
    public User xiuBeforeQueUser(int id);
    //改
    public int xiuUser(User user);
    //查
    public int queAllUserCount(User user);
    public List<User> queAllUser(User user);
}
