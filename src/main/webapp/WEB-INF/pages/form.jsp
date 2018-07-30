<%@include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Creating Department</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>




</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
	<c:if test="${not empty unique}">
			<div align="center"
				style="color: red; font-weight: bold; font-size: 15px;">
				<spring:message code="unique" />
			</div>
		</c:if>
		<h2>Add new Employee</h2>
		<form:form class="form-horizontal" modelAttribute="Employee"
			action="employeeInsert" method="POST">
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">DepartmentID:</label>
				<div class="col-sm-10">
					<form:select id="selectedRecord" class="form-control"
						path="department">
						<c:forEach var="departmentList" items="${departments}">


							<option value="${departmentList.did}">${departmentList.dname}</option>

						</c:forEach>
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Name:</label>
				<div class="col-sm-10">
					<input type="text" required class="form-control" id="ename"
						placeholder="Enter Name" name="ename" pattern="[A-Za-z]+"
						title="Enter Alphabet">
					
					<form:errors path="ename" class="error"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password:</label>
				<div class="col-sm-10">
					<input type="text" required class="form-control" id="pwd"
						placeholder="Enter Password" name="password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Email:</label>
				<div class="col-sm-10">
					<input type="email" required class="form-control" id="pwd"
						placeholder="Enter Email" name="email">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Address:</label>
				<div class="col-sm-10">
					<input type="text" required class="form-control" id="pwd"
						placeholder="Enter Address" name="eaddress">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Mobile:</label>
				<div class="col-sm-10">
					<input type="text" required pattern="[0-9]{10}"
						title="10 digit mobile number" class="form-control" id="pwd"
						placeholder="Enter Mobile" name="mobile">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Role:</label>
				<div class="col-sm-10">
					<input type="text" required class="form-control" id="pwd"
						placeholder="Enter Role" name="role">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Insert</button>
					<a href="mainHome">Back to Index</a>
				</div>
			</div>
		</form:form>
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
</body>
</html>

<%@include file="footer.jsp"%>
