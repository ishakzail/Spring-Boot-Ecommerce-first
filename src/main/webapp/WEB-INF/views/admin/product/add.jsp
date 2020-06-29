<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new Product</title>
</head>
<body>

	<div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>
						
										<h2 class="panel-title">Add new </h2>
									</header>
									<div class="panel-body">
										<s:form method="post" modelAttribute="product" action="${pageContext.request.contextPath}/admin/product/add">
						
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">Name</label>
												<div class="col-md-6">
													<s:input type="text"  class="form-control input-rounded" id="name" path="name" required="required"/>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">Price</label>
												<div class="col-md-6">
													<s:input type="number" min="0" class="form-control input-rounded" id="price" path="price" required="required"/>
												</div>
											</div>
											
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">Quantity</label>
												<div class="col-md-6">
													<s:input type="number" min="0" class="form-control input-rounded" id="quantity" path="quantity" required="required"/>
												</div>
											</div>
											
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">Description</label>
												<div class="col-md-6">
													<s:textarea	 class="form-control input-rounded" id="description" path="description" required="required"/>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">Details</label>
												<div class="col-md-6">
													<s:textarea	 class="form-control input-rounded" id="details" path="details" required="required"/>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">Category</label>
												<div class="col-md-6">
													
													<s:select path="category.id" class="form-control mb-md">
														<c:forEach var="category" items="${categories }">
															<optgroup label="${category.name }"></optgroup>
															<c:if test="${!category.categories.isEmpty() }">
																<c:forEach var="subCategory" items="${category.categories }">
																	<option value="${subCategory.id }"> ${subCategory.name } </option>
																</c:forEach>
															</c:if>
														</c:forEach>
													</s:select>
													
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">Status</label>
												<div class="col-md-6">
													<s:checkbox path="status"/>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">  Featured</label>
												<div class="col-md-6">
													<s:checkbox path="featured"/>
												</div>
											</div>
											
											<div class="col-md-3 control-label">
													<button type="submit" class="btn btn-primary"> Save </button>
											</div>
											
											
											
										</s:form>
									</div>
								</section>
						
								
						
							</div>
			</div>

</body>
</html>