<%@include file="header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Employee Records</title>
</head>
<style>
a:link {
	font-family: Arial;
	text-decoration: none
}
</style>

<body bgcolor="">
<br>
<br>
<sec:authorize access="isAuthenticated()">
		<div
			style="font-weight: bold; font-size: 15px; margin-left: 100px; color: cornflowerblue;">
			<b>userName <sec:authentication property="principal.username" /></b>
		</div>
	</sec:authorize>
	
	<br>
	<div align="center">

		<table border="1" cellpadding="5">
			<caption>
				<h2>List of Employees</h2>
				
				
			</caption>
			<tr>
				<th>Employee_ID</th>
				<th>Department_ID</th>
				<th>Employee_Name</th>
				<th>Department_Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Address</th>
				<th>Role</th>
				<th>createdDate</th>

				<th>Edit/Update</th>
				<th>Delete</th>

			</tr>
			<c:forEach var="employee" items="${list}">
				<tr>
					<td><c:out value="${employee.eid}" /></td>
					<td><c:out value="${employee.department.did}" /></td>
					<td><c:out value="${employee.ename}" /></td>
					<td><c:out value="${employee.department.dname}" /></td>
					<td><c:out value="${employee.email}" /></td>
					<td><c:out value="${employee.mobile}" /></td>
					<td><c:out value="${employee.eaddress}" /></td>
					<td><c:out value="${employee.role}" /></td>
					<td><fmt:formatDate value="${employee.createDate}"
							pattern="yy-MMM-dd" /></td>
					<td><a href="<c:url value='/getById/${employee.eid}' />"><font
							color="green">Edit/Update</font></a></td>
					<td>
					<form:form  id="product_${employee.eid}" name="product_${employee.eid}" style="display:none;" action="/delete/${employee.eid}">
					</form:form>
					
					<sec:authorize access="hasRole('ADMIN')"><a href="#"	onclick="if (confirm('Are you sure you want to delete ${employee.eid}')) { document.product_${employee.eid}.submit();} event.returnValue = false; return false;">
							<button class="btn btn-danger" type="submit"><i class="icon-remove-circle icon-white"></i> Delete</button>
						</a>
					</sec:authorize>
					
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<center>
		<a href="mainHome">Back to Index</a>
	</center>
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
<%@include file="footer.jsp"%>