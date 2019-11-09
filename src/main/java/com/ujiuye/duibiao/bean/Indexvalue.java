package com.ujiuye.duibiao.bean;

import com.ujiuye.emp.bean.Employee;

import java.util.Date;

public class Indexvalue {
    private Integer inId;

    private Double inTurnover;

    private String inBusiness;

    private Integer comnameFk;

    private String inRemark;

    private String inFile;

    private Integer empFk5;

    private Date inStarttime;

    private Date inEndtime;

    private Date inUpdatetime;


    //对比的企业
    private Datacollect datacollect;

    public Datacollect getDatacollect() {
        return datacollect;
    }

    public void setDatacollect(Datacollect datacollect) {
        this.datacollect = datacollect;
    }


    //指标设定人
    private Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Integer getInId() {
        return inId;
    }

    public void setInId(Integer inId) {
        this.inId = inId;
    }

    public Double getInTurnover() {
        return inTurnover;
    }

    public void setInTurnover(Double inTurnover) {
        this.inTurnover = inTurnover;
    }

    public String getInBusiness() {
        return inBusiness;
    }

    public void setInBusiness(String inBusiness) {
        this.inBusiness = inBusiness == null ? null : inBusiness.trim();
    }

    public Integer getComnameFk() {
        return comnameFk;
    }

    public void setComnameFk(Integer comnameFk) {
        this.comnameFk = comnameFk;
    }

    public String getInRemark() {
        return inRemark;
    }

    public void setInRemark(String inRemark) {
        this.inRemark = inRemark == null ? null : inRemark.trim();
    }

    public String getInFile() {
        return inFile;
    }

    public void setInFile(String inFile) {
        this.inFile = inFile == null ? null : inFile.trim();
    }

    public Integer getEmpFk5() {
        return empFk5;
    }

    public void setEmpFk5(Integer empFk5) {
        this.empFk5 = empFk5;
    }

    public Date getInStarttime() {
        return inStarttime;
    }

    public void setInStarttime(Date inStarttime) {
        this.inStarttime = inStarttime;
    }

    public Date getInEndtime() {
        return inEndtime;
    }

    public void setInEndtime(Date inEndtime) {
        this.inEndtime = inEndtime;
    }

    public Date getInUpdatetime() {
        return inUpdatetime;
    }

    public void setInUpdatetime(Date inUpdatetime) {
        this.inUpdatetime = inUpdatetime;
    }
}