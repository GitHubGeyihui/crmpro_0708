package com.ujiuye.usual.controller;

import com.ujiuye.emp.bean.Archives;
import com.ujiuye.usual.bean.*;
import com.ujiuye.usual.service.MyJob;
import com.ujiuye.usual.service.UsualService;
import com.ujiuye.util.MarkInfo;

import com.ujiuye.util.MyUUID;
import com.ujiuye.util.ResultInfo;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;


@Controller
@RequestMapping("/usual")
public class UsualController {
    @Autowired
    private UsualService usualService;
    @Autowired
    private JedisPool jedisPool;
    @RequestMapping("addTaskInfo")
    public String addTaskInfo(Task task) {
        //只有具有分配任务权限的人，才有资格有此操作
        //s使用模拟数据 模拟登录用户
        Jedis jedis = jedisPool.getResource();
        task.setEmpFk(Integer.parseInt(jedis.hget("empInfo","eid")));
        boolean flag = usualService.addTaskInfo(task);
        return "task";
    }

    //异步显示当前登录用户所被分配的任务
    @RequestMapping("getTaskByEid")
    @ResponseBody
    public List<Task> getTaskByEid(MarkInfo markInfo) {
        //只有具有分配任务权限的人，才有资格有此操作
        //s使用模拟数据 模拟登录用户
/*        Jedis jedis = jedisPool.getResource();
        markInfo.setEid(Integer.parseInt(jedis.hget("empInfo","eid")));
        */
        markInfo.setEid(5);
        System.out.println(markInfo.getMark() + "============");
        return usualService.getTaskByEid(markInfo);
    }

    //修改任务状态
    @RequestMapping("updateTaskStatus")
    public String updateTaskStatus(Task task) {
        boolean flag = usualService.updateTaskStatus(task);
        return "task-my";
    }

    //更具主键 显示项目信息
    @RequestMapping("getTaskById")
    @ResponseBody
    public Task getTaskById(Integer id) {
        return usualService.getTaskById(id);
    }

    //显示通知公告详情
    @RequestMapping("showAllNotice")
    @ResponseBody
    public List<Notice> showAllNotice(MarkInfo markInfo) {
        return usualService.showAllNotice(markInfo);
    }

    //发布公告
    @RequestMapping("saveNoticeinfo")
    public String saveNoticeinfo(Notice notice) {
        boolean flag = usualService.saveNoticeinfo(notice);
        return "notice";
    }

    //展示通知内容
    @RequestMapping("showOneInfo")
    @ResponseBody
    public Notice showOneInfo(Integer nid) {
        return usualService.showOneInfo(nid);
    }

    //设定响应数据的主题内容
    @RequestMapping("showAllArchives")
    @ResponseBody
    public List<Archives> showAllArchives(MarkInfo markInfo) {
        return usualService.showAllArchives(markInfo);
    }

    //展示登录用户的报销单信息
    @RequestMapping("showAllBaoxiaoInfo")
    @ResponseBody
    public List<Baoxiao> showAllBaoxiaoInfo(MarkInfo markInfo) {
       /* Jedis jedis = jedisPool.getResource();
        markInfo.setEid(Integer.parseInt(jedis.hget("empInfo","eid")));*/
        markInfo.setEid(1);
        return usualService.showAllBaoxiaoInfo(markInfo);
    }

    //显示支出类型
    @RequestMapping("showEt")
    @ResponseBody
    public List<Expendituretype> showEt(MarkInfo markInfo) {
        return usualService.showet(markInfo);
    }

    // 添加一个报销单
    @RequestMapping("addBaoxiao")
    public String addBaoxiao(Baoxiao baoxiao) {
        // 报销人 测试数据
       /* Jedis jedis = jedisPool.getResource();
        baoxiao.setEmpFk(Integer.parseInt(jedis.hget("empInfo","eid")));*/
        baoxiao.setEmpFk(1);
        //手动添加我们的主键
        baoxiao.setBxid(MyUUID.getUUID());
        boolean flag = usualService.addBaoxiao(baoxiao);
        return "mybaoxiao-base";
    }

    //根据报销单id获取当前报销单的信息
    @RequestMapping("getOneBaoxiaoInfo")
    @ResponseBody
    public Map<String, Object> getOneBaoxiaoInfo(Baoxiao baoxiao) {
        // map集合需要显示当前报销单的详细信息和我们的支出类型的信息.
        return usualService.getOneBaoxiaoInfo(baoxiao);
    }

    //更新报销单信息
    @RequestMapping("updateBaoxiao")
    public String updateBaoxiao(Baoxiao baoxiao) {
        baoxiao.setBxstatus(0);
        boolean flag = usualService.updateBaoxiao(baoxiao);
        return "mybaoxiao-base";
    }

