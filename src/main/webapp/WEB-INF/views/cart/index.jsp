<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

    <section class="shoping-cart spad">
        <div class="container">
        	<form method="post" action="${pageContext.request.contextPath}/cart/update">
	            	<div class="row">
	                <div class="col-lg-12">
	                    <div class="shoping__cart__table">
	                        <table>
	                            <thead>
	                                <tr>
	                                    <th class="shoping__product">Products</th>
	                                    <th>Price</th>
	                                    <th>Quantity</th>
	                                    <th>Total</th>
	                                    <th></th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach var="item" items="${sessionScope.cart }" varStatus="i">
	                            <c:set var="photo" value="${item.product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }" ></c:set>
	                                <tr>
	                                    <td class="shoping__cart__item">
	                                        <img src="${pageContext.request.contextPath}/uploads/images/${photo.name}" alt="">
	                                        <h5>${item.product.name }</h5>
	                                    </td>
	                                    <td class="shoping__cart__price">
	                                       ${item.product.price } Dh 
	                                    </td>
	                                    <td class="shoping__cart__quantity">
	                                          <input style="width: 60px" type="number" name="quantities" value="${item.quantity }">
	                                     </td>
	                                    <td class="shoping__cart__total">
	                                        ${item.product.price * item.quantity} Dh
	                                    </td>
	                                    <td class="shoping__cart__item__close">
	                                    
	                                        <a  href="${pageContext.request.contextPath}/cart/remove/${i.index}"> <span class="icon_close" style="color: red"></span> </a>
	                                    
	                                    </td>
	                                </tr>
	                               </c:forEach>
	                      	    </tbody>
	                        </table>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="shoping__cart__btns">
	                        <a href="${pageContext.request.contextPath}/home" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
	                        <c:if test="${sessionScope.cart != null }">
	                         <input style="float: right" type="submit" value="Update" />
	                          </c:if>
	                    </div>
	                </div>
	                <div class="col-lg-6">
	                    <div class="shoping__continue">
	                        <div class="shoping__discount">
	                            <h5>Discount Codes</h5>
	                            <form action="#">
	                                <input type="text" placeholder="Enter your coupon code">
	                                <button type="submit" class="site-btn">APPLY COUPON</button>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-6">
	                    <div class="shoping__checkout">
	                        <h5>Cart Total</h5>
	                        <ul>
	                            
	                            <li>Total <span>${total } DH</span></li>
	                        </ul>
	                        <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
	                    </div>
	                </div>
	            </div>
            </form>
        </div>
    </section>
   