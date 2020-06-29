package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Account;
import com.demo.repositories.AccountRepository; 

@Service("accountService")
public class AccountServiceImpl implements AccountService{
	
	@Autowired 
	private AccountRepository accountRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountRepository.findByUsername(username);
		if(account == null) {
			throw new UsernameNotFoundException("Username not found for :" + username);
		}
		List<GrantedAuthority> grantedAutorities = new ArrayList<GrantedAuthority>();
		grantedAutorities.add(new SimpleGrantedAuthority(account.getRole().getName())); 
			
		return new User(account.getUsername(),account.getPassword() ,grantedAutorities );
		
	}

}
