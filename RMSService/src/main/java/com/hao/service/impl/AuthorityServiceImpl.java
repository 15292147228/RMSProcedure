package com.hao.service.impl;

import com.github.pagehelper.PageHelper;
import com.hao.dao.AuthorityDao;
import com.hao.service.AuthorityService;
import com.hao.vo.Authority;
import com.hao.vo.PageVo;
import com.mysql.cj.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AuthorityServiceImpl implements AuthorityService {
    @Autowired
    AuthorityDao dao;

    @Override
    public List<Authority> queByIdAuthority(int id, int eId) {
        List<Authority> menus = dao.queAER(id, eId);

        //绑定URL图片地址
        for (Authority authority : menus) {
            if (!StringUtils.isNullOrEmpty(authority.getUrl())) {
                authority.getAttributes().put("url", authority.getUrl());
            }
        }
        return menus;
    }

    @Override
    public int addAuthority(Authority authority) {
        return dao.addAuthority(authority);
    }

    @Override
    public int delAuthority(List<Integer> ids) {
        return dao.delAuthority(ids);
    }

    @Override
    public int xiuAuthority(Authority authority) {
        return dao.xiuAuthority(authority);
    }

    @Override
    public Authority xiuBeforeQue(int id) {
        return dao.xiuBeforeQue(id);
    }

    @Override
    public PageVo<Authority> queAllAuthority(Authority authority, int page, int rows) {
        PageVo<Authority> pv=new PageVo<Authority>();
        //放在 查询代码的前面 分页插件
        PageHelper.startPage(page,rows);
        pv.setRows(dao.queAllAuthority(authority));
        pv.setTotal(dao.queCountAll(authority));
        return pv;
    }

    //查询所有菜单信息   (父子关系组合好)
    //可能要根据角色id 设置子菜单的选中状态
    @Override
    public List<Authority> queByRidAuth(int rid) {
        //根据角色id，查询拥有权限的菜单集合
        List<Authority> list=dao.queByRidAuth(rid);
        // 获取所有的父菜单
        List<Authority> Plist=dao.queryRidAuthor(0);
        //获取每个父菜单的子菜单集合
        for (Authority auth:Plist) {
            List<Authority> AList=dao.queryRidAuthor(auth.getId());
            //绑定URL图片地址
            for (Authority authority:AList){
                if (!StringUtils.isNullOrEmpty(authority.getUrl())){
                    authority.getAttributes().put("url",authority.getUrl());
                }
                //绑定勾选
                for (Authority author:list){
                    if (author.getId()==authority.getId()){
                        authority.setChecked(true);  //状态设置为true
                    }
                }
            }
                auth.setChildren(AList);
        }
        return Plist;
    }

    @Override
    public List<Authority> allParentAuth(int pid) {
        return dao.queryRidAuthor(pid);
    }

}
