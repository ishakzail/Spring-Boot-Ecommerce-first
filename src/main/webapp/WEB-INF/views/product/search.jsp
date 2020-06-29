<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <%@ taglib prefix="tg" uri="WEB-INF/tags"  %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
    
    

		<section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/user/img/breadcrumb.jpg">
		        <div class="container">
		            <div class="row">
		                <div class="col-lg-12 text-center">
		                    <div class="breadcrumb__text">
		                        <h2>Organi Shop</h2>
		                        <div class="breadcrumb__option">
		                            <a href="${pageContext.request.contextPath}/home">Home</a>
		                            <span>Shop</span>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>
    
      <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                   
                </div>
                <div class="col-lg-9 col-md-7">
                   
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>${category.products.size() }</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                   <c:forEach var="product" items="${ category.products}">
                             <c:set var="image" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }" ></c:set> 
                               
                        <div class="col-lg-4 col-md-6 col-sm-6">
                        
                            <div class="product__item">
                              	<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/uploads/images/${image.name}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${pageContext.request.contextPath}/product/details/${product.id}">${product.name }</a></h6>
                                    <h5>${product.price } Dh</h5>
                                </div>
                        
                            </div>
                            
                        </div>
                       	</c:forEach>
                       
                    </div>
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>