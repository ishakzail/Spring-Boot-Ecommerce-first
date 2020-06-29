package com.demo.tags;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.models.Category;
import com.demo.models.Item;
import com.demo.services.CategoryService;

public class CartTag extends RequestContextAwareTag{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private CategoryService categoryService;
	
	@Override
	protected int doStartTagInternal() throws Exception {
		
		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		JspWriter writer = pageContext.getOut();
		HttpSession session = pageContext.getSession();
		int countItems = 0;
		double total = 0 ;
		if(session.getAttribute("cart") != null) {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			countItems = cart.size();
			for(Item item :cart) {
				total += item.getProduct().getPrice() * item.getQuantity();
			}
		}
		try {
			writer.write("<div class=\"col-lg-3\">");
				writer.write("<div class=\"header__cart\">");
					writer.write("<ul>");
						writer.write("<li><a href='" + pageContext.getServletContext().getContextPath() + "/cart/index" + "'><i class=\"fa fa-shopping-bag\"></i> <span>" + countItems + "</span></a></li>");
						writer.write("<div class=\"header__cart__price\">item: <span>"+ total + "DH </span>");
						writer.write("</div>");
					writer.write("</ul>");
				writer.write("</div>");
			writer.write("</div>");
		} catch (Exception e) {
			try {
				writer.write(e.getMessage());
			} catch (IOException e1) {
			}
		}
	}

	

}
