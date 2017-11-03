<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<style type="text/css">
li a {
	display: block;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
</head>
<body>
	<c:choose>
		<c:when test='${user == null}'>
         Oops! This user is not registered, yet! 
         <a href="index.jsp" class="w3-button w3-black">Go back to
				the Login page</a>

		</c:when>
		<c:when test='${user.password == ""}'>
         Man! Your password is not matched! 
         <a href="index.html" class="w3-button w3-black">Go back to
				the Login page</a>
		</c:when>
		<c:otherwise>

			<div data-role="page" id="pageone">
				<h3>
					Hello ${user.firstName} ${user.lastName}! <a
						href="${ pageContext.request.contextPath }/login/signout" data-ajax="false">
						Signout </a>
				</h3>



				<!--         Students    -->
				<div data-role="header">
					<h1>Student Admission System</h1>
				</div>

				<div data-role="main" class="ui-content">
					<h2>Information</h2>
					<div data-role="collapsible">
						<h4>Students</h4>
						<form method="get" action="student/list" target="_blank">
							<!-- FIX: getting value needs to be in quote -->
							<input type="hidden" name="userName" value="${user.userName}" />
							<input type="hidden" name="action" value="list" /> <input
								type="hidden" name="studentId" value="0" /> <input
								type='submit' value="List of Students" />
						</form>
						<form method="get" action="student/insert" target="_blank">
							<!-- FIX: getting value needs to be in quote -->
							<input type="hidden" name="userName" value="${user.userName}" />
							<input type="hidden" name="action" value="insert" /> <input
								type='submit' value="Regsiter a Student" />
						</form>
						<form method="get" action="student/search" target="_blank">
							<!-- FIX: getting value needs to be in quote -->
							<input type="hidden" name="userName" value="${user.userName}" />
							<input type="hidden" name="action" value="searchStep1" /> <input
								type='submit' value="Search Student(s)" />
						</form>
					</div>
					<!-- FIX: Missing div end tag -->
				</div>

				<!--         Courses    -->

				<div data-role="main" class="ui-content">
					<div data-role="collapsible">
						<h4>Courses</h4>
						<form method="get" action="course/list" target="_blank">
							<input type="hidden" name="action" value="list" /> <input
								type="hidden" name="courseId" value="0" /> <input type='submit'
								value="List of Courses" />
						</form>
						<form method="get" action="course/insert" target="_blank">
							<input type="hidden" name="action" value="insert" /> <input
								type='submit' value="Add a Course" />
						</form>
						<form method="get" action="course/search" target="_blank">
							<input type="hidden" name="action" value="searchStep1" /> <input
								type='submit' value="Search Course(s)" />
						</form>
					</div>


					<!--         Results    -->

					<div data-role="main" class="ui-content">
						<div data-role="collapsible">
							<h4>Results</h4>
							<form method="get" action="result/list" target="_blank">
								<input type="hidden" name="userName" value=${user.userName } />
								<input type="hidden" name="action" value="list" /> <input
									type="hidden" name="resultId" value="0" /> <input
									type='submit' value="Results" />
							</form>
							<form method="get" action="result/insert" target="_blank">
								<input type="hidden" name="userName" value=${user.userName } />
								<input type="hidden" name="action" value="insert" /> <input
									type='submit' value="Add a Mark" />
							</form>
							<form method="get" action="result/search" target="_blank">
								<input type="hidden" name="userName" value=${user.userName } />
								<input type="hidden" name="action" value="searchStep1" /> <input
									type='submit' value="Search Marks(s)" />
							</form>
						</div>

					</div>

					<div data-role="footer">
						<h1>Please choose one of the categories</h1>
					</div>
				</div>
				<!-- FIX: Missing div end tag -->
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>