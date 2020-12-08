package com.hao.service;

import com.hao.vo.Authority;
import com.hao.vo.PageVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuthorityService {
    //根据id查权限
    public List<Authority> queByIdAuthority(int id,int eId);

    //增
    public int addAuthority(Authority authority);
    //删
    public int delAuthority(List<Integer> ids);
    //改
    public int xiuAuthority(Authority authority);
    public Authority xiuBeforeQue(int id);
    //查
    public PageVo<Authority> queAllAuthority(Authority authority, int page, int rows);

    public List<Authority> queByRidAuth(int rid);

    public List<Authority> allParentAuth(int pid);

}
