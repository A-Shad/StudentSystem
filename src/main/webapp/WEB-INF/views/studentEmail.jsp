<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Email</title>
</head>
<body>
	<form:form action="email" method="post"  commandName="email_student" id="emailForm"
		class="w3-container w3-card-4 w3-light-grey w3-text-blue ">
		<h2 class="w3-center">Email to Student</h2>

		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-envelope-o"></i>
			</div>
			<div class="w3-rest">
				<label for="emailFromInput" class="ui-hidden-accessible">E-mail
					from:</label> 
			<form:input class="w3-input w3-border" 	path="emailFrom" id="emailFromInput" value="${user.email}" />
			</div>
		</div>

		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-user"></i>
			</div>
			<div class="w3-rest">
				<label for="firstNameInput" class="ui-hidden-accessible">Student
					First Name:</label> 
				<form:input class="w3-input w3-border" type="text" path="firstName" id="firstNameInput" value="${student.firstName}" />
			</div>
		</div>

		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-user"></i>
			</div>
			<div class="w3-rest">
				<label for="lastNameInput" class="ui-hidden-accessible">Student
					Last Name:</label> 
		    	<form:input class="w3-input w3-border" type="text" path="lastName" id="lastNameInput" value="${student.lastName}" />
			</div>
		</div>



		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-envelope-o"></i>
			</div>
			<div class="w3-rest">
				<label for="emailToInput" class="ui-hidden-accessible">Student
					E-mail</label> 
		      <form:input class="w3-input w3-border" type="emailTo" path="emailTo" id="emailToInput" value="${student.email}" />
			</div>
		</div>

		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-header"></i>
			</div>
			<div class="w3-rest">
			<form:input class="w3-input w3-border" type="text" path="emailTitle" id="emailTitleInput" placeholder="E-mail title *" />
			</div>
		</div>

		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-pencil"></i>
			</div>
			<div class="w3-rest">
				<form:textarea path="emailBody" rows="20" id="inquiry" cols="80"
					placeholder="Email body *" maxlength="10000" ></form:textarea>
			</div>
		</div>


		<input type="hidden" name="userName" value="${user.userName}">

		<button name="submit" value="Send" onclick="resetPlaceHolder()"
			class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding">Send</button>

	</form:form>
	<script type="text/javascript" src="<c:url value="/resources/scripts/validation.js" />"></script>
</body>
</html>