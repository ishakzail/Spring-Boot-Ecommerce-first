<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit category</title>
</head>
<body>
<header class="page-header">
						<h2>Edit Category</h2>
					
	</header>

	<div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>
						
										<h2 class="panel-title">Edit</h2>
									</header>
									<div class="panel-body">
										<s:form method="post" modelAttribute="category" action="${pageContext.request.contextPath}/admin/category/edit">
						
											
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
											
											
											<button type="submit" class="btn btn-primary"> Update </button>
											<s:hidden path="id" />
											
										</s:form>
									</div>
								</section>
						
								
						
							</div>
			</div>

</body>
</html>