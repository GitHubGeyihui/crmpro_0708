package com.ujiuye.emp.service;

import com.ujiuye.auth.bean.EmpRole;
import com.ujiuye.auth.bean.Role;
import com.ujiuye.auth.bean.Sources;

import com.ujiuye.auth.mapper.EmpRoleMapper;
import com.ujiuye.auth.mapper.RoleMapper;
import com.ujiuye.auth.mapper.SourcesMapper;
import com.ujiuye.auth.service.AuthService;
import com.ujiuye.emp.bean.Dept;
import com.ujiuye.emp.bean.Employee;
import com.ujiuye.emp.bean.Level;
import com.ujiuye.emp.bean.Position;
import com.ujiuye.emp.mapper.*;
import com.ujiuye.util.MarkInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;
    @Resource
    private PositionMapper positionMapper;
    @Resource
    private ArchivesMapper archivesMapper;
    @Resource
    private LevelMapper levelMapper;
    @Resource
    private DeptMapper deptMapper;
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private EmpRoleMapper empRoleMapper;
    @Resource
    private SourcesMapper sourcesMapper;
    @Resource
    private AuthService authService;

    @Override
    public List<Employee> showEmpInfo(MarkInfo markInfo) {
        return employeeMapper.showEmpInfo(markInfo);
    }

    @Override
    public Employee showEmpByeid(int i) {
        Employee employee = employeeMapper.selectByPrimaryKey(i);

        return employee;
    }

    @Override
    public List<Position> getPosition() {
        return positionMapper.getPosition();
    }

    @Override
    public List<Level> getLevel() {
        return levelMapper.getLevel();
    }


    @Override
    public List<Role> getAllRole() {
        MarkInfo markInfo = new MarkInfo();
        markInfo.setMark(1);
        return roleMapper.getAllRole(markInfo);
    }

    @Override
    public List<Dept> getDept() {
        return deptMapper.getDept();
    }

    @Override
    @Transactional
    public boolean addEmp(Employee employee, EmpRole empRole) {
        //添加一个员工
        boolean flag = employeeMapper.insert(employee) > 0;
        //使用员工的主键完成员工与角色中间表的数据维护
        empRole.setEmpFk(employee.getEid());
        empRole.setErdis(employee.getEname() + "的角色是" + empRole.getRoleFk());
        //插入中间表数据
        boolean flag1 = empRoleMapper.insert(empRole) > 0;
        return true;
    }

    @Override
    public Employee login(String name, String pass) {
        return employeeMapper.login(name, pass);
    }

    @Override
    public EmpRole getEmpRole(Integer eid) {
        return empRoleMapper.getEmpRole(eid);
    }

    @Override
    public Map<String, List<Sources>> getRoleAndSources() {
        MarkInfo markInfo = new MarkInfo();
        markInfo.setMark(1);
        //获取所有的role角色对象（主键）
        List<Role> allRole = roleMapper.getAllRole(markInfo);
        Map<String, List<Sources>> map = new HashMap<String, List<Sources>>();
        //寻找每一个角色对应的资源（层级关系）的集合
        for (Role role : allRole) {
            Sources sources = authService.getInfoByRoleId(role.getRoleid());
            map.put(role.getRoleid() + "", sources.getChildren());

        }
        return map;
    }

    @Override
    public boolean modifyPass(Employee employee) {
        return employeeMapper.updateByPrimaryKeySelective(employee) > 0;
    }


}

