<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="jquery-3.3.1.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
.textWidth {
	width: 430px;
}
.error {
    color: #ff0000;
    font-weight: bold;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#ename").keyup(function(){
			var groupName=$(this).val();
			//alert(groupName);
			if(groupName.length>=3){
				$.ajax({
					type:"post",
					url: "${pageContext.request.contextPath}/checkEmpName",
					data:"ename="+ename,
					success:function(response){	
						if(response=="available"){
							//alert("inside if: "+response);
						$('#empNameTest').html("Employee Name Already Exists!");
						}else{
							//alert("inside else: "+response);
						$('#empNameTest').html("Available");
						}
					},
					error:function(err){
						$('#empNameTest').html("ERROR");
						alert(err);
					}
				});
				
			}
			
		})
	});

	function validate() {

		if ($('#ename').val() == "" || $('#ename').val() == null) {

			alert("Please Enter Group Name");
			$("#ename").focus();

			return false;
		}
	}

</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div align="center">
		<form:form action="/checkemployee" method="POST" modelAttribute="Employee">
			<div align="center"
				style="margin-top: 140px; font-weight: bold; color: cornflowerblue;">
				<h3>Employee FORM</h3>
			</div>
			<div class="form-group">
				<label for="ename">Enter Employee Name</label>
				<form:input path="ename" class="form-control textWidth"
					id="ename" placeholder="Enter Employee name" style="width: 300px;" />
				<div class="form-group" id="groupNameTest" style="color:red;"></div>
				<form:errors path="ename" class="error"></form:errors>
			</div>
			
			<form:button type="submit" class="btn btn-default"
				onclick="return validate();">Submit</form:button>
		</form:form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>