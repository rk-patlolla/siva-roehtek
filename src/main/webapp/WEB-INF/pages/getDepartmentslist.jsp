<%@include file="header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Departments Records</title>
</head>

<br>
<br>
<br>
<body bgcolor="">

	<div align="center">
		<table border="1" cellpadding="5">
			<caption>
				<h2>List of Departments</h2>
			</caption>
			<tr>

				<th>Department_ID</th>

				<th>Department_Name</th>
				<th>createdDate</th>
				<th>Delete</th>


			</tr>
			<c:forEach var="department" items="${departmentList}">
				<tr>

					<td><c:out value="${department.did}" /></td>

					<td><c:out value="${department.dname}" /></td>
					<td><fmt:formatDate value="${department.createDate}"
							pattern="yy-MMM-dd" /></td>


					<td><a
						href="<c:url value='/deleteDepartment/${department.did}' />"><font
							color="red">Delete</font></a></td>
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