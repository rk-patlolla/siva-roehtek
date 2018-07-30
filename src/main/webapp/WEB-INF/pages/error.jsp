<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
a:link {
	font-family: Arial;
	color: red;
	text-decoration: none
}
</style>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<center>
		<h3>First delete record from child table Employee</h3>
		<c:if test="${not empty error}">
			<div align="center"
				style="color: red; font-weight: bold; font-size: 15px;">
				<spring:message code="error" />
			</div>
		</c:if>
		<br>
		<br> <a href="getDepartmentslist">Back</a>
	</center>
</body>
</html>
