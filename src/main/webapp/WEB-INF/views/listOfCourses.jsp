<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- FIX: Change to mvc resource mapping -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/list.css" />">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Students</title>
<style>
</style>
</head>
<body>
	<h1>List of Courses</h1>
	<table>
		<tr>
			<th>Course ID</th>
			<th>Course Name</th>
			<th>Course Description</th>

			<th>Edit</th>
			<th>Delete</th>

		</tr>
		<c:forEach var="list" items="${course}">
			<input type="hidden" name="courseId" value="${list.courseId}" />
			<tr>
				<td><c:out value="${list.courseId}" /></td>
				<td><c:out value="${list.courseName}" /></td>
				<td><c:out value="${list.courseDescription}" /></td>
				<td><a
					href="<c:url value='edit'>
			                <c:param name='courseId' value='${list.courseId}' /> 
			                <c:param name='action' value='edit'/> 
			                </c:url>">
						Edit </a></td>
				<td><a
					href="<c:url value='delete'>
			                <c:param name='courseId' value='${list.courseId}' /> 
			                <c:param name='action' value='delete' /> 
			                </c:url>">
						Delete </a></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>