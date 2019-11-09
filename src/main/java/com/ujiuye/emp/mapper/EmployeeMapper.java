package com.ujiuye.emp.mapper;

import com.ujiuye.emp.bean.Employee;
import com.ujiuye.util.MarkInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {

    int deleteByPrimaryKey(Integer eid);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer eid);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);

        List<Employee> showEmpInfo(MarkInfo markInfo);

    Employee login(@Param("name") String name, @Param("pass") String pass);


}