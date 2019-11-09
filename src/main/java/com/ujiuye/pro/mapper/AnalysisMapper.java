package com.ujiuye.pro.mapper;


import com.ujiuye.pro.bean.Analysis;

import java.util.List;

public interface AnalysisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Analysis record);

    int insertSelective(Analysis record);

    Analysis selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Analysis record);

    int updateByPrimaryKey(Analysis record);

    List<Analysis> showAllAnalysis();

}