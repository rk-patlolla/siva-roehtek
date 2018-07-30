<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.page {
	height: 250px;
	width: 1350px;
	background-color: #e3eaf7;
	margin-left: 50px;
	margin-right: 50px;
}
</style>

</head>
<body bgcolor="#e3eaf7">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="page">
		<div class="container">
			<h1>Login Form</h1>
			<form method="POST" action="login" class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">Name:</label>
					<div class="col-sm-10">
						<input name="ename" type="text" class="form-control" id="pwd" />

					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">Password:</label>
					<div class="col-sm-10">
						<input name="password" type="password" class="form-control" id="pwd" />
						

					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<input name="admin" type="hidden" value="ADMIN" class="form-control" id="pwd" />
						

					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Submit</button>

					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"    value="${_csrf.token}" />


			</form>
		</div>
	</div>