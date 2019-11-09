package com.ujiuye.util;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Auther: 葛弋辉
 * @Date: 2019/10/19 15:25
 */
public class DateConvertor implements Converter<String,Date> {
    /*
      自己定义的日期转换器  1999-09-09
   */
    @Override
    public Date convert(String s) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return sdf.parse(s);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
