<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


  <header class="page-header">
						<h2>Sub Categories List of ${category.name} Category</h2>
					
	</header>
	
	<section class="panel">
	
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
									<a href="#" class="fa fa-times"></a>
								</div>
						
								<h2 class="panel-title">Sub Categories</h2>
							</header>
							
							<div class="panel-body">
								<div class="row">
									<div class="col-sm-6">
										<div class="mb-md">
											<a href="${pageContext.request.contextPath}/admin/category/addSubcategory/${category.id}"> <button class="btn btn-primary">Add new Sub-category <i class="fa fa-plus"></i></button> </a>
										</div>
									</div>
								</div>
								<c:if test="${error != null }">
								
									<div class="alert alert-danger" role="alert">
										${error}
									</div>
									
								</c:if>
								<table class="table table-bordered table-striped mb-none" id="categoryList">
									<thead>
										<tr>
											<th>Id</th>
											<th>Name</th>
											<th>Status</th>
											<th>Actions</th>
											 
											
										</tr>
									</thead>
									<tbody>
										<c:forEach var="c" items="${category.categories}">
											<tr>
												<td>${c.id}</td>
												<td>${c.name}</td>
												<td>${c.status ? 'Show' : 'Hide'}</td>
												<td>
													<a href="${pageContext.request.contextPath}/admin/category/editsubcategory/${c.id}" >Edit</a>
														| 
													<a href="${pageContext.request.contextPath}/admin/category/deletesubcategory/${c.id}" onclick="return confirm('Are you sure ?')">Delete</a>
														 
												</td>
											</tr>
										</c:forEach>
										
									
										
									</tbody>
								</table>
							</div>
					
				</section>
						
<script src="${pageContext.request.contextPath}/assets/javascripts/tables/examples.datatables.editable.js"></script>