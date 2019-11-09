package com.ujiuye.usual.bean;

import com.ujiuye.emp.bean.Employee;

import java.util.Date;

public class Email {
    private Integer id;

    private String title;

    private Date sendtime;

    private Integer empFk;

    private Integer empFk2;

    private String emailcontent;

   private Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }

    public Integer getEmpFk() {
        return empFk;
    }

    public void setEmpFk(Integer empFk) {
        this.empFk = empFk;
    }

    public Integer getEmpFk2() {
        return empFk2;
    }

    public void setEmpFk2(Integer empFk2) {
        this.empFk2 = empFk2;
    }

    public String getEmailcontent() {
        return emailcontent;
    }

    public void setEmailcontent(String emailcontent) {
        this.emailcontent = emailcontent == null ? null : emailcontent.trim();
    }


}