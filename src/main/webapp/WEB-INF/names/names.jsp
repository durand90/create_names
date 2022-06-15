<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVA</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">

		<h3>
			Hello,
			<c:out value="${thisUser.name}" />!
			
		</h3>
		<h4>Create Baby Names</h4>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Name (click to edit)</th>
					<th scope="col">Gender</th>
					<th scope="col">Origin</th>
					

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${all}" var="name">
					<tr>
						<td><a href="/names/${name.id}/show"><c:out
									value="${name.name}" /></a></td>
						<td><c:out value="${name.gender.name}"></c:out></td>
						<td><c:out value="${name.origin}" /></td>
						
					</tr>

				</c:forEach>
		</table>

		<a href="/names/create"><button class="btn btn-primary">Add Name</button></a>
		<a href="/logout"><button class="btn btn-danger">Logout</button></a>

	</div>
</body>
</html>