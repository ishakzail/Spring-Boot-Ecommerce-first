package com.demo.tags;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.models.Category;
import com.demo.services.CategoryService;

public class CategoryListTag extends RequestContextAwareTag{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private CategoryService categoryService;
	
	@Override
	protected int doStartTagInternal() throws Exception {
		if(categoryService == null) {
			WebApplicationContext webApplicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = webApplicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		JspWriter writer = pageContext.getOut();
		try {
			writer.write("<div class=\"hero__categories\">");
			List<Category> categories = categoryService.findParentCatgoriesWithStatus(true);
			
			if(categories != null) {
				for(Category category : categories) {
					writer.write("<div class=\"hero__categories__all\"><i class=\"fa fa-bars\"></i><span> " + category.getName()  + " </span>");
					writer.write("</div>");
					if(!category.getCategories().isEmpty()) {
						writer.write("<ul>");
						for(Category subCategory : category.getCategories()) {
							writer.write("<li><a href='" + pageContext.getServletContext().getContextPath() + "/product/category/"+ subCategory.getId()	+"'> " + subCategory.getName() + " </a></li>");
						}
						writer.write("</ul>");
					}
					
				}
			}
			
			writer.write("</div>");
		} catch (Exception e) {
			try {
				writer.write(e.getMessage());
			} catch (IOException e1) {
			}
		}
	}

	

}
