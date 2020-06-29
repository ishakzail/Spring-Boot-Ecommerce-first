package com.demo.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.models.Category;
import com.demo.models.Product;
import com.demo.services.CategoryService;
import com.demo.services.ProductService;

@Controller
@RequestMapping("admin/product")
public class ProductController {
	
		@Autowired
		private ProductService productService;
		
		@Autowired
		private CategoryService catgoryService;
		
		@RequestMapping(method = RequestMethod.GET)
		public String index(ModelMap modelMap) {
			modelMap.put("products", productService.findAll());
			return "admin.product.index";
		}
		
		@RequestMapping(value="add",method = RequestMethod.GET)
		public String add(ModelMap modelMap) {
			Product product = new Product();
			product.setStatus(true);
			modelMap.put("product", product);
			modelMap.put("categories",catgoryService.findParentCategories());
			return "admin.product.add";
		}
		
		
		@RequestMapping(value="add",method = RequestMethod.POST)
		public String add(@ModelAttribute("product") Product product , ModelMap modelMap) {
			productService.save(product);
			return "redirect:/admin/product";
		}
		
		
		@RequestMapping(value="delete/{id}",method = RequestMethod.GET)
		public String delete(@PathVariable("id") int id, RedirectAttributes redirectAttribute) {
			try {
				productService.delete(id);
			} catch (Exception e) {
				redirectAttribute.addFlashAttribute("error" , "Deleted Failed");
				
			}
			 return "redirect:/admin/product";
		}
		
		
		@RequestMapping(value="edit/{id}",method = RequestMethod.GET)
		public String edit(@PathVariable("id") int id , ModelMap modelMap) {
			 modelMap.put("product", productService.find(id));
			 modelMap.put("categories",catgoryService.findParentCategories());
			 return "admin.product.edit";
		}
		
		@RequestMapping(value="edit",method = RequestMethod.POST)
		public String edit(@ModelAttribute("product") Product product) {
			productService.save(product);
			return "redirect:/admin/product";
		}
		

}
