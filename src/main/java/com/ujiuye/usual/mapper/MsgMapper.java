package com.ujiuye.usual.mapper;


import com.ujiuye.usual.bean.Msg;

import java.util.List;

public interface MsgMapper {
    int deleteByPrimaryKey(Integer msgid);

    int insert(Msg record);

    int insertSelective(Msg record);

    Msg selectByPrimaryKey(Integer msgid);

    int updateByPrimaryKeySelective(Msg record);

    int updateByPrimaryKey(Msg record);

    List<Msg> showMsg(Integer eid);
}