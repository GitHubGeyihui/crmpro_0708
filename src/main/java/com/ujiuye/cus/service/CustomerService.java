package com.ujiuye.cus.service;

import com.ujiuye.cus.bean.Customer;
import com.ujiuye.cus.bean.CustomerVo;

import java.util.List;

public interface CustomerService{
    List<Customer> showInfo(CustomerVo customerVo);

    boolean batchDelete(Integer[] cid);

    Customer getOneByPk(Integer pk);

    boolean updateCus(Customer customer);
}
