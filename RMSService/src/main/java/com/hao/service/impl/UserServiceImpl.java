package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.UserDao;
import com.hao.service.UserService;
import com.hao.vo.PageVo;
import com.hao.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao dao;
    @Override
    public int addUser(User user) {
        return dao.addUser(user);
    }

    @Override
    public int delUser(List<Integer> ids) {
        return dao.delUser(ids);
    }

    @Override
    public User xiuBeforeQueUser(int id) {
        return dao.xiuBeforeQueUser(id);
    }

    @Override
    public int xiuUser(User user) {
        return dao.xiuUser(user);
    }

    @Override
    public PageVo<User> queAllUser(User user,int page, int rows) {
       PageVo<User> pv=new PageVo<User>();
        //放在 查询代码的前面 分页插件
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllUser(user));
        pv.setTotal(dao.queAllUserCount(user));
       return pv;
    }

    @Override
    public List<User> allUser(User user) {
        return dao.queAllUser(user);
    }
}
