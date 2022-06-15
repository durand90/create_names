<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>Hello gender</h1>
	
	<h1>Hello create</h1>
	
	<form:form action="/gender/made" method="post" modelAttribute="genders">
	<!-- another way to pass in information in hidden, need a route guard -->
	<%-- <form:input type="hidden" path="user" value="${loggedInUser.id}"/> --%>
	<!--another way to pass in information with session  -->
	<%-- <form:input type="hidden" path="user" value="${user_id}"/> --%>
	
		<p>
			<form:label path="name">Name</form:label>
			<form:errors path="name" />
			<form:input path="name" />
		</p>
		
		
		
		
		<input type="submit" value="Submit" />
		
		
	</form:form>
</body>
</html>