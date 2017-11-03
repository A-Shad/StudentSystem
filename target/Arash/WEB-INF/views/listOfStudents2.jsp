<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- FIX: Change to mvc mapping -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/styles/list.css" />">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Students</title>

</head>
<body>
	<h1>List of Students</h1>
	<table>
		<tr>
			<th>Course Id</th>
			<th>Course Name</th>
			<th>Semester</th>
			<th>Year</th>
			<th>Student ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Midterm</th>
			<th>Final</th>

		</tr>
		<c:forEach var="list" items="${courseStudentMarks}">
			<input type="hidden" name="studentId" value="${list.studentId}" />
			<input type="hidden" name="studentId" value="${list.courseId}" />
			<input type="hidden" name="studentId" value="${list.resultId}" />
			<tr>
				<td><c:out value="${list.courseId}" /></td>
				<td><c:out value="${list.courseName}" /></td>
				<td><c:out value="${list.semester}" /></td>
				<td><c:out value="${list.year}" /></td>
				<td><c:out value="${list.studentId}" /></td>
				<td><c:out value="${list.firstName}" /></td>
				<td><c:out value="${list.lastName}" /></td>
				<td><a
					href="<c:url value='/resultaction'>
			                <c:param name='userName' value='${userName}' /> 
			                <c:param name='resultId' value='${list.resultId}' /> 
			                <c:param name='action' value='edit'/> 
			                </c:url>">
						Edit </a></td>
				<td><a
					href="<c:url value='/studentaction'>
			                <c:param name='userName' value='${userName}' /> 
			                <c:param name='resultId' value='${list.resultId}' /> 
			                <c:param name='action' value='delete' /> 
			                </c:url>">
						Delete </a></td>
				<td></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>