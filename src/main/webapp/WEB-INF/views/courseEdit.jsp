<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- FIX: Change to spring location -->
<link rel="stylesheet"
	href="<c:url value="/resources/styles/registrationForm.css" />">

</head>
<body>
	<div class="container">
		<h1>Course Form</h1>
		<br> <br>
		<form:form action="edit" method="post" commandName="edit_course">
			<div class="form-group row">
				<div class="col-xs-5">
					<label for="courseNameInput">Course Name</label> 
			<form:input class="form-control" id="courseNameInput" path="courseName" type="text" value="${course.courseName}"/>
				</div>
				<div class="col-xs-5">
					<label for="description">Course Description</label> 
			<form:input	class="form-control" id="descriptionInput" path="courseDescription" type="text" value="${course.courseDescription}" />
				</div>
			<!-- Missing div end tag -->
			</div>


			<input type="hidden" name="courseId" value="${course.courseId}">

			<h4 class="col-xs-6 form-control"></h4>
			<div class="col-xs-5">
				<input class="form-control" type="submit" value="Submit">
			</div>

			<div class="col-xs-5">
				<input class="form-control" type="reset" value="Reset">
			</div>

		</form:form>
	</div>
</body>
</html>