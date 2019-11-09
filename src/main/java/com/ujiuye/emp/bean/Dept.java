package com.ujiuye.emp.bean;

public class Dept {
    private Integer deptno;

    private String dname;

    private String dlocation;

    public Integer getDeptno() {
        return deptno;
    }

    public void setDeptno(Integer deptno) {
        this.deptno = deptno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public String getDlocation() {
        return dlocation;
    }

    public void setDlocation(String dlocation) {
        this.dlocation = dlocation == null ? null : dlocation.trim();
    }

    @Override
    public String toString() {
         // "{'name':'张三',"age":123}"
        return "{"+"'deptno':" + deptno + ",'dname':'" + dname + "','dlocation':'" + dlocation +"'}";
    }
}