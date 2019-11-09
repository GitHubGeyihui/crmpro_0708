package com.ujiuye.auth.bean;

import java.util.ArrayList;
import java.util.List;

public class Sources {
    private Integer id;

    private String name;

    private String url;

    private String remark;

    private Integer pid;

    private String icon;

    //显示菜单树的时候是否打开或关闭父级菜单
    private boolean open;

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }
    //创建一个盛放自己菜单数据集合
    private List<Sources> children = new ArrayList<Sources>();

    public List<Sources> getChildren() {
        return children;
    }

    public void setChildren(List<Sources> children) {
        this.children = children;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }
}