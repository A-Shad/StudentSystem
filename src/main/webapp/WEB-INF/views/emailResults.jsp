<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Email Results</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="styles/registrationForm.css">

</head>
<body>

	<div class="container">
		<h1><u>Email Results</u></h1>
		<h3>To: <i> ${result.student.firstName} ${result.student.lastName} </i></h3>
		<br> <br>
		<form action="email" method="post">
			<div class="form-group row">
				<div class="col-xs-7">
					<label for="courseList">Course Name</label> <select
						name="courseList" id="courseId">
 						<c:if test="${result.course.courseName != null}">
    						<option value="${result.course.courseName}" selected>${result.course.courseName}</option>
    					</c:if>  
						<c:forEach items="${courses}" var="course">
							<option value="${course.courseId}"><c:out
									value="${course.courseName}" /></option>
						</c:forEach>
					</select>
				</div>
				<div class="col-xs-2">
					<label for="semester">Semester</label><br> 
					  <c:if test="${result.semester == 1}" >
					    <input type="radio" 	name="semester" value="1" checked="checked" > January<br> 
					    <input type="radio" 	name="semester" value="2" disabled> September<br> 					    
					  </c:if>
					  <c:if test="${result.semester == 2}" >
					    <input type="radio" 	name="semester" value="1" disabled> January<br> 					  
					    <input type="radio" 	name="semester" value="2" checked="checked" > September<br> 
					  </c:if>
					  
					  <c:if test="${result.semester == null }" >
					    <input type="radio" 	name="semester" value="1"> January<br> 
					    <input type="radio" 	name="semester" value="2"> September<br> 					    
					  </c:if>
				</div>
				<div class="col-xs-2">
					<label for="year">Year</label><br> <select id="year"
						name="year">
 						<c:if test="${result.year != null}">
    						<option value="${result.year}" selected>${result.year}</option>
    					</c:if>  
 						<c:if test="${result.year == null}">						
							<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
							<c:forEach begin="0" end="10" var="val">
								<c:set var="decr" value="${year - val}" />
								<option value="${decr}">${decr}</option>
							</c:forEach>
						</c:if>
					</select>
				</div>

				<div class="w3-row w3-section">
					<div class="w3-col" style="width: 50px">
						<i class="w3-xxlarge fa fa-envelope-o"></i>
					</div>
					<div class="w3-rest">
						<label for="emailFrom" class="ui-hidden-accessible">E-mail From:</label> <input class="w3-input w3-border" type="emailFrom"
							name="emailFrom" id="emailFrom" value="${user.email}" disabled>
					</div>
					<div class="w3-rest">
						<label for="emailFrom" class="ui-hidden-accessible">To:</label> <input class="w3-input w3-border" type="emailFrom"
							name="emailFrom" id="emailTo" value="${resultemail.emailTo}" disabled>
					</div>
				</div>

				<div class="w3-row w3-section">
					<div class="w3-col" style="width: 50px">
						<i class="w3-xxlarge fa fa-header"></i>
					</div>
					<div class="w3-rest">
						<input class="w3-input w3-border" type="text" name="titleOfEmail" value="Course result, Montreal College of Information Technology"
							id="title" placeholder="E-mail title *" required>
					</div>
				</div>

				<div class="w3-row w3-section">
					<div class="w3-col" style="width: 50px">
						<i class="w3-xxlarge fa fa-pencil"></i>
					</div>
					<div class="w3-rest">
						<textarea name="bodyOfEmail" rows="20" id="inquiry" cols="80" 
							placeholder="Email body *" maxlength="10000" required></textarea>
					</div>
				</div>

  				<input type="hidden" name="emailTitle" value="${titleOfEmail}"> 
  				<input type="hidden" name="bodyOfEmail" value="${bodyOfEmail}"> 
  				<input type="hidden" name="emailFrom" value="${user.email}"> 
				<input type="hidden" name="firstName" value="${result.student.firstName}"> 
				<input type="hidden" name="lastName" value="${result.student.lastName}"> 
				<input type="hidden" name="courseName" value="${result.course.courseName}"> 
				<input type="hidden" name="courseId" value="${result.course.courseId}"> 
				<input type="hidden" name="resultId" value="${result.resultId}"> 
				<input type="hidden" name="studentId" value="${result.student.studentId}"> 
				<input type="hidden" name="emailTo" value="${resultemail.emailTo}"> 
				<input type="hidden" name="userName" value="${user.userName}">
				<input type="hidden" name="examMidterm" value="${result.examMidterm}">
				<input type="hidden" name="examFinal" value="${result.examFinal}">
				<input type="hidden" name="action" value="sendEmail"> 
				<h4 class="col-xs-6 form-control"></h4>
				<div class="col-xs-5">
					<input class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit" value="Submit">
				</div>

				<div class="col-xs-5">
					<input class="w3-button w3-block w3-section w3-yello w3-ripple w3-padding" type="reset" value="Reset">
				</div>
		</form>
	</div>



</body>
</html>