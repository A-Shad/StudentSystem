<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Students</title>
<!-- FIX: Change to mvc mapping -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/list.css" />">

</head>
<body>
	<h1>Results categorized based on the Course, Semester and Year</h1>
	<table>
		<tr>
			<th>Result ID</th>
<!-- 			<th>Course ID</th> -->
			<th>Course Name</th>
			<th>Semester</th>
			<th>Year</th>
			<th>Mid-Term</th>
			<th>Final</th>
			<th>Student ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>User Name</th>

			<th>Edit</th>
			<th>Delete</th>
			<th>Email</th>

		</tr>
		<c:set var="course" value="${result[0].course.courseId}" />
		<c:set var="semester" value="${result[0].semester}" />
		<c:set var="year" value="${result[0].year}" />
		<c:forEach var="list" items="${result}">
			<input type="hidden" name="resultId" value="${list.resultId}" />
			<tr>

				<c:if
					test="${list.course.courseId != course or list.semester != semester or list.year != year}">
					<tr>
<%-- 						<td><c:out value="" /></td> --%>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<td><c:out value="" /></td>
						<c:set var="course" value="${list.course.courseId}" />
					</tr>
				</c:if>
				<c:if test="${list.course.courseId == course}">
					<td><c:out value="${list.resultId}" /></td>
<%-- 					<td><c:out value="${list.course.courseId}" /></td> --%>
					<td><c:out value="${list.course.courseName}" /></td>
					<td><c:out value="${list.semester}" /></td>
					<td><c:out value="${list.year}" /></td>
					<td><c:out value="${list.examMidterm}" /></td>
					<td><c:out value="${list.examFinal}" /></td>
					<td><c:out value="${list.student.studentId}" /></td>
					<td><c:out value="${list.student.firstName}" /></td>
					<td><c:out value="${list.student.lastName}" /></td>
					<td><c:out value="${list.student.email}" /></td>
					<td><c:out value="${list.userName}" /></td>
					<td><a
						href="<c:url value='edit'>
                               <c:param name='userName' value='${userName}' /> 
                               <c:param name='resultId' value='${list.resultId}' /> 
                               <c:param name='action' value='edit'/> 
                           </c:url>">
							Edit </a></td>
					<td><a
						href="<c:url value='delete'>
                               <c:param name='userName' value='${userName}' /> 
                               <c:param name='resultId' value='${list.resultId}' /> 
                               <c:param name='action' value='delete' /> 
                           </c:url>">
							Delete </a></td>
					<td><c:if test="${not empty list.student.email}">
							<a
								href="<c:url value='email'>
                                   <c:param name='userName' value='${userName}' /> 
                                   <c:param name='resultId' value='${list.resultId}' /> 
<%--                                    <c:param name='year' value='${list.year}' />  --%>
<%--                                    <c:param name='semester' value='${list.semester}' />  --%>
                                   <c:param name='firstName' value='${list.student.firstName}' /> 
                                   <c:param name='lastName' value='${list.student.lastName}' /> 
                                   <c:param name='courseId' value='${list.course.courseId}' /> 
                                   <c:param name='emailTo' value='${list.student.email}'/> 

                                   <c:param name='action' value='email1resultStep1' /> 
                               </c:url>">
								Email </a>
						</c:if></td>
					<c:set var="course" value="${list.course.courseId}" />
					<c:set var="semester" value="${list.semester}" />
					<c:set var="year" value="${list.year}" />
				</c:if>
			</tr>
		</c:forEach>

	</table>
</body>
</html>