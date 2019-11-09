package com.ujiuye.auth.mapper;


import com.ujiuye.auth.bean.EmpRole;
import com.ujiuye.emp.bean.Employee;
import org.apache.ibatis.annotations.Param;

public interface EmpRoleMapper {
    int deleteByPrimaryKey(Integer erid);

    int insert(EmpRole record);

    int insertSelective(EmpRole record);

    EmpRole selectByPrimaryKey(Integer erid);

    int updateByPrimaryKeySelective(EmpRole record);

    int updateByPrimaryKey(EmpRole record);

    int deleteByRoleId(@Param("roleid") Integer roleid);

    EmpRole  getEmpRole(Integer eid);


}