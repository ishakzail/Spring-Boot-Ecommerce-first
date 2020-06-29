<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

     <section class="product-details spad">
        <div class="container">
       
           
           
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                         <c:set var="image" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }" ></c:set> 
                            <img class="product__details__pic__item--large"
                                src="${pageContext.request.contextPath}/uploads/images/${image.name}" alt="">
                        </div>
	                    <div class="product__details__pic__slider owl-carousel">
		                      <c:forEach var="p" items="${photos }">
		                            <img data-imgbigurl="${pageContext.request.contextPath}/uploads/images/${p.name}"
		                                src="${pageContext.request.contextPath}/uploads/images/${p.name}" alt="">
		                      </c:forEach>
	                    </div>
                    </div>
                </div>
                
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${product.name }</h3>
                        
                        <div class="product__details__price">${product.price } Dh</div>
                        <p>${product.description }</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/cart/buy/${product.id}" class="primary-btn">ADD TO CARD</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            <li><b>Quantity </b> <span>${product.quantity }</span></li>
                            
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="false">Information</a>
                            </li>
                           
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>${product.details }</p>
                                </div>
                            </div>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach var="p" items="${relatedProducts }">
               
                <div class="col-lg-3 col-md-4 col-sm-6">
                <c:set var="photo" value="${p.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }" ></c:set>
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/uploads/images/${photo.name}">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="${pageContext.request.contextPath}/cart/buy/${p.id}"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="${pageContext.request.contextPath}/product/details/${p.id}">${p.name }</a></h6>
                            <h5>${p.price } Dh</h5>
                        </div>                     
                    </div>
                 
                </div>
                </c:forEach>
                
            </div>
        </div>
    </section>