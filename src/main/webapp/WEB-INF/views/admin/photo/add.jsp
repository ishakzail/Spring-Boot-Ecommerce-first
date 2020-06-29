<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new Photo to ${product.name }</title>
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
						
										<h2 class="panel-title">Add Photo to ${product.name }</h2>
									</header>
									<div class="panel-body">
										<s:form method="post" modelAttribute="photo" enctype="multipart/form-data"
											action="${pageContext.request.contextPath}/admin/photo/add">
						
											
											<div class="form-group">
												<label>File</label>
												<div class="col-md-6">
													<input type="file" name="file" />
												</div>
											</div>
											
											
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">Main</label>
												<div class="col-md-6">
													<s:checkbox path="main"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputRounded">Status</label>
												<div class="col-md-6">
													<s:checkbox path="status"/>
												</div>
											</div>
											
											
											
											
											
											<div class="col-md-3 control-label">
												
													<button type="submit" class="btn btn-primary"> Save </button>
													<s:hidden path="product.id"/>
													
											</div>
											
											
											
										</s:form>
									</div>
								</section>
						
								
						
							</div>
			</div>

</body>
</html>