<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

    
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                   
                </div>
            </div>
            <div class="row featured__filter">
           		<c:forEach var="product" items="${ featuredProducts }">
           		 <c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }" ></c:set>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/uploads/images/${photo.name}">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="${pageContext.request.contextPath}/product/details/${product.id}">${product.name}</a></h6>
	                            <h5>${product.price } (Dh)</h5>
	                        </div>
	                    </div>
	                </div>
               </c:forEach>
            </div>
       		
       		 <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Latest Product</h2>
                    </div>
                   
                </div>
            </div>
            <div class="row featured__filter">
            	<c:forEach var="product" items="${ latestProducts }">
                 <c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }" ></c:set>
                	<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                 
	                    <div class="featured__item">
	                   
	                        <div class="featured__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/uploads/images/${photo.name}">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="#">${product.name}</a></h6>
	                            <h5>${product.price} Dh <h5>
	                        </div>
	                    </div>
                    
                </div>
               </c:forEach>
            </div>
        
        </div>
    </section>
    
   