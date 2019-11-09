package com.ujiuye.emp.bean;

import java.util.Date;

public class Archives {
    private String dnum;

    private String landline;

    private String school;

    private String zhuanye;

    private String sosperson;

    private Date biyedate;

    private String zzmm;

    private String minzu;

    private String xueli;

    private String email;

    private Integer empFk;

    private String remark;

    private Date hirdate;

    //关联对象
    private  Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getDnum() {
        return dnum;
    }

    public void setDnum(String dnum) {
        this.dnum = dnum == null ? null : dnum.trim();
    }

    public String getLandline() {
        return landline;
    }

    public void setLandline(String landline) {
        this.landline = landline == null ? null : landline.trim();
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public String getZhuanye() {
        return zhuanye;
    }

    public void setZhuanye(String zhuanye) {
        this.zhuanye = zhuanye == null ? null : zhuanye.trim();
    }

    public String getSosperson() {
        return sosperson;
    }

    public void setSosperson(String sosperson) {
        this.sosperson = sosperson == null ? null : sosperson.trim();
    }

    public Date getBiyedate() {
        return biyedate;
    }

    public void setBiyedate(Date biyedate) {
        this.biyedate = biyedate;
    }

    public String getZzmm() {
        return zzmm;
    }

    public void setZzmm(String zzmm) {
        this.zzmm = zzmm == null ? null : zzmm.trim();
    }

    public String getMinzu() {
        return minzu;
    }

    public void setMinzu(String minzu) {
        this.minzu = minzu == null ? null : minzu.trim();
    }

    public String getXueli() {
        return xueli;
    }

    public void setXueli(String xueli) {
        this.xueli = xueli == null ? null : xueli.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getEmpFk() {
        return empFk;
    }

    public void setEmpFk(Integer empFk) {
        this.empFk = empFk;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getHirdate() {
        return hirdate;
    }

    public void setHirdate(Date hirdate) {
        this.hirdate = hirdate;
    }
}