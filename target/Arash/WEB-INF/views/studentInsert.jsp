<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
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
<!-- FIX: Change to mvc mapping -->
<link rel="stylesheet"
	href="<c:url value="/resources/styles/registrationForm.css" />">
<script src="<c:url value="/resources/data/counriesProvincesData.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/scripts/counriesProvincesFunctions.js" />"
	type="text/javascript"></script>

</head>
<body>
	<div class="container">
		<h1>Registration Form</h1>
		<p>This information will be saved under the User "${userName}"</p>
		<br> <br>
		<%-- 		<form:form action="studentaction" method="post"> --%>
		<form:form action="insert" method="post" commandName="new_student">
			<div class="form-group row">
				<div class="col-xs-5">
					<label for="firstName">First Name</label>
					<form:input class="form-control" type="text" id="firstNameInput"
						path="firstName"></form:input>
				</div>
				<div class="col-xs-5">
					<label for="lastName">Last Name</label>
					<form:input class="form-control" id="lastNameInput" type="text"
						path="lastName"></form:input>
				</div>


				<div class="col-xs-5">
					<label for="universityInput">University</label>
					<form:input class="form-control" id="universityInput" type="text"
						path="university"></form:input>
				</div>
				<div class="col-xs-3">

					<form:radiobutton name="gender" value="male" path="gender" checked= 'checked'/>
					Male<br>
					<form:radiobutton name="gender" value="female" path="gender" />
					Female<br>
					<form:radiobutton name="gender" value="other" path="gender" />
					Other
				</div>
<!-- 				<div class="col-xs-4"> -->
<%-- 					<fmt:formatDate value="${existedEvent.date}" pattern="yyyy-MM-dd" --%>
<!-- 						var="formattedDate" /> -->
<%-- 					<form:input path="dob" value="${formattedDate}" type="date" /> --%>
<!-- 				</div> -->

				<div class="col-xs-4">
					<label for="dobInput">Date of Birth</label>
					<form:input class="form-control" type="date" id="dobInput"
 						path="dob"></form:input>
				</div>

				<h4 class="col-xs-6 form-control">
					<b> Address </b>
				</h4>
				<div class="col-xs-8">
					<label for="address">Street Address</label>
					<form:input class="form-control" type="text" name="address"
						id="address" path="address"></form:input>
				</div>
				<div class="col-xs-4">
					<label for="city">City</label>
					<form:input class="form-control" type="text" name="city" id="city"
						path="city"></form:input>
				</div>
				<div class="col-xs-5">
					<label for="country">Country</label>
					<form:select class="form-control" id="country" name="country"
						path="country"></form:select>
					<br>
				</div>
				<div class="col-xs-5">
					<label for="province">Province</label>
					<form:select class="form-control" name="province" id="province"
						path="province"></form:select>
				</div>


				<h4 class="col-xs-6 form-control">
					<b> Contact Information </b>
				</h4>
				<div class="col-xs-5">
					<label for="emailInput">E-Mail</label>
					<form:input class="form-control" id="emailInput" path="email"></form:input>
				</div>
				<div class="col-xs-3">
					<label for="phone">Phone</label>
					<form:input class="form-control" id="phone" name="phone" type="tel"
						path="phone"></form:input>
				</div>
				<div class="col-xs-3">
					<label for="fax">Fax</label>
					<form:input class="form-control" id="fax" name="fax" type="tel"
						path="fax"></form:input>
				</div>
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
	<script language="javascript">
		populateCountries("country", "province");
	</script>


</body>
</html>