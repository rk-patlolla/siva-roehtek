<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
a:link {
	font-family: Arial;
	
	text-decoration: none
}
</style>
<%
	try {
		String msg = request.getAttribute("message").toString();

		if (msg != null) {

			out.println("<script>alert('Employee record inserted..........!')</script>");
		}
		String unique = request.getAttribute("unique").toString();

		if (unique != null) {

			out.println("<script>alert('Employee name should be unique....!')</script>");
		}
		
	} catch (Exception e) {

	}
%>

</head>

<body bgcolor="#e3eaf7">

	<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial;
}

.header {
	overflow: hidden;
	background-color: #777;
	padding: 20px 10px;
}

footer {
	background-color: #777;
	padding: 10px;
	text-align: center;
	color: white;
}

.header a {
	float: left;
	color: black;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}

.header a.logo {
	font-size: 25px;
	font-weight: bold;
}

.header a:hover {
	background-color: #ddd;
	color: black;
}

.header a.active {
	background-color: dodgerblue;
	color: white;
}

.header-right {
	float: right;
}

@media screen and (max-width: 500px) {
	.header a {
		float: none;
		display: block;
		text-align: left;
	}
	.header-right {
		float: none;
	}
}
</style>
</head>
<body>

	<div class="header">
		<a href="home" class="logo">ROHTEK</a>
		<div class="header-right">
			<!-- <a class="active" href="home">Home</a> --> <a class="active" href="departmentform">Add
				Departments</a> <a href="empform">Save Employees</a> <a href="getlist">Get
				employeesList</a> <a href="getDepartmentslist">Get Departments</a>
				<a href="logout">Logout</a>
		</div>
	</div>