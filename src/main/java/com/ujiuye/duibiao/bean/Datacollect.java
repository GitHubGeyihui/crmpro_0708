package com.ujiuye.duibiao.bean;

import java.util.Date;

public class Datacollect {
    private Integer daid;

    private String dacname;

    private Double daturnover;

    private Date datime;

    private String dabusiness;

    private String dasuperiority;

    private String dainforiority;

    private Integer dasort;

    private Integer empcount;

    private Date buildtime;

    private String remark;

    private String daother;

    public Integer getDaid() {
        return daid;
    }

    public void setDaid(Integer daid) {
        this.daid = daid;
    }

    public String getDacname() {
        return dacname;
    }

    public void setDacname(String dacname) {
        this.dacname = dacname == null ? null : dacname.trim();
    }

    public Double getDaturnover() {
        return daturnover;
    }

    public void setDaturnover(Double daturnover) {
        this.daturnover = daturnover;
    }

    public Date getDatime() {
        return datime;
    }

    public void setDatime(Date datime) {
        this.datime = datime;
    }

    public String getDabusiness() {
        return dabusiness;
    }

    public void setDabusiness(String dabusiness) {
        this.dabusiness = dabusiness == null ? null : dabusiness.trim();
    }

    public String getDasuperiority() {
        return dasuperiority;
    }

    public void setDasuperiority(String dasuperiority) {
        this.dasuperiority = dasuperiority == null ? null : dasuperiority.trim();
    }

    public String getDainforiority() {
        return dainforiority;
    }

    public void setDainforiority(String dainforiority) {
        this.dainforiority = dainforiority == null ? null : dainforiority.trim();
    }

    public Integer getDasort() {
        return dasort;
    }

    public void setDasort(Integer dasort) {
        this.dasort = dasort;
    }

    public Integer getEmpcount() {
        return empcount;
    }

    public void setEmpcount(Integer empcount) {
        this.empcount = empcount;
    }

    public Date getBuildtime() {
        return buildtime;
    }

    public void setBuildtime(Date buildtime) {
        this.buildtime = buildtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getDaother() {
        return daother;
    }

    public void setDaother(String daother) {
        this.daother = daother == null ? null : daother.trim();
    }
}