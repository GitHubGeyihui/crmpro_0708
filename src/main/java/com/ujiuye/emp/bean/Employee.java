package com.ujiuye.emp.bean;

import java.util.Date;

public class Employee {
    private Integer eid;

    private String ename;

    private String esex;

    private Integer eage;

    private String telephone;

    private Date hiredate;

    private String pnum;

    private String username;

    private String password;

    private String remark;

    private Integer pFk;

    private Integer dFk;

    private Integer lFk;

    private String emppic;

    private Position position; //职位

    private Level level;//级别

    private Dept dept;//部门

    private  Archives archives;//档案

    public Archives getArchives() {
        return archives;
    }

    public void setArchives(Archives archives) {
        this.archives = archives;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename == null ? null : ename.trim();
    }

    public String getEsex() {
        return esex;
    }

    public void setEsex(String esex) {
        this.esex = esex == null ? null : esex.trim();
    }

    public Integer getEage() {
        return eage;
    }

    public void setEage(Integer eage) {
        this.eage = eage;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public Date getHiredate() {
        return hiredate;
    }

    public void setHiredate(Date hiredate) {
        this.hiredate = hiredate;
    }

    public String getPnum() {
        return pnum;
    }

    public void setPnum(String pnum) {
        this.pnum = pnum == null ? null : pnum.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getpFk() {
        return pFk;
    }

    public void setpFk(Integer pFk) {
        this.pFk = pFk;
    }

    public Integer getdFk() {
        return dFk;
    }

    public void setdFk(Integer dFk) {
        this.dFk = dFk;
    }

    public Integer getlFk() {
        return lFk;
    }

    public void setlFk(Integer lFk) {
        this.lFk = lFk;
    }

    public String getEmppic() {
        return emppic;
    }

    public void setEmppic(String emppic) {
        this.emppic = emppic == null ? null : emppic.trim();
    }
}