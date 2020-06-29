package com.demo.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Product;
import com.demo.repositories.ProductRepository;

@Transactional
@Service("productService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public Iterable<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Product save(Product product) {
		return productRepository.save(product);
	}

	@Override
	public void delete(int id) {
		productRepository.deleteById(id);
	}

	@Override
	public Product find(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public List<Product> latestProducts(boolean status, int n) {
		return productRepository.latestProducts(status, n);
	}

	@Override
	public List<Product> featuredProducts(boolean featured, boolean status, int n) {
		return productRepository.featuredProducts(featured,status, n);
	}

	@Override
	public List<Product> relatedProducts(boolean status, int categoryId, int id, int n) {
		return productRepository.relatedProducts(categoryId, status, id, n);
	}

}
