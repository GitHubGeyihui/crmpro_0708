package com.ujiuye.usual.mapper;


import com.ujiuye.usual.bean.Baoxiaoreply;

import java.util.List;

public interface BaoxiaoreplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Baoxiaoreply record);

    int insertSelective(Baoxiaoreply record);

    Baoxiaoreply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Baoxiaoreply record);

    int updateByPrimaryKey(Baoxiaoreply record);

    List<Baoxiaoreply> getPizhuBybxid(String bxid);
}