package com.ujiuye.usual.mapper;


import com.ujiuye.usual.bean.Task;
import com.ujiuye.util.MarkInfo;

import java.util.List;

public interface TaskMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);

    List<Task> getTaskByEid(MarkInfo markInfo);


}