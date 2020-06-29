package com.demo.services;

import java.util.List;



import com.demo.models.Category;

public interface CategoryService {
	
	public Iterable<Category> findAll();
	
	public Category find(int id);
	
	public List<Category> findParentCategories();
	
	public Category save(Category category);
	
	public void delete(int id);
	
	public Category findById(int id);
	
	public List<Category> findParentCatgoriesWithStatus( boolean status);
}
