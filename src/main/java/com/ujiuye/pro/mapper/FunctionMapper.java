package com.ujiuye.pro.mapper;


import com.ujiuye.pro.bean.Function;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FunctionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Function record);

    int insertSelective(Function record);

    Function selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Function record);

    int updateByPrimaryKey(Function record);

    List<Function> getAllFunction();

    Function checkFunction(@Param("fname") String functionName, @Param("mid") Integer mid);

    List<Function> showNoTaskInfoFunction(Integer mid);
}