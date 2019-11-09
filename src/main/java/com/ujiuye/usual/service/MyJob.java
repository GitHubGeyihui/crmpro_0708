package com.ujiuye.usual.service;

import com.ujiuye.usual.bean.Msg;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MyJob implements Job {

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        //定时任务干什么
        Msg msg = (Msg)jobExecutionContext.getJobDetail().getJobDataMap().get("msg");
        //jdbc 使用jdbc添加数据
        System.out.println(msg.getMsgcontent()+"==========");
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql:///0708crm","root","root");
            PreparedStatement ps = con.prepareStatement("insert into msg(sendp,recvp,msgcontent) values(?,?,?)");
            ps.setInt(1,msg.getSendp());
            ps.setInt(2,msg.getRecvp());
            ps.setString(3,msg.getMsgcontent());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
