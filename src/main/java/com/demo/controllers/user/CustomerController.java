package com.demo.controllers.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.models.Account;
import com.demo.models.Role;
import com.demo.services.AccountService;

@Controller
@RequestMapping(value= "/customer")
public class CustomerController {
	
	@Autowired
	private AccountService accountService;
		
	@RequestMapping(value="register" , method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("customer", new Account());
		return "customer.register";
	}
	
	@RequestMapping(value="register" , method = RequestMethod.POST)
	public String register(@ModelAttribute("customer") Account account ,  ModelMap modelMap) {
		try {
			String hashPass = new BCryptPasswordEncoder().encode(account.getPassword());
			account.setPassword(hashPass);
			account.setStatus(true);
			account.setRole(new Role(3));
			accountService.save(account);
			return "redirect:/customer-panel/login";
		} catch (Exception e) {
			modelMap.put("err", e.getMessage());
			return "customer.register";
		}
	}
	
	@RequestMapping(value="dashboard" , method = RequestMethod.GET)
	public String dashboard(ModelMap modelMap) {
		
		return "customer.dashboard";
	}

}
