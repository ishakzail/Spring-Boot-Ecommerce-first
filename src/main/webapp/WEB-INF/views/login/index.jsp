<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>


 <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>LOGIN</h2>
                    </div>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/customer/process-login" method="post">
                <div class="row">
                    <div class="col-md-6  text-center" style="margin-left: 290px">
                        <input type="text" placeholder="Username" name="username" path="username">
                         <input type="password" placeholder="Password" name="password" path="password">
                       
                    </div>
                    <div class="col-md-6  text-center" style="margin-left: 290px">
                    	<a href="${pageContext.request.contextPath}/customer/register"> Register </a>
                    </div>
                    
                    <div class="col-lg-12 text-center">
                      
                        <button type="submit" class="site-btn">LOGIN</button>
                        
                    </div>
                </div>
            </form>
        </div>
   </div>