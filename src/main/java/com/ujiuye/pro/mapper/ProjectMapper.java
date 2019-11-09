package com.ujiuye.pro.mapper;

import com.ujiuye.pro.bean.Project;
import com.ujiuye.util.MarkInfo;

import java.util.List;

public interface ProjectMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKey(Project record);

    //获取项目信息的同时获取我们的关联对象
    List<Project> getProAndOtherInfo(MarkInfo markInfo);


}