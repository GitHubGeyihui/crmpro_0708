package com.ujiuye.cus.bean;

/*
*
*   vo 业务模型，和表单中的控件进行对应的
*   bean数据模型  和数据库中的表对应的
*
* */

public class CustomerVo extends Customer {

    private Integer kinds;//查询类型
    private String keyCode="";//查询的关键字
    private Integer mark;//是否排序的标记

    public Integer getKinds() {
        return kinds;
    }

    public void setKinds(Integer kinds) {
        this.kinds = kinds;
    }

    public String getKeyCode() {
        return keyCode;
    }

    public void setKeyCode(String keyCode) {
        this.keyCode = keyCode;
    }

    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }
}
