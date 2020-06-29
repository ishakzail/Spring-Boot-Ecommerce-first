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
import com.demo.services.CategoryService;

@Controller
@RequestMapping("admin/category")
public class CategoryController {
	
		@Autowired
		private CategoryService categoryService;
		
		@RequestMapping(method = RequestMethod.GET)
		public String index(ModelMap modelMap) {
			modelMap.put("categories" , categoryService.findParentCategories());
			return "admin.category.index";
		}
		
		@RequestMapping(value="add",method = RequestMethod.GET)
		public String add(ModelMap modelMap) {
			 Category category = new Category();
			 category.setStatus(true);
			modelMap.put("category" , category );
			return "admin.category.add";
		}
		
		@RequestMapping(value="add",method = RequestMethod.POST)
		public String add(@ModelAttribute("category") Category category ) {
			category.setCategory(null);
			categoryService.save(category);
			return "redirect:/admin/category";
		}
		
		@RequestMapping(value="delete/{id}",method = RequestMethod.GET)
		public String delete(@PathVariable("id") int id , RedirectAttributes redirectAttribute) {
			 try {
				 categoryService.delete(id);
			} catch (Exception e) {
				redirectAttribute.addFlashAttribute("error" , "Deleted Failed");
				
			}
			 return "redirect:/admin/category";
		}
		
		@RequestMapping(value="edit/{id}",method = RequestMethod.GET)
		public String edit(@PathVariable("id") int id , ModelMap modelMap) {
			 modelMap.put("category", categoryService.findById(id));
			 return "admin.category.edit";
		}
		
		@RequestMapping(value="edit",method = RequestMethod.POST)
		public String edit(@ModelAttribute("category") Category category) {
			categoryService.save(category);
			return "redirect:/admin/category";
		}
		
		@RequestMapping(value="subcategories/{id}",method = RequestMethod.GET)
		public String subcategories(@PathVariable("id") int id , ModelMap modelMap) {
			 modelMap.put("category", categoryService.findById(id));
			 return "admin.category.subcategories";
		}
		
		@RequestMapping(value="addSubcategory/{id}",method = RequestMethod.GET)
		public String addSubcategory(@PathVariable("id") int id , ModelMap modelMap) {
			Category category = new Category();
			category.setStatus(true);
			category.setCategory(categoryService.findById(id));
			 modelMap.put("category", category);
			 return "admin.category.addSubcategory";
		}
		
		@RequestMapping(value="addSubcategory",method = RequestMethod.POST)
		public String addSubcategory(@ModelAttribute("category") Category category) {
			categoryService.save(category);
			return "redirect:/admin/category/subcategories/" + category.getCategory().getId();
		}
		
		@RequestMapping(value="deletesubcategory/{id}",method = RequestMethod.GET)
		public String deletesubcategory(@PathVariable("id") int id , RedirectAttributes redirectAttribute) {
			Category category = categoryService.findById(id);
			 try {
				 categoryService.delete(id);
			} catch (Exception e) {
				redirectAttribute.addFlashAttribute("error" , "Deleted Failed");
				
			}
			 return "redirect:/admin/category/subcategories/" + category.getCategory().getId();
		}
		
		@RequestMapping(value="editsubcategory/{id}",method = RequestMethod.GET)
		public String editesubcategory(@PathVariable("id") int id , ModelMap modelMap) {
			modelMap.put("category", categoryService.findById(id));
			 return "admin.category.editSubcategory";
		}
		
		@RequestMapping(value="editSubcategory",method = RequestMethod.POST)
		public String editSubcategory(@ModelAttribute("category") Category category) {
			categoryService.save(category);
			return "redirect:/admin/category/subcategories/" + category.getCategory().getId();
		}
		

}
