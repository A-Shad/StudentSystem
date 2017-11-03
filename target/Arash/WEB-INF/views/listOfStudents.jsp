<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Students</title>
<!-- FIX: Change to mvc mapping -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/list.css" />">

</head>
<body>
<h1>List of Students</h1>
<table> 
   <tr>
     <th>Student ID</th>
     <th>First Name</th>
     <th>Last Name</th>
     <th>E-Mail</th>
     <th>Reg. By</th>
     <th>Edit</th>
     <th>Delete</th>
     <th>Send E-Mail</th>
  </tr>   
  <c:forEach var = "list" items="${student}">
<%--          <input type="hidden" path="studentId"  value="${list.studentId}" /> --%>
<%--          <input type="hidden" path="userName"  value="${user}" /> --%>
        <tr>
            <td><c:out value="${list.studentId}"  /></td>
		    <td><c:out value="${list.firstName}"  /></td>
		    <td><c:out value="${list.lastName}" /></td> 
		    <td><c:out value="${list.email}" /></td> 
		    <td><c:out value="${list.userName}" /></td> 
		    <td>
			      <a href= "<c:url value='edit' >
			                <c:param name='userName' value='${userName}' /> 
			                <c:param name='studentId' value='${list.studentId}' /> 
			                <c:param name='action' value='edit'/> 
			                </c:url>">
			         Edit
			      </a>
		    </td> 
		    <td>
			      <a href= "<c:url value='delete'>
			                <c:param name='userName' value='${userName}' /> 
			                <c:param name='studentId' value='${list.studentId}' /> 
			                <c:param name='action' value='delete' /> 
			                </c:url>">
			       Delete
			      </a>
		     </td> 		
		    <td>
		    <c:if test="${not empty list.email}">
		      <a href= "<c:url value='email'>
		                <c:param name='userName' value='${userName}' /> 
		                <c:param name='studentId' value='${list.studentId}' /> 
 		                <c:param name='action' value='emailStep1' />  
		                </c:url>">
		       E-Mail 
		      </a>
		     </c:if>
		     </td> 		
		  </tr>
  </c:forEach>
    
</table>
</body>
</html>