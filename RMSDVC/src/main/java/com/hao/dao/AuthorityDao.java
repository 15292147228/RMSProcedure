package com.hao.dao;

import com.hao.vo.Authority;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuthorityDao {
    //根据id查权限
    public List<Authority> queByIdAuthority(int id);

    //增
    public int addAuthority(Authority menu);
    //删
    public int delAuthority(List<Integer> ids);
    //改
    public int xiuAuthority(Authority menu);
    public Authority xiuBeforeQue(int id);
    //查
    public List<Authority> queAllAuthority(@Param("menu") Authority menu);
    public int queCountAll(@Param("menu") Authority menu);

    public List<Authority> queByRidAuth(int rid);
    public List<Authority> queryRidAuthor(int id);

    public List<Authority> queAER(@Param("id") int id,@Param("eId") int eId);
}
