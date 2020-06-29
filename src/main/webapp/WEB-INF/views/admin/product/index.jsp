<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


  <header class="page-header">
						<h2>Product List</h2>
					
	</header>
	
	<section class="panel">
	
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
									<a href="#" class="fa fa-times"></a>
								</div>
						
								<h2 class="panel-title">Products</h2>
							</header>
							
							<div class="panel-body">
								<div class="row">
									<div class="col-sm-6">
										<div class="mb-md">
											<a href="${pageContext.request.contextPath}/admin/product/add"> <button class="btn btn-primary">Add new Product <i class="fa fa-plus"></i></button> </a>
										</div>
									</div>
								</div>
								<c:if test="${error != null }">
								
									<div class="alert alert-danger" role="alert">
										${error}
									</div>
									
								</c:if>
								<table class="table table-bordered table-striped mb-none" id="productList">
									<thead>
										<tr>
											<th>Id</th>
											<th>Name</th>
											<th>Price (DH)</th>
											<th>Category</th>
											<th>Featured</th>
											<th>Status</th>
											<th>Actions</th>
											 
											
										</tr>
									</thead>
									<tbody>
										<c:forEach var="product" items="${products}">
											<tr>
												<td>${product.id}</td>
												<td>${product.name}</td>
												<td>${product.price}</td>
												<td>${product.category.name}</td>
												<td>${product.featured ? "featured" : ""}</td>
												<td>${product.status ? 'Show' : 'Hide'}</td>
												<td>
													<a href="${pageContext.request.contextPath}/admin/product/edit/${product.id}" >Edit</a>
														| 
													<a href="${pageContext.request.contextPath}/admin/product/delete/${product.id}" onclick="return confirm('Are you sure ?')">Delete</a>
														|
													<a href="${pageContext.request.contextPath}/admin/photo/product/${product.id}" >Images</a>

														 
												</td>
											</tr>
										</c:forEach>
										
									
										
									</tbody>
								</table>
							</div>
					
				</section>
						
<script src="${pageContext.request.contextPath}/assets/javascripts/tables/examples.datatables.editable.js"></script>