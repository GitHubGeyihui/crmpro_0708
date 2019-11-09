package com.ujiuye.pro.bean;

public class Function {
    private Integer id;

    private String proname;

    private String analysisname;

    private Integer modeleFk;

    private String functionname;

    private String level;

    private String simpledis;

    private String detaileddis;

    private String remark;

    //关联的模块对象
    private Module module;

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname == null ? null : proname.trim();
    }

    public String getAnalysisname() {
        return analysisname;
    }

    public void setAnalysisname(String analysisname) {
        this.analysisname = analysisname == null ? null : analysisname.trim();
    }

    public Integer getModeleFk() {
        return modeleFk;
    }

    public void setModeleFk(Integer modeleFk) {
        this.modeleFk = modeleFk;
    }

    public String getFunctionname() {
        return functionname;
    }

    public void setFunctionname(String functionname) {
        this.functionname = functionname == null ? null : functionname.trim();
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    public String getSimpledis() {
        return simpledis;
    }

    public void setSimpledis(String simpledis) {
        this.simpledis = simpledis == null ? null : simpledis.trim();
    }

    public String getDetaileddis() {
        return detaileddis;
    }

    public void setDetaileddis(String detaileddis) {
        this.detaileddis = detaileddis == null ? null : detaileddis.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}