package com.demo.controllers.user;

import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Category;
import com.demo.models.Product;
import com.demo.services.CategoryService;
import com.demo.services.ProductService;

@Controller
@RequestMapping(value= "/product")
public class ProductsController {
	
	@Autowired
	private ProductService productService;
	
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value="details/{id}" , method = RequestMethod.GET)
	public String details(@PathVariable("id") int id,ModelMap modelMap) {
		Product product = productService.find(id) ;
		modelMap.put("product", product);
		modelMap.put("photos", product.getPhotos().stream().filter(p-> p.isStatus()).collect(Collectors.toList()));
		modelMap.put("relatedProducts", productService.relatedProducts(true, product.getCategory().getId(), product.getId(), 4));
		return "product.details";
	}
	
	@RequestMapping(value="category/{id}" , method = RequestMethod.GET)
	public String category(@PathVariable("id") int id, 	ModelMap modelMap) {
		Category category = categoryService.find(id);
		modelMap.put("category", category );
		return "product.category";
	}
	
	@RequestMapping(value="search" , method = RequestMethod.POST)
	public String search(@RequestParam("keyword") String keyword , HttpServletRequest request  , ModelMap modelMap) {
		Product product =  (Product) productService.search(true, keyword);  
		return "product.search";
	}

}
