<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- FIX: Change to spring location -->
<link rel="stylesheet"
	href="<c:url value="/resources/styles/registrationForm.css" />">
</head>
<body>
	<div data-role="page">
		<div data-role="main" class="ui-content">
			<a href="#myPopup" data-rel="popup"
				class="ui-btn ui-btn-inline ui-corner-all  ui-btn-icon-left"></a>

			<h1>Search Student(s)</h1>
			<form method="post" action="search" target="_blank">
				<div>
					<h3>Search based on Student Name</h3>
					<label for="firstName" class="ui-hidden-accessible">First
						Name:</label> <input type="text" name="firstName" id="firstName"
						placeholder="First Name"> <label for="lastName"
						class="ui-hidden-accessible">Last Name:</label> <input type="text"
						name="lastName" id="lastName" placeholder="Last Name"> <input
						type="hidden" name="userName" value="${userName}"> <input
						type="hidden" name="action" value="searchStep2" /> <input
						type="hidden" name="studentId" value="0" /> <input type='submit'
						value="Search Student(s)" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>