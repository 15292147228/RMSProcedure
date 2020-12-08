package com.hao.controller;

import com.hao.service.AuthorityService;
import com.hao.vo.Authority;
import com.hao.vo.Employee;
import com.hao.vo.PageVo;
import com.hao.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Controller
public class AuthorityControl {
    @Autowired
    AuthorityService service;

    @RequestMapping("/queByIdAuthority.action")
    @ResponseBody
    public List<Authority> queryMenuByPidAndUid(@RequestParam(value = "id",defaultValue = "0") int id,
            HttpSession session) {
        //从session获取用户对象
        Employee employee = (Employee) session.getAttribute("emp");
       // System.out.println("-====================-"+service.queByIdAuthority(id,employee.getId()));
            return service.queByIdAuthority(id,employee.getId());
    }

    @RequestMapping("/allParentAuth.action")
    @ResponseBody
    public List<Authority> allParentAuth(){
        return service.allParentAuth(0);
    }

    @RequestMapping("/allAuthority.action")
    @ResponseBody
    public PageVo<Authority> allMenuT(Authority menu, @RequestParam(value = "page",defaultValue = "1") int page,
                                      @RequestParam(value = "rows",defaultValue = "3") int rows){
        if (menu.getUrl()==""){
            menu.setUrl(null);
        }
        if (menu.getIconCls()==""){
            menu.setIconCls(null);
        }
        return service.queAllAuthority(menu, page, rows);
    }

    @RequestMapping("/addMenu.action")
    @ResponseBody
    public Map addMenu(@RequestParam("text2") String text,
                       @RequestParam("url2") String url,
                       @RequestParam("iconCls2") /*MultipartFile*/String iconCls,
                       @RequestParam("state2") String state,
                       @RequestParam("parentid2") int parentid) throws IOException {
        Map<String,String> map=new HashMap<String, String>();
        Authority menu=new Authority();
        menu.setText(text);
        menu.setUrl(url);
        menu.setState(state);
        menu.setParentid(parentid);
        menu.setIconCls(iconCls);
      /* if (iconCls!=null){
           //获取上传的文件名
           String fileName=iconCls.getOriginalFilename();
           menu.setIconCls("img/"+fileName);
           //将文件持久化 保存到 服务端 本地磁盘（项目发布的路径）
           String path="D:/Overload/MybatisTest/src/main/webapp/img";
           //String path=request.getServletContext().getRealPath("/img");
           File file=new File(path);
           if (!file.exists()){
               file.mkdirs();//创建多层目录
           }
           //将文件持久化 保存到 服务端
           iconCls.transferTo(new File(path,fileName));
       }*/
        System.out.println("查看添加："+ menu);
        int result=service.addAuthority(menu);
        if(result==1){
            map.put("mess","添加成功！");
            map.put("code","1");
        }else {
            map.put("mess","添加失败！");
            map.put("code","0");
        }
        return map;
    }

    @PostMapping("/delMenu.action")
    @ResponseBody
    public int delMenu(@RequestBody List<Integer> ids){
        return service.delAuthority(ids);
    }

    @RequestMapping(value = "/xiuBeforeMenu.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Authority xiuBefore(int id){
        //System.out.println("-===================-"+service.xiuBeforeQue(id));
        return service.xiuBeforeQue(id);
    }

    @RequestMapping(value = "/xiuMenu.action", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Map xiuMenu(@RequestParam("menuId")String id,
                       @RequestParam("text1")String text,
                       @RequestParam("url1")String url,
                       @RequestParam("iconCls1")String iconCls,
                       @RequestParam("state1")String state,
                       @RequestParam("parentid1")String parentid) throws IOException {
        Map<String,String> map=new HashMap<String, String>();
        Authority menu=new Authority();
        menu.setId(Integer.parseInt(id));
        menu.setText(text);
        menu.setUrl(url);
        menu.setState(state);
        menu.setParentid(Integer.parseInt(parentid));
        menu.setIconCls(iconCls);
        /*if (iconCls!=null){
            //获取上传的文件名
            String fileName=iconCls.getOriginalFilename();
            menu.setIconCls("img/"+fileName);
            //将文件持久化 保存到 服务端 本地磁盘（项目发布的路径）
            String path="D:/Overload/MybatisTest/src/main/webapp/img";
            //String path=request.getServletContext().getRealPath("/img");
            File file=new File(path);
            if (!file.exists()){
                file.mkdirs();//创建多层目录
            }
            //将文件持久化 保存到 服务端
            iconCls.transferTo(new File(path,fileName));
        }*/
        int result=service.xiuAuthority(menu);
        if(result==1){
            map.put("mess","修改成功！");
            map.put("code","1");
        }else {
            map.put("mess","修改失败！");
            map.put("code","0");
        }
        return map;
    }

    @RequestMapping("/queByIdMenu.action")
    @ResponseBody
    public List<Authority> queAllAuthority(@RequestParam(value = "rid",defaultValue = "0") int rid){
        return service.queByRidAuth(rid);
    }
}
