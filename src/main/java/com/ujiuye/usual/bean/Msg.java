package com.ujiuye.usual.bean;

import com.ujiuye.emp.bean.Employee;

import java.util.Date;

public class Msg {
    private Integer msgid;

    private Integer sendp;

    private Integer recvp;

    private Integer mark;

    private String msgcontent;

    private Date msgtime;

    private Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Integer getMsgid() {
        return msgid;
    }

    public void setMsgid(Integer msgid) {
        this.msgid = msgid;
    }

    public Integer getSendp() {
        return sendp;
    }

    public void setSendp(Integer sendp) {
        this.sendp = sendp;
    }

    public Integer getRecvp() {
        return recvp;
    }

    public void setRecvp(Integer recvp) {
        this.recvp = recvp;
    }

    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }

    public String getMsgcontent() {
        return msgcontent;
    }

    public void setMsgcontent(String msgcontent) {
        this.msgcontent = msgcontent == null ? null : msgcontent.trim();
    }

    public Date getMsgtime() {
        return msgtime;
    }

    public void setMsgtime(Date msgtime) {
        this.msgtime = msgtime;
    }
}