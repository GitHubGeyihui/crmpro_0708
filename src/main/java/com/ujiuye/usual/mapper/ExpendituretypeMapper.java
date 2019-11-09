package com.ujiuye.usual.mapper;


import com.ujiuye.usual.bean.Expendituretype;
import com.ujiuye.util.MarkInfo;

import java.util.List;

public interface ExpendituretypeMapper {
    int deleteByPrimaryKey(Integer etid);

    int insert(Expendituretype record);

    int insertSelective(Expendituretype record);

    Expendituretype selectByPrimaryKey(Integer etid);

    int updateByPrimaryKeySelective(Expendituretype record);

    int updateByPrimaryKey(Expendituretype record);

    List<Expendituretype> showEt(MarkInfo markInfo);
}