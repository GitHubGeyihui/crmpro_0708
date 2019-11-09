package com.ujiuye.emp.service;

import com.ujiuye.auth.bean.EmpRole;
import com.ujiuye.auth.bean.Role;
import com.ujiuye.auth.bean.Sources;
import com.ujiuye.emp.bean.Dept;
import com.ujiuye.emp.bean.Employee;
import com.ujiuye.emp.bean.Level;
import com.ujiuye.emp.bean.Position;
import com.ujiuye.util.MarkInfo;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


public interface EmployeeService {
    List<Employee> showEmpInfo(MarkInfo markInfo);

    Employee showEmpByeid(int i);

    List<Position> getPosition();

    List<Level> getLevel();

    List<Role> getAllRole();


    List<Dept> getDept();

    boolean addEmp(Employee employee, EmpRole empRole);

    Employee login(String name, String pass);

    EmpRole getEmpRole(Integer eid);

    Map<String, List<Sources>> getRoleAndSources();

    boolean modifyPass(Employee employee);



}
