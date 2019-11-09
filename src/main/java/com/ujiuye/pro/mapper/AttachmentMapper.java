package com.ujiuye.pro.mapper;


import com.ujiuye.pro.bean.Attachment;
import com.ujiuye.util.MarkInfo;

import java.util.List;

public interface AttachmentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Attachment record);

    int insertSelective(Attachment record);

    Attachment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Attachment record);

    int updateByPrimaryKey(Attachment record);

    List<Attachment> showAllAttachment(MarkInfo markInfo);
}