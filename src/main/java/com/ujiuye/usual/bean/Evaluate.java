package com.ujiuye.usual.bean;

import com.ujiuye.emp.bean.Employee;

import java.util.Date;
import java.util.List;

public class Evaluate {
    private Integer evaid;

    private Integer forumFk;

    private Integer empFk4;

    private Integer evaidFk;

    private String evacontent;

    private Date updatetime;

    private Date evatime;

    private Integer evastatus;


    //一个评价会有多个子评价
    private List<Evaluate> childEvaluateList;

    public List<Evaluate> getChildEvaluateList() {
        return childEvaluateList;
    }

    public void setChildEvaluateList(List<Evaluate> childEvaluateList) {
        this.childEvaluateList = childEvaluateList;
    }


    //一个评价要有一个评论人
    private Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Integer getEvaid() {
        return evaid;
    }

    public void setEvaid(Integer evaid) {
        this.evaid = evaid;
    }

    public Integer getForumFk() {
        return forumFk;
    }

    public void setForumFk(Integer forumFk) {
        this.forumFk = forumFk;
    }

    public Integer getEmpFk4() {
        return empFk4;
    }

    public void setEmpFk4(Integer empFk4) {
        this.empFk4 = empFk4;
    }

    public Integer getEvaidFk() {
        return evaidFk;
    }

    public void setEvaidFk(Integer evaidFk) {
        this.evaidFk = evaidFk;
    }

    public String getEvacontent() {
        return evacontent;
    }

    public void setEvacontent(String evacontent) {
        this.evacontent = evacontent == null ? null : evacontent.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Date getEvatime() {
        return evatime;
    }

    public void setEvatime(Date evatime) {
        this.evatime = evatime;
    }

    public Integer getEvastatus() {
        return evastatus;
    }

    public void setEvastatus(Integer evastatus) {
        this.evastatus = evastatus;
    }
}