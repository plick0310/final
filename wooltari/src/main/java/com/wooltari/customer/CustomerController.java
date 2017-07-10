package com.wooltari.customer;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("customer.customerController")
public class CustomerController {
	@Autowired
	private CustomerService service;
	
	@RequestMapping(value="/customer/notice", method=RequestMethod.GET)
	public String notice(){
		return "member/customer/list";
	}
}
