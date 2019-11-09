package com.ujiuye.cus.mapper;


import com.ujiuye.cus.bean.Customer;
import com.ujiuye.cus.bean.CustomerVo;

import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    public List<Customer> showInfo(CustomerVo customerVo);

    int batchDelete(Integer[] cid);
}