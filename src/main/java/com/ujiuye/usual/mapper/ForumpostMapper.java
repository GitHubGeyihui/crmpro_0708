package com.ujiuye.usual.mapper;


import com.ujiuye.usual.bean.Forumpost;
import com.ujiuye.util.MarkInfo;

import java.util.List;

public interface ForumpostMapper {
    int deleteByPrimaryKey(Integer forumid);

    int insert(Forumpost record);

    int insertSelective(Forumpost record);

    Forumpost selectByPrimaryKey(Integer forumid);

    int updateByPrimaryKeySelective(Forumpost record);

    int updateByPrimaryKey(Forumpost record);

    List<Forumpost> getOneByEid(MarkInfo eid);
}