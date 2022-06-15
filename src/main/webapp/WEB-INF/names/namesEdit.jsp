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
	<div class="container">
		<h1>Hello edit</h1>

		<form:form action="/names/${oneName.id}/update" method="post"
			modelAttribute="oneName">
			<!-- another way to pass in information in hidden, need a route guard -->
			<form:input type="hidden" path="user" value="${loggedInUser.id}" />
			<!--another way to pass in information with session  -->
			<%-- <form:input type="hidden" path="user" value="${user_id}"/> --%>

			<p>
				<form:label path="name">Name</form:label>
				<form:errors path="name" />
				<form:input path="name" />
			</p>
			<p>
				<form:label path="origin">Origin</form:label>
				<form:errors path="origin" />
				<form:input path="origin" />
			</p>
			<p>
				<form:label path="meaning">Meaning</form:label>
				<form:errors path="meaning" />
				<form:textarea path="meaning" />
			</p>
			<p>
				<form:select path="gender">
					<c:forEach items="${allGens}" var="gen">
						<form:option value="${gen.id}">
						
							${gen.getName() }
						</form:option>
					</c:forEach>

				</form:select>
			</p>



			<button class="btn btn-primary">cancel</button>




		</form:form>

		<a href="/names/${oneName.id}/delete"><button class="btn btn-danger">delete</button></a>
	</div>
</body>
</html>