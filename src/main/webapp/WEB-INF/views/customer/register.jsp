<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
	<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
   
 <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>REGISTER</h2>
                    </div>
                </div>
            </div>
            ${err }
            <s:form action="${pageContext.request.contextPath }/customer/register" method="post" modelAttribute="customer">
                <div class="row">
                    <div class="col-md-6  text-center" style="margin-left: 290px">
                        	<s:input type="text" placeholder="username" name="username" path="username"  required="required"/>
                         	<s:input type="text" placeholder="email" name="email" path="email" required="required" />
                          	<s:input type="text" placeholder="full name" name="fullName" path="fullName" required="required"/>
                         	<s:password  placeholder="Password" name="password" path="password" required="required"/>
                         	<s:input type="textarea" placeholder="address" name="address" path="address" required="required"/>
                          	<s:input type="text" placeholder="phone" name="phone" path="phone" required="required"/>
                       
                    </div>
	                   
                    
                    <div class="col-lg-12 text-center">
                      
                        <button type="submit" class="site-btn">REGISTER</button>
                        
                    </div>
                </div>
            </s:form>
        </div>
   </div>