package com.ujiuye.util;

import org.springframework.core.convert.converter.Converter;
/**
 * @Auther: 葛弋辉
 * @Date: 2019/10/19 15:25
 */
public class MyTrimString implements Converter<String,String> {
    /*
        自己定义的忽略表单参数空格
     */
    @Override
    public String convert(String s) {
        return s.trim();
    }
}
