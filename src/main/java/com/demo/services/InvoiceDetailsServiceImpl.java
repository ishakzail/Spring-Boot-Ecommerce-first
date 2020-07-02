package com.demo.services;



import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.demo.models.InvoiceDetails;
import com.demo.repositories.InvoiceDetailsRepository;



@Transactional
@Service("InvoiceDetailsService")
public class InvoiceDetailsServiceImpl implements InvoiceDetailsService {

	@Autowired
	private InvoiceDetailsRepository invoiceDetailsRepository;

	@Override
	public InvoiceDetails save(InvoiceDetails invoiceDetails) {
		return invoiceDetailsRepository.save(invoiceDetails);
	}
	
	
	
	

}
