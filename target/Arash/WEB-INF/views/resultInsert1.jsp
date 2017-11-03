<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


  <jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="styles/registrationForm.css">
   <script src="counriesProvincesData.js" type="text/javascript"></script>
   <script src="counriesProvincesFunctions.js" type="text/javascript"></script> 
 
</head>
<body>

<div class="container">
  <h1 >Entering Marks </h1>
  <p > This information will be saved under the User "${userName}"</p>
  <br>  <br>
  <form action="insert" method="post">
    <div class="form-group row">
		<div class="col-xs-7">
            <label for="courseList">Course Name</label>
			<select name="courseList">
			    <c:forEach items="${courses}" var="course">
			        <option value="${course.courseId}"><c:out value="${course.courseName}" /></option>
			    </c:forEach>
			</select>
		</div>
	   <div class="col-xs-2">
		  <label for="semester">Semester</label><br>
	 	  <input type="radio" name="semester" value="1" checked> January<br>
		  <input type="radio" name="semester" value="2"> September<br>
	   </div>
	   <div class="col-xs-2">
	   	  <label for="year">Year</label><br>
	         <fmt:formatDate var="datetime" value="${now}" />
	         <c:set var = "length" value = "${fn:length(datetime)}"/>
	         <c:set var = "year" value = "${fn:substring(datetime,length-4, length)}"/>
	      <select id="year" name="year">
            <c:forEach begin="0" end="10" var="val">
 		           <c:set var="decr" value="${year- val}"/>   
                   <option value="${decr}" >${decr}</option>  
             </c:forEach>
          </select>
       </div>


		<div class="col-xs-7">
             <label for="studentList">Student</label>
			<select name="studentList">
			    <c:forEach items="${students}" var="student">
			        <option value="${student.studentId}"><c:out value="${student.firstName}  ${student.lastName}" /></option>
			    </c:forEach>
			</select>
		</div>
      
      <div class="col-xs-3">
          <label for="examMidterm">Mid-Term Mark</label>
          <input class="form-control" id="examMidterm" name="examMidterm" type="number" step="0.01">
      </div>
      <div class="col-xs-3">
          <label for="examFinal">Final Mark</label>
          <input class="form-control" id="examFinal" name="examFinal" type="number" step="0.01">
      </div>
      <input type="hidden" name="action" value="insert"> 
      <input type="hidden" name="userName" value="${userName}"> 
     <h4 class="col-xs-6 form-control"> </h4>  
      <div class="col-xs-5">
        <input  class="form-control" type="submit" value="Submit">
      </div>
      
      <div class="col-xs-5">
        <input  class="form-control" type="reset" value="Reset">
      </div>

  </form>
</div>

  

</body>
</html>