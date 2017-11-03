<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
	<div data-role="page" class="big-table">
		<div data-role="header">
			<h1>Student Admission System</h1>
		</div>

		<div data-role="main" class="ui-content">
			<a href="#myPopup" data-rel="popup"
				class="ui-btn ui-btn-inline ui-corner-all ui-icon-check ui-btn-icon-left">Sign
				up Form</a>

			<div data-role="popup" id="myPopup" class="ui-content"
				style="min-width: 250px;">
				<form:form method="post" action="login/signup"	commandName="new_user" data-ajax="false">
					<div>
						<h3>Sign Up information</h3>
						<label for="firstName" class="ui-hidden-accessible">First
							Name:</label>
						<form:input type="text" path="firstName" id="fname"
							placeholder="First Name" autocomplete="false" />

						<label for="lastName" class="ui-hidden-accessible">Last
							Name:</label>
						<form:input type="text" path="lastName" id="lname"
							placeholder="Last Name" autocomplete="false" />

						<label for="usrnm" class="ui-hidden-accessible">User Name:</label>
						<form:input type="text" path="userName" id="usrnm"
							placeholder="User Name" autocomplete="false" />

						<label for="pswd" class="ui-hidden-accessible">Password:</label>
						<form:input type="password" path="password" id="pswd"
							placeholder="Password" autocomplete="false" />

						<label for="email" class="ui-hidden-accessible">E-Mail:</label>
						<form:input type="email" path="email" id="email"
							placeholder="E-Mail" autocomplete="false" />

						<input type="submit" data-inline="true" value="Save">
					</div>
				</form:form>
			</div>

			<form method="post" action="login/process" data-ajax="false">
				<div>
					<h3>Login information</h3>
					<label for="usrnm1" class="ui-hidden-accessible">User Name:</label>
					<input type="text" name="userName" id="usrnm1"
						placeholder="User Name" autocomplete="off" /> <label for="pswd"
						class="ui-hidden-accessible">Password:</label> <input
						type="password" name="password" id="pswd" placeholder="Password" autocomplete="off" />
					<label for="log">Keep me logged in</label> <input type="checkbox"
						name="login" id="log" value="1" data-mini="true"> <input
						type="hidden" name="what2Do" value="login"> <input
						type="submit" data-inline="true" value="Log-in">
				</div>
			</form>


		</div>

		<div data-role="footer">
			<h3>Designed and Implemented by Arash Shadmani - May and Aug.
				2017</h3>
		</div>
	</div>
</body>
</html>
