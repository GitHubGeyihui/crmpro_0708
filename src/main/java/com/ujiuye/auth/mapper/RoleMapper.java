package com.ujiuye.auth.mapper;


import com.ujiuye.auth.bean.Role;
import com.ujiuye.util.MarkInfo;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> getAllRole(MarkInfo markInfo);

    List<Role> getRole();
}