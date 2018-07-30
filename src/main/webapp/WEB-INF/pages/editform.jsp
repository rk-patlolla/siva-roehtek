<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form</title>
</head>
<style>
.error {
	color: #ff0000;
	font-style: italic;
	font-weight: bold;
}

a:link {
	font-family: Arial;
	color: red;
	text-decoration: none
}
</style>

<body>
	<div align="center">
		<h2>Update employeeDetails</h2>
		<table border="0" width="90%">
			<form:form modelAttribute="Employee" action="/updateEmployee">
				<tr>
					<td align="left" width="40%"><form:input type="hidden"
							path="eid" size="30" value="${editEmployee.eid}" /></td>
					<td align="left"><form:errors path="eid" cssClass="error" /></td>
				</tr>
				<tr>
					<td align="left" width="40%"><form:input type="hidden"
							path="department" size="30" value="${editEmployee.department.did}" /></td>
					<td align="left"><form:errors path="department" cssClass="error" /></td>
				</tr>
				<tr>
					<td align="left" width="40%"><form:input type="hidden"
							path="department" size="30" value="${editEmployee.department.dname}" /></td>
					<td align="left"><form:errors path="department" cssClass="error" /></td>
				</tr>
				<tr>
					<td align="left" width="20%">Name:</td>
					<td align="left" width="40%"><form:input path="ename"
							size="30" value="${editEmployee.ename}" /></td>
					<td align="left"><form:errors path="ename" cssClass="error" /></td>
				</tr>

				<tr>
					<td>Email:</td>
					<td><form:input path="email" size="30"
							value="${editEmployee.email}" /></td>
					<td><form:errors path="email" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><form:input path="eaddress" size="30"
							value="${editEmployee.eaddress}" /></td>
					<td><form:errors path="eaddress" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Mobile:</td>
					<td><form:input path="mobile" size="30"
							value="${editEmployee.mobile}" /></td>
					<td><form:errors path="mobile" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
					<td align="center"><input type="submit" value="Update" /></td>
					<td></td>
				</tr>
			</form:form>
		</table>
		<a href="mainHome">Back to Index</a>
	</div>
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
</body>
</html>
<%@include file="footer.jsp" %>