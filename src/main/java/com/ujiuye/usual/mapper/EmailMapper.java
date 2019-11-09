package com.ujiuye.usual.mapper;


import com.ujiuye.usual.bean.Email;

import java.util.List;

public interface EmailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Email record);

    int insertSelective(Email record);

    Email selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Email record);

    int updateByPrimaryKey(Email record);

    List<Email> getEmailInfo();
}