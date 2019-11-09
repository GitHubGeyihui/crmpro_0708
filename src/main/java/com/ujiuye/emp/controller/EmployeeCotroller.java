package com.ujiuye.emp.controller;

import com.alibaba.fastjson.JSON;
import com.sun.webkit.dom.EntityImpl;
import com.ujiuye.auth.bean.EmpRole;
import com.ujiuye.auth.bean.Role;
import com.ujiuye.auth.bean.Sources;
import com.ujiuye.emp.bean.Dept;
import com.ujiuye.emp.bean.Employee;
import com.ujiuye.emp.bean.Level;
import com.ujiuye.emp.bean.Position;
import com.ujiuye.emp.service.EmployeeService;
import com.ujiuye.util.EntityUtils;
import com.ujiuye.util.MarkInfo;
import com.ujiuye.util.ResultInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.HttpSession;
import java.net.Socket;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp")
public class EmployeeCotroller {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private JedisPool jedisPool;

    @RequestMapping("showEmpInfo")
    @ResponseBody
    public List<Employee> showEmpInfo(MarkInfo markInfo) {
        return employeeService.showEmpInfo(markInfo);
    }

    @RequestMapping("showEmpByEid")
    @ResponseBody
    public Employee showEmpByEid(MarkInfo markInfo) {
        //主键是登录状态下保存下来的
        return employeeService.showEmpByeid(2);
    }

    //展示部门  职位  级别  角色信息
    @RequestMapping("getPosition")
    @ResponseBody
    public List<Position> getPosition() {
        return employeeService.getPosition();
    }

    //展示部门  职位  级别  角色信息
    @RequestMapping("getLevel")
    @ResponseBody
    public List<Level> getLevel() {
        return employeeService.getLevel();
    }

    //展示部门  职位  级别  角色信息
    @RequestMapping("getDept")
    @ResponseBody
    public List<Dept> getDept() {
        return employeeService.getDept();
    }

    //展示部门  职位  级别  角色信息
    @RequestMapping("getAllRole")
    @ResponseBody
    public List<Role> getAllRole() {
        return employeeService.getAllRole();
    }

    @RequestMapping("addEmp")
    public String addEmp(Employee employee, EmpRole empRole) {
        boolean flag = employeeService.addEmp(employee, empRole);
        return "user";
    }

    //登录方法
    @RequestMapping("login")
    public String login(String name, String pass,HttpSession session) {
        Jedis jedis = jedisPool.getResource();
        //根据username和password登录
        Employee employee = employeeService.login(name, pass);

        if (employee != null) {
            EmpRole empRole = employeeService.getEmpRole(employee.getEid());
            String s = jedis.get(empRole.getRoleFk() + "");
            List<Sources> sources = null;
            System.out.println(s+"===++++++++++++++++++++++");
            if (s != null && s.length() > 0) {
                System.out.println(s+"====");
                sources = JSON.parseArray(s, Sources.class);
                session.setAttribute("activeUser",employee);
            } else {
                Map<String, List<Sources>> map = employeeService.getRoleAndSources();
                for (Map.Entry<String, List<Sources>> entry : map.entrySet()) {
                     jedis.set(entry.getKey(), JSON.toJSONString(entry.getValue()));
                    if ((empRole.getRoleFk() + "").equals(entry.getKey())) {
                        sources = entry.getValue();
                    }
                }
            }
            for (Sources sources1:sources){
                System.out.println(sources1.getRemark()+"----");
                for(Sources ss:sources1.getChildren()){
                    System.out.println(ss.getRemark()+"****"+ss.getUrl());
                }
            }
            session.setAttribute("menu",sources);
            //当前登录用户放入redis
            Map<String, String> stringMap = EntityUtils.entityToMap(employee);
            jedis.hmset("empInfo", stringMap);
            return "redirect:/index.jsp";
        } else {
            return "redirect:/login.jsp";
        }

    }

    //修改密碼
    @RequestMapping("checkPass")
    @ResponseBody
    public ResultInfo checkPass(String password) {
        ResultInfo resultInfo = new ResultInfo();
        Jedis jedis = jedisPool.getResource();
        String oldPass = jedis.hget("empInfo", "password");
        if (oldPass.equals(password)) {
            resultInfo.setFlag(true);
        }
        return resultInfo;
    }

    //提交表单修改密码
    @RequestMapping("modifyPass")
    @ResponseBody
    public ResultInfo modifyPass(Employee employee) {
        ResultInfo resultInfo = new ResultInfo();
        Jedis jedis = jedisPool.getResource();
        employee.setEid(Integer.parseInt(jedis.hget("empInfo", "eid")));
        boolean flag = employeeService.modifyPass(employee);
        if (flag) {
            jedis.del("empInfo");
            resultInfo.setFlag(true);
        }
        return resultInfo;
    }

    @RequestMapping("logout")
    //注销退出方法
    public String logout() {
        Jedis jedis = jedisPool.getResource();
        jedis.del("empInfo");
        return "redirect:/login.jsp";
    }

    

}
