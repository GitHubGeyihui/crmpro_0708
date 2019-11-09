package com.ujiuye.usual.service;

import com.ujiuye.emp.bean.Archives;
import com.ujiuye.emp.bean.Employee;
import com.ujiuye.emp.mapper.ArchivesMapper;
import com.ujiuye.emp.mapper.EmployeeMapper;
import com.ujiuye.usual.bean.*;
import com.ujiuye.usual.mapper.*;
import com.ujiuye.util.MarkInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UsualServiceImpl implements UsualService {
    @Resource
    private TaskMapper taskMapper;
    @Resource
    private NoticeMapper noticeMapper;
    @Resource
    private ArchivesMapper archivesMapper;
    @Resource
    private BaoxiaoMapper baoxiaoMapper;
    @Resource
    private ExpendituretypeMapper expendituretypeMapper;

    @Resource
    private BaoxiaoreplyMapper baoxiaoreplyMapper;

    @Resource
    private ForumpostMapper forumpostMapper;
    @Resource
    private EmployeeMapper employeeMapper;
    @Resource
    private EvaluateMapper evaluateMapper;
    @Resource
    private  MsgMapper msgMapper;
    @Resource
    private  EmailMapper emailMapper;


    @Override
    public boolean addTaskInfo(Task task) {
        return taskMapper.insert(task) > 0;
    }

    @Override
    public List<Task> getTaskByEid(MarkInfo markInfo) {

        return taskMapper.getTaskByEid(markInfo);
    }

    @Override
    public boolean updateTaskStatus(Task task) {
        return taskMapper.updateByPrimaryKeySelective(task) > 0;
    }

    @Override
    public Task getTaskById(Integer id) {
        return taskMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Notice> showAllNotice(MarkInfo markInfo) {
        return noticeMapper.showAllNotice(markInfo);
    }

    @Override
    public boolean saveNoticeinfo(Notice notice) {
        return noticeMapper.insert(notice) > 0;
    }

    @Override
    public Notice showOneInfo(Integer nid) {
        return noticeMapper.selectByPrimaryKey(nid);
    }

    @Override
    public List<Archives> showAllArchives(MarkInfo markInfo) {
        return archivesMapper.showAllArchives(markInfo);
    }

    @Override
    public List<Baoxiao> showAllBaoxiaoInfo(MarkInfo markInfo) {

        return baoxiaoMapper.showAllInfo(markInfo);
    }
    @Override
    public List<Expendituretype> showet(MarkInfo markInfo) {
        return expendituretypeMapper.showEt(markInfo);
    }

    @Override
    public boolean addBaoxiao(Baoxiao baoxiao) {
        return baoxiaoMapper.insert(baoxiao) > 0;
    }

    @Override
    public Map<String, Object> getOneBaoxiaoInfo(Baoxiao baoxiao) {
        Map<String, Object> map = new HashMap<String, Object>();
        Baoxiao baoxiao1 = baoxiaoMapper.selectByPrimaryKey(baoxiao.getBxid());
        map.put("baoxiao", baoxiao1);
        //支出类型
        List<Expendituretype> expendituretypes = expendituretypeMapper.showEt(null);
        map.put("et", expendituretypes);
        //当前报销单的历史批注的信息记录
        List<Baoxiaoreply> list = baoxiaoreplyMapper.getPizhuBybxid(baoxiao1.getBxid());
        map.put("bxreply", list);
        return map;
    }

    @Override
    public boolean updateBaoxiao(Baoxiao baoxiao) {
        return baoxiaoMapper.updateByPrimaryKeySelective(baoxiao) > 0;
    }
    // 审批报销单

    @Override
    @Transactional
    public boolean shePi(Integer bxstatus, Baoxiaoreply baoxiaoreply) {
        /*
         * 1: 需要新表中添加一条审批记录
         * 2：更新报销单表中数据的状态
         * */
        baoxiaoreply.setReplytime(new java.util.Date());
        boolean flag = baoxiaoreplyMapper.insert(baoxiaoreply) > 0;
        //更新报销单的状态码
        Baoxiao baoxiao = new Baoxiao();
        baoxiao.setBxid(baoxiaoreply.getBaoxiaoFk());
        baoxiao.setBxstatus(bxstatus);
        boolean flag1 = baoxiaoMapper.updateByPrimaryKeySelective(baoxiao) > 0;
        if (flag && flag1) {
            return true;
        }
        return false;
    }

    @Override
    public boolean addForumPost(Forumpost forumpost) {
        return forumpostMapper.insert(forumpost) > 0;
    }

    @Override
    public List<Forumpost> getOneByEid(MarkInfo markInfo) {

        return forumpostMapper.getOneByEid(markInfo);
    }

    @Override
    public Forumpost getForumpostByid(Integer id) {
        //更据帖子的ID 获取当前帖子的ID
        Forumpost forumpost = forumpostMapper.selectByPrimaryKey(id);
        //获取发帖人的信息
        Employee employee = employeeMapper.selectByPrimaryKey(forumpost.getEmpFk3());
        forumpost.setEmployee(employee);
        //当前帖子的评价信息（评价信息要有父子级关系）(用id拿一级评价)
        List<Evaluate> evaluates = evaluateMapper.getParentEvaluateByFid(id);
        //遍历一个文件夹下有多少个文件 File 文件调用
        //用递归方法调用帖子信息
        getChild(evaluates);
        //帖子下所有的评价（划分层级关系）
        forumpost.setEvaluateList(evaluates);
        return forumpost;
    }


    //递归调用获取我们当前帖子的子评论
    public void getChild(List<Evaluate> evaluates) {
        if (evaluates.size() > 0) {
            for (Evaluate evaluate:evaluates) {
                //更具评论中包含的人的外键获取评论人的信息
                Employee employee = employeeMapper.selectByPrimaryKey(evaluate.getEmpFk4());
                //设定我们的评论人对象
                evaluate.setEmployee(employee);
                //必须是当前帖子下的评价，必须是有父评价id
                List<Evaluate> list = evaluateMapper.getChildEvaluateByFid(evaluate.getForumFk(),evaluate.getEvaid());
                //設定子评价给到父评价对象
                evaluate.setChildEvaluateList(list);
                getChild(list);
            }
        }
    }

    //添加一条评论
    @Override
    public boolean addEvaluate(Evaluate evaluate) {
        return evaluateMapper.insert(evaluate)>0;
    }

    @Override
    @Transactional
    public boolean deleteForum(Integer id) {
        /*
         * 如果表中设计了外键关系，我们在删除的过程中
         * 必须先删除我们的关联数据，然后才能删除主表数据
         * 解决方案：去除掉我们的关联的外键（物理外键）
         * 先去删除评价
         * 在删除我们的帖子
         * */
        boolean flag = evaluateMapper.deleteInfoByFid(id)>0;
        boolean flag2 = forumpostMapper.deleteByPrimaryKey(id)>0;
        if(flag&&flag2){
            return true;
        }
        return false;
    }

    @Override
    public boolean addBatchInfo(List<Archives> list) {
        return archivesMapper.addBatchInfo(list);
    }

    @Override
    public List<Msg> showMsg(Integer eid) {
        return msgMapper.showMsg(eid);
    }

    @Override
    public boolean addEmail(Email email) {
        return emailMapper.insert(email)>0;
    }

    @Override
    public List<Email> getEmailInfo() {
        List<Email> emailInfo = emailMapper.getEmailInfo();
        for(Email email:emailInfo){
            Employee employee = employeeMapper.selectByPrimaryKey(email.getEmpFk2());
            email.setEmployee(employee);
        }
        return emailInfo;
    }

}
