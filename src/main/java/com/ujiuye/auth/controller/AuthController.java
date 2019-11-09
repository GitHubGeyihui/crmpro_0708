package com.ujiuye.auth.controller;

import com.ujiuye.auth.bean.Role;
import com.ujiuye.auth.bean.Sources;
import com.ujiuye.auth.service.AuthService;
import com.ujiuye.util.MarkInfo;
import com.ujiuye.util.ResultInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;

@Controller
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private AuthService authService;
    @Autowired
    private JedisPool jedisPool;
    //展示整棵树
    @RequestMapping("showAllSources")
    @ResponseBody
    public Sources showAllSources() {
        return authService.showAllSources();
    }


    @RequestMapping("addSources")
    public String addSources(Sources sources) {
        boolean flag = authService.addSources(sources);
        return "pm";
    }

    //根据id节点删除数据
    @RequestMapping("deleteSources")
    @ResponseBody
    public ResultInfo deleteSources(Integer id) {
        boolean flag = authService.deleteSources(id);
        ResultInfo ri = new ResultInfo();
        if (flag) {
            ri.setFlag(true);
        }
        return ri;
    }

    //根据id获取一个指定的资源对象
    @RequestMapping("getOneSourceById")
    @ResponseBody
    public Sources getOneSourceById(Integer id) {
        return authService.getOneSourceById(id);
    }

    //异步显示我们role角色信息
    @RequestMapping("getAllRole")
    @ResponseBody
    public List<Role> getAllRole(MarkInfo markInfo) {
        return authService.getAllRole(markInfo);
    }

    //删除角色
    @RequestMapping("deleteRole")
    public String deleteRole(Integer roleid) {
        boolean flag = authService.deleteRole(roleid);
        //关联redis操作
        Jedis resource = jedisPool.getResource();
        //移出我们当前删除的角色
        resource.del(roleid+"");
        return "role";
    }

    //添加角色
    @RequestMapping("addRole")
    public String addRole(Role role, String sourcesid) {
        boolean flag = authService.addRole(role, sourcesid);
        return "role";
    }


    @RequestMapping("getOneRole")
    @ResponseBody
    public Role getOneRole(Integer roleid) {
        return authService.getOneRole(roleid);
    }

    @RequestMapping("getInfoByRoleId")
    @ResponseBody
    public Sources getInfoByRoleId(Integer roleid) {
       return authService.getInfoByRoleId(roleid);
    }
}
