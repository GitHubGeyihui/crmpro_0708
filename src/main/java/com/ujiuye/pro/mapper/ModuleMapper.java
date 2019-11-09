package com.ujiuye.pro.mapper;


import com.ujiuye.pro.bean.Module;
import com.ujiuye.util.MarkInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ModuleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Module record);

    int insertSelective(Module record);

    Module selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Module record);

    int updateByPrimaryKey(Module record);

    List<Module> showAllModule();

    Module checkModel(@Param("mname") String modelname, @Param("pid")Integer pid);

    List<Module>getInfoByAk(MarkInfo markInfo);
}