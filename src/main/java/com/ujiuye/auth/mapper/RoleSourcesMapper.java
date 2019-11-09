package com.ujiuye.auth.mapper;

import com.ujiuye.auth.bean.RoleSources;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface RoleSourcesMapper {
    int deleteByPrimaryKey(Integer rsid);

    int insert(RoleSources record);

    int insertSelective(RoleSources record);

    RoleSources selectByPrimaryKey(Integer rsid);

    int updateByPrimaryKeySelective(RoleSources record);

    int updateByPrimaryKey(RoleSources record);

    int  deleteByRoleId(@Param("roleid") Integer roleid);

    int batchAddInfo(List<RoleSources> list);

    int batchDeleteInfo(Integer roleid);
}