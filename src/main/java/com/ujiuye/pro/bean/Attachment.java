package com.ujiuye.pro.bean;

public class Attachment {
    private Integer id;

    private Integer proFk;

    private String attname;

    private String attdis;

    private String remark;

    private String path;

    //附件所属的项目
    private  Project project;

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProFk() {
        return proFk;
    }

    public void setProFk(Integer proFk) {
        this.proFk = proFk;
    }

    public String getAttname() {
        return attname;
    }

    public void setAttname(String attname) {
        this.attname = attname == null ? null : attname.trim();
    }

    public String getAttdis() {
        return attdis;
    }

    public void setAttdis(String attdis) {
        this.attdis = attdis == null ? null : attdis.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }
}