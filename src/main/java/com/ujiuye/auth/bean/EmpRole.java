package com.ujiuye.auth.bean;

public class EmpRole {
    private Integer erid;

    private Integer roleFk;

    private Integer empFk;

    private String erdis;

    public Integer getErid() {
        return erid;
    }

    public void setErid(Integer erid) {
        this.erid = erid;
    }

    public Integer getRoleFk() {
        return roleFk;
    }

    public void setRoleFk(Integer roleFk) {
        this.roleFk = roleFk;
    }

    public Integer getEmpFk() {
        return empFk;
    }

    public void setEmpFk(Integer empFk) {
        this.empFk = empFk;
    }

    public String getErdis() {
        return erdis;
    }

    public void setErdis(String erdis) {
        this.erdis = erdis == null ? null : erdis.trim();
    }
}