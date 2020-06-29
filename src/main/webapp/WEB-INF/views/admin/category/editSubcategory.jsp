<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit new category</title>
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
						
										<h2 class="panel-title">Edit SubCategory of ${category.category.name}</h2>
									</header>
									<div class="panel-body">
										<s:form method="post" modelAttribute="category" action="${pageContext.request.contextPath}/admin/category/editSubcategory">
						
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">Name</label>
												<div class="col-md-6">
													<s:input type="text" class="form-control input-rounded" id="name" path="name" required="required"/>
												</div>
											</div>
											
											
											<div class="checkbox">
												<label class="col-md-3 control-label" for="inputRounded">  Status</label>
												<div class="col-md-6">
													<s:checkbox path="status"/>
												</div>
											</div>
											
											
											<button type="submit" class="btn btn-primary"> Save </button>
											<s:hidden path="category.id" />
											<s:hidden path="id" />
										</s:form>
									</div>
								</section>
							</div>
			</div>

</body>
</html>