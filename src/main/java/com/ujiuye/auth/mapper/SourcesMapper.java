package com.ujiuye.auth.mapper;


import com.ujiuye.auth.bean.Sources;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SourcesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Sources record);

    int insertSelective(Sources record);

    Sources selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Sources record);

    int updateByPrimaryKey(Sources record);

    //獲取我們的根資源
    Sources getRootSources();

    //根据我們的資源的id獲取當前資源的下一級資源
    List<Sources> getNextSources(Integer pid);

    List<Sources> getSourceByRoleid(Integer roleid);

    List<Sources> getChildren( @Param("roleid") Integer roleid, @Param("pid") Integer pid);
}