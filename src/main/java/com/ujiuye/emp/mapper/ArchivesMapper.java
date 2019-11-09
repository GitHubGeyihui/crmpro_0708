package com.ujiuye.emp.mapper;

import com.ujiuye.emp.bean.Archives;
import com.ujiuye.util.MarkInfo;

import java.util.List;

public interface ArchivesMapper {
    int deleteByPrimaryKey(String dnum);

    int insert(Archives record);

    int insertSelective(Archives record);

    Archives selectByPrimaryKey(String dnum);

    int updateByPrimaryKeySelective(Archives record);

    int updateByPrimaryKey(Archives record);

    List<Archives> showAllArchives(MarkInfo markInfo);

    Archives getOneArchivesByEid(Integer eid);

    boolean addBatchInfo(List<Archives> list);
}