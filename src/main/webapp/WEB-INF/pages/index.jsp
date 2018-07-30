<%@include file="header.jsp"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<body>
	<style>
a:link {
	font-family: Arial;
	text-decoration: none
}
</style>
</head>  
<body>  
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div style="padding-left: 20px">
		<c:if test="${not empty department}">
			<div align="center"
				style="color: green; font-weight: bold; font-size: 15px;">
				<spring:message code="department.success" />
			</div>
		</c:if>

		<c:if test="${not empty employee}">
			<div align="center"
				style="color: green; font-weight: bold; font-size: 15px;">
				<spring:message code="employee.update" />
			</div>
		</c:if>
		<center>
			<h1>Welcome to rohTek</h1>

			<b> <a href="departmentform">Add Departments</a><br> <br>
				<a href="empform">Add Employee</a><br> <br> <a
				href="getlist">Get employeeList</a><br> <br> <a
				href="getDepartmentslist">view Departments</a><br>
			</b>
	</div>
</body>
</html>
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
<br>
<br>
<br>
<br>
<br>
<br>

<%@include file="footer.jsp"%>