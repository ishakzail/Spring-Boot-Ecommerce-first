package com.demo.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Category;
import com.demo.repositories.CategoryRepository;

@Transactional
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public Iterable<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public List<Category> findParentCategories() {
		return categoryRepository.findParentCategories();
	}

	@Override
	public Category save(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public void delete(int id) {
		 categoryRepository.deleteById(id);
	}

	@Override
	public Category findById(int id) {
		return categoryRepository.findById(id).get();
	}

	@Override
	public List<Category> findParentCatgoriesWithStatus(boolean status) {
		return categoryRepository.findParentCatgoriesWithStatus(status);
	}

	@Override
	public Category find(int id) {
		return categoryRepository.findById(id).get();
	}
	
	

}
