package com.ujiuye.usual.mapper;


import com.ujiuye.usual.bean.Evaluate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EvaluateMapper {
    int deleteByPrimaryKey(Integer evaid);

    int insert(Evaluate record);

    int insertSelective(Evaluate record);

    Evaluate selectByPrimaryKey(Integer evaid);

    int updateByPrimaryKeySelective(Evaluate record);

    int updateByPrimaryKey(Evaluate record);

    List<Evaluate> getParentEvaluateByFid(Integer fid);

    List<Evaluate> getChildEvaluateByFid(@Param("fid") Integer fid,@Param("pid") Integer pid);


    int deleteInfoByFid(Integer id);
}