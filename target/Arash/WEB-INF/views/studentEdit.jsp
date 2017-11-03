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
		<h1>Registration Form</h1>
		<p>This information will be saved under the User "${userName}"</p>
		<br> <br>
		<form:form action="edit" method="post"  commandName="edit_student">
			<div class="form-group row">
				<div class="col-xs-5">
					<label for="firstNameInput">First Name</label>
					<form:input class="form-control" id="firstNameInput"
						path="firstName" type="text" value="${student.firstName}"></form:input>
				</div>
	
	
				
				
				<div class="col-xs-5">
					<label for="lastNameInput">Last Name</label>

					<form:input class="form-control" id="lastNameInput" type="text"
						path="lastName" value="${student.lastName}"></form:input>
				</div>



				<div class="col-xs-5">
					<label for="universityInput">University</label>
					<form:input class="form-control" id="universityInput"
						path="university" type="text" value="${student.university}"></form:input>
				</div>

				<div class="col-xs-3">
					<%-- 					<form:radiobutton path="gender" value="male" ${student.gender==1?'checked':''  /> Male<br>  --%>
					<%-- 					<form:radiobutton path="gender" value="female" path="gender"/> 	Female<br>   --%>
					<%-- 					<form:radiobutton path="gender" value="other" path="gender"/> 	Other  --%>



					<form:radiobutton path="gender" value="male"
						checked="${student.gender==1? 'checked' : ''}" />
					Male<br>
					<form:radiobutton path="gender" value="female"
						checked="${student.gender==2?'checked':''}" />
					Female<br>
					<form:radiobutton path="gender" value="other"
						checked="${student.gender==3?'checked':''}" />
					Other
				</div>
				<div class="col-xs-4">
					<label for="dobInput">Date of Birth</label>
					<form:input class="form-control" type="date" id="dobInput"
						path="dob" value="${student.dob}" />
				</div>

				<h4 class="col-xs-6 form-control">
					<b> Address </b>
				</h4>
				<div class="col-xs-8">
					<label for="addressInput">Street Address</label>
					<form:input class="form-control" id="addressInput" type="text"
						path="address" value="${student.address}" />
				</div>

				<div class="col-xs-4">
					<label for="cityInput">City</label>
					<form:input class="form-control" id="cityInput" path="city"
						type="text" value="${student.city}" />
				</div>


				<div class="col-xs-5">
					<label for="countryInput">Country</label>
					<form:input class="form-control" id="countryInput" path="country"
						type="text" value="${student.country}" />
				</div>

				<div class="col-xs-5">
					<label for="provinceInput">Province</label>
					<form:input class="form-control" id="provinceInput" path="province"
						type="text" value="${student.province}" />
				</div>


				<h4 class="col-xs-6 form-control">
					<b> Contact Information </b>
				</h4>
				<div class="col-xs-5">
					<label for="emailInput">E-Mail</label>
					<form:input class="form-control" id="emailInput" path="email"
						type="email" value="${student.email}" />
				</div>
				<div class="col-xs-3">
					<label for="phoneInput">Phone</label>
					<form:input class="form-control" id="phoneInput" path="phone"
						type="tel" value="${student.phone}" />
				</div>
				<div class="col-xs-3">
					<label for="faxInput">Fax</label>
					<form:input class="form-control" id="faxInput" path="fax"
						type="tel" value="${student.fax}" />
				</div>
				<form:input type="hidden" path="studentId"
					value="${student.studentId}" />
				<form:input type="hidden" path="userName" value="${userName}" />
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