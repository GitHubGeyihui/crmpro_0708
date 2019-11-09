package com.ujiuye.usual.bean;

import com.ujiuye.emp.bean.Employee;

import java.util.Date;

public class Task {
    private Integer id;

    private Date starttime;

    private Date endtime;

    private String level;

    private String remark;

    private Integer funFk;

    private Integer empFk2;

    private Integer empFk;

    private String tasktitle;

    private Integer status=0;

    //任务的分配者
    private Employee employee;

    //任务的执行者
    private Employee employee2;

    public Employee getEmployee2() {
        return employee2;
    }

    public void setEmployee2(Employee employee2) {
        this.employee2 = employee2;
    }

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

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getFunFk() {
        return funFk;
    }

    public void setFunFk(Integer funFk) {
        this.funFk = funFk;
    }

    public Integer getEmpFk2() {
        return empFk2;
    }

    public void setEmpFk2(Integer empFk2) {
        this.empFk2 = empFk2;
    }

    public Integer getEmpFk() {
        return empFk;
    }

    public void setEmpFk(Integer empFk) {
        this.empFk = empFk;
    }

    public String getTasktitle() {
        return tasktitle;
    }

    public void setTasktitle(String tasktitle) {
        this.tasktitle = tasktitle == null ? null : tasktitle.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}