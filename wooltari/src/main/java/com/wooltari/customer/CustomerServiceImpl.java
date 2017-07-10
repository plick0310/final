package com.wooltari.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("customer.customerService")
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	private CommonDAO dao;
	
	
}
