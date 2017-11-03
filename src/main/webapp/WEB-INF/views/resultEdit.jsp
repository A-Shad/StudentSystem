<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
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
		<h1>Course : "${result.course.courseName}"</h1>
		<p>This information will be saved under the User "${userName}"</p>
		<br> <br>
		<form:form action="edit" method="post" commandName="edit_result">
			<div class="form-group row">
			 <div class="col-xs-5">
					<label for="coursename">Course Name</label> 
				<form:select class="form-control" id="courseId" path="course.courseName">
						<form:option value="${result.course.courseId}">${result.course.courseName}</form:option>
				</form:select>

				<label for="firstname">First Name</label> 
				<form:select  class="form-control" id="studentId" path="student.firstName">
						<form:option value="${result.student.studentId}">${result.student.firstName}</form:option>
				</form:select>

				<label for="lastname">Last Name</label> 
				<form:select  class="form-control" id="lastname" path="student.lastName">
						<form:option value="${result.student.lastName}">${result.student.lastName}</form:option>
				</form:select>
			</div>	
				<div class="col-xs-5">

				<div class="col-xs-5">
					<label for="semester">Semester</label> 
				<form:input class="form-control"
						id="semester" path="semester" type="text"
						value="${result.semester}" />
				</div>

				<div class="col-xs-5">
					<label for="year">Year</label> 
				<form:input class="form-control"
						id="year" path="year" type="text" value="${result.year}" />
				</div>

				<div class="col-xs-5">
					<label for="examMidterm">Mid-Term</label> 
				<form:input
						class="form-control" id="examMidterm" path="examMidterm"
						type="text" value="${result.examMidterm}" />
				</div>

				<div class="col-xs-5">
					<label for="examFinal">Final</label> 
				<form:input class="form-control"
						id="examFinal" path="examFinal" type="text"
						value="${result.examFinal}" />
				</div>
				<input type="hidden" name="action" value="edit"> 
				<input 	type="hidden" name="resultId" value="${result.resultId}"> 

				<input type="hidden" name="userName" value="${userName}">

				<h4 class="col-xs-6 form-control"></h4>
				<div class="col-xs-5">
					<input class="form-control" type="submit" value="Submit">
				</div>

				<div class="col-xs-5">
					<input class="form-control" type="reset" value="Reset">
				</div>
			<!-- FIX: Missing end div tag -->
			</div>
		</form:form>
	</div>
</body>
</html>