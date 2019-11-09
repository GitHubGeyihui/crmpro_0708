package com.ujiuye.cus.service;

import com.ujiuye.cus.bean.Customer;
import com.ujiuye.cus.bean.CustomerVo;
import com.ujiuye.cus.mapper.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerMapper customerMapper;

    @Override
    public List<Customer> showInfo(CustomerVo customerVo) {
        return customerMapper.showInfo(customerVo);
    }


    @Override
    public boolean batchDelete(Integer[] cid) {
        return customerMapper.batchDelete(cid) > 0;
    }

    @Override
    public Customer getOneByPk(Integer pk) {
        return customerMapper.selectByPrimaryKey(pk);
    }

    @Override
    public boolean updateCus(Customer customer) {
        boolean flag = false;
        if (customer.getId() != null) {
            flag = customerMapper.updateByPrimaryKey(customer) > 0;
        } else {
            flag = customerMapper.insert(customer) > 0;
        }
        return flag;
    }
}