    //审批报销单内容
    @RequestMapping("shenPi")
    @ResponseBody
    public ResultInfo shenPi(Integer bxstatus, Baoxiaoreply baoxiaoreply) {
        ResultInfo ri = new ResultInfo();
        boolean flag = usualService.shePi(bxstatus, baoxiaoreply);
        if (flag) {
            ri.setFlag(true);
            ri.setMessage("审批成功");
        } else {
            ri.setMessage("程序异常");
        }
        return ri;
    }

    //将档案文件的档案信息上传到数据库中 addArchives
    @RequestMapping("addArchives")
    public String addArchives(MultipartFile files) throws Exception {
        //获取上传文件在硬盘上的路径
        String path = "E:\\Download";
        if(files.getSize()>0){
            //获取上传文件原本的名字
            String originalFilename = files.getOriginalFilename();
            //设置文件上传的全路径
            path+="\\"+originalFilename;
            File file = new File(path);
            //将上传的文件移交到
            files.transferTo(file);
            /*服务器可以进行读取的文件
            HSSFWorkbook excel文档对象
            HSSFSheet excel的sheet
            HSSRow excel的行
            HSSCell excel的单元格*/
            HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(file));
            int count = workbook.getNumberOfSheets();
            System.out.println(count+"===");

            for (int i = 0;i<count;i++){
                HSSFSheet sheetAt = workbook.getSheetAt(i);
                int lastRowNum = sheetAt.getLastRowNum();
                List<Archives> list = new ArrayList<Archives>();
                System.out.println(lastRowNum+"******");
                for (int j=1;j<lastRowNum+1;j++){
                    Archives archives = new Archives();
                    HSSFRow row = sheetAt.getRow(j);//表格中的第二行
                    archives.setDnum(row.getCell(0).getStringCellValue());
                    archives.setLandline(row.getCell(1).getStringCellValue());
                    archives.setSchool(row.getCell(2).getStringCellValue());
                    archives.setZhuanye(row.getCell(3).getStringCellValue());
                    archives.setSosperson(row.getCell(4).getStringCellValue());
                    archives.setBiyedate(row.getCell(5).getDateCellValue());
                    archives.setZzmm(row.getCell(6).getStringCellValue());
                    archives.setMinzu(row.getCell(7).getStringCellValue());
                    archives.setXueli(row.getCell(8).getStringCellValue());
                    archives.setEmail(row.getCell(9).getStringCellValue());
                    archives.setEmpFk((int)row.getCell(10).getNumericCellValue());
                    archives.setRemark(row.getCell(11).getStringCellValue());
                    archives.setHirdate(row.getCell(12).getDateCellValue());
                    list.add(archives);
                }
                boolean flag = usualService.addBatchInfo(list);
            }

        }
        return "archives";
    }
    //发布帖子
    @RequestMapping("addForumPost")
    public String addForumPost(Forumpost forumpost) {
        //模拟登录用户

        forumpost.setEmpFk3(6);
        forumpost.setCreatetime(new java.util.Date());
        boolean flag = usualService.addForumPost(forumpost);
        return "forum-showmyself";
    }

    // 根据登陆用户的id查询我们的帖子信息
    @RequestMapping("getOneByEid")
    @ResponseBody
    public List<Forumpost> getOneByEid(MarkInfo markInfo){
        //模拟数据 登陆用户的id
       /* Jedis jedis = jedisPool.getResource();
        markInfo.setEid(Integer.parseInt(jedis.hget("empInfo","eid")));*/
        markInfo.setEid(6);
        return usualService.getOneByEid(markInfo);
    }

    @RequestMapping("getForumpostByid")
    public String getForumpostByid(Integer id, ModelMap modelMap){
        //获取帖子的ID
        //获取发帖人的信息
        //当前帖子的评价信息（评价信息要有父子级关系）
        //当前的评价人
        Forumpost forumpost = usualService.getForumpostByid(id);
        modelMap.addAttribute("forumpost",forumpost);
        return "forum-reply";
    }
    //添加评论
    @RequestMapping("addEvaluate")
    public  String addEvaluate(Evaluate evaluate){
        //模拟数据 登录人
        /*Jedis jedis = jedisPool.getResource();
        evaluate.setEmpFk4(Integer.parseInt(jedis.hget("empInfo","eid")));*/
        evaluate.setEmpFk4(1);
        boolean flag = usualService.addEvaluate(evaluate);
        return "redirect:getForumpostByid?id="+evaluate.getForumFk();
    }
    //删除评论
    @RequestMapping("deleteForum")
    public String deleteForum(Integer id){
        boolean flag = usualService.deleteForum(id);
        return "forum-showmyself";
    }

    //定時消息發送
    @RequestMapping("sendMessage")
    public String sendMessage(Msg msg) throws SchedulerException {
        /*
        * 上面三个部分就是Quartz的基本组成部分：
            调度器：Scheduler
            任务：JobDetail
            触发器：Trigger，包括SimpleTrigger和CronTrigger
        * */
        //调度器工厂
        SchedulerFactory sf = new StdSchedulerFactory();
        //调度器
        Scheduler scheduler = sf.getScheduler();

        //指定job
        JobDetail jobDetail= JobBuilder.newJob(MyJob.class)
                .withIdentity("job12","job12g")
                .build();

        msg.setSendp(20);//设置发送人
        //将我们的表单的值传递到我们的job方法中
        jobDetail.getJobDataMap().put("msg",msg);

        //创建一个触发器
        Trigger  trigger = TriggerBuilder.newTrigger()
                .withIdentity("tr2","grg2")//任务的名称
                .withSchedule(SimpleScheduleBuilder.simpleSchedule())
                .startAt(msg.getMsgtime())
                .build();//构建

        //调度器管理job 和触发器
        scheduler.scheduleJob(jobDetail,trigger);
        //开启调度的任务(启动线程)
        scheduler.start();
        return "message-give";
    }

    @RequestMapping("showMsg")
    @ResponseBody
    public List<Msg> showMsg(){
        //测试数据
        Integer eid=20;
        return usualService.showMsg(eid);
    }


    //发送邮件
    @RequestMapping("sendEmail")
    public String  sendEmail(Email email, @RequestParam("files") MultipartFile[] files, String emailAddress) throws Exception {
        //设置我们的登录的人就是我们的发件人
        email.setEmpFk(1);

        //邮箱的账号和密码
        final String sendAccount="gyh19981104@163.com";
        String password="Geyihui19981104";
        // 邮箱的授权码
        final String authPass= "gyh19981104";

        // 设定我们邮件服务器的协议,验证
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol","smtp");//邮件协议smtp
        properties.setProperty("mail.smtp.host","smtp.163.com");// 邮件服务器的地址 163
        properties.setProperty("mail.smtp.auth","true");//是否有验证(授权码)

        //创建一个验证对象
        Authenticator authenticator= new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sendAccount,authPass);
            }
        };
        //构建和邮件服务器之间的会话
        Session session = Session.getInstance(properties,authenticator);
        //显示我们邮件发送的过程
        session.setDebug(true);
        //创建一个消息对象
        MimeMessage message = new MimeMessage(session);
        //设定发件人(发件箱)
        message.setFrom(new InternetAddress(sendAccount));
        //为了避免出现我们的垃圾邮件的拦截，给当前的自己的发件箱抄送一份
        message.addRecipient(Message.RecipientType.CC,new InternetAddress(sendAccount));
        //设定收件箱
        message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(emailAddress));

        //创建邮件的身体(文本内容,附件)  List集合,容器
        MimeMultipart multipart = new MimeMultipart();

        //邮件主题的一部分
        MimeBodyPart bodyPart = new MimeBodyPart();
        //设置我们的主题文本内容
        bodyPart.setText(email.getEmailcontent());
        //将邮件的一部分内容放入到整体容器中  list.add();
        multipart.addBodyPart(bodyPart);

        //
        if(files.length>0){
            //添加附件
            for(MultipartFile multipartFile:files){
                String  path="E:\\uplode\\";
                String  fileName=multipartFile.getOriginalFilename();
                if(fileName!=null&&fileName.length()>0){
                    File file = new File(path+fileName);
                    //先将文件上传到指定位置
                    multipartFile.transferTo(file);

                    MimeBodyPart bodyPart1 = new MimeBodyPart();
                    //通过一个file对象构建一个数据源
                    DataSource ds = new FileDataSource(file);
                    //将数据源放入到存放数据的对象上
                    DataHandler handler = new DataHandler(ds);
                    //发送邮件中附件的中文名称处理
                    bodyPart1.setFileName(MimeUtility.encodeText(fileName));
                    //存放的数据对象设置给bodyPart
                    bodyPart1.setDataHandler(handler);
                    //bodyPar放入到容器中
                    multipart.addBodyPart(bodyPart1);
                }

            }
        }
        //将我们的邮件的主题放入到message上
        message.setContent(multipart);
        //设置邮件的主题
        message.setSubject(email.getTitle());
        message.setSentDate(new java.util.Date());
        //保存当前消息中的内容
        message.saveChanges();

        //发送消息,获取发送message的对象
        Transport transport = session.getTransport();
        //设定发件人(邮箱账号和密码)
        transport.connect(sendAccount,password);
        //发送我们的消息和设定收件人的地址
        transport.sendMessage(message,message.getAllRecipients());
        //关闭链接
        transport.close();

        boolean flag = usualService.addEmail(email);

        return "email";
    }

    @RequestMapping("showEmail")
    @ResponseBody
    public  List<Email> showEmailInfo(){
        return usualService.getEmailInfo();
    }


}

