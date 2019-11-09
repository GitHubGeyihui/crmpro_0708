package com.ujiuye.usual.service;

import com.ujiuye.emp.bean.Archives;
import com.ujiuye.usual.bean.*;
import com.ujiuye.util.MarkInfo;

import java.util.List;
import java.util.Map;


public interface UsualService {

    boolean addTaskInfo(Task task);

    List<Task> getTaskByEid(MarkInfo markInfo);

    boolean updateTaskStatus(Task task);

    Task getTaskById(Integer id);

    List<Notice> showAllNotice(MarkInfo markInfo);

    boolean saveNoticeinfo(Notice notice);

    Notice showOneInfo(Integer nid);

    List<Archives> showAllArchives(MarkInfo markInfo);

    List<Baoxiao> showAllBaoxiaoInfo(MarkInfo markInfo);

    List<Expendituretype> showet(MarkInfo markInfo);

    boolean addBaoxiao(Baoxiao baoxiao);

    Map<String,Object> getOneBaoxiaoInfo(Baoxiao baoxiao);

    boolean updateBaoxiao(Baoxiao baoxiao);

    boolean shePi(Integer bxstatus, Baoxiaoreply baoxiaoreply);

    boolean addForumPost(Forumpost forumpost);

    List<Forumpost> getOneByEid(MarkInfo markInfo);

    Forumpost getForumpostByid(Integer id);

    boolean addEvaluate(Evaluate evaluate);

    boolean deleteForum(Integer id);

    boolean addBatchInfo(List<Archives> list);

    List<Msg> showMsg(Integer eid);

    boolean addEmail(Email email);

    List<Email> getEmailInfo();
}
