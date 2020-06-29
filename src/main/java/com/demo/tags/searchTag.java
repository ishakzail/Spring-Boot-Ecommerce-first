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
import com.demo.services.ProductService;

public class searchTag extends RequestContextAwareTag{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Override
	protected int doStartTagInternal() throws Exception {
		if(categoryService == null || productService == null) {
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
			writer.write("<div class=\"hero__search\">\r\n" + 
					"                        <div class=\"hero__search__form\">\r\n" + 
					"                            <form action=\"#\">\r\n" + 
					"                                <div class=\"hero__search__categories\">\r\n" + 
					"                                    All Categories\r\n" + 
					"                                    <span class=\"arrow_carrot-down\"></span>\r\n" + 
					"                                </div>\r\n" + 
					"                                <input type=\"text\" placeholder=\"What do yo u need?\">\r\n" + 
					"                                <button type=\"submit\" class=\"site-btn\">SEARCH</button>\r\n" + 
					"                            </form>\r\n" + 
					"                        </div>\r\n" + 
					"                        <div class=\"hero__search__phone\">\r\n" + 
					"                            <div class=\"hero__search__phone__icon\">\r\n" + 
					"                                <i class=\"fa fa-phone\"></i>\r\n" + 
					"                            </div>\r\n" + 
					"                          \r\n" + 
					"                        </div>\r\n" + 
					"                    </div>\r\n" + 
					"                ");
		} catch (Exception e) {
			try {
				writer.write(e.getMessage());
			} catch (IOException e1) {
			}
		}
	}

	

}
