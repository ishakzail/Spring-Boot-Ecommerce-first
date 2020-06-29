package com.demo.services;

import java.util.List;

import com.demo.models.Product;

public interface ProductService {
	
	public Iterable<Product> findAll();
	
	public Product save(Product product);
	
	public void delete(int id);
	
	public Product find(int id);
	
	public List<Product> latestProducts(boolean status , int n);
	
	public List<Product> featuredProducts( boolean featured, boolean status , int n);
	
	public List<Product> relatedProducts(boolean status, int categoryId , int id , int n);
}
