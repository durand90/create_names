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
		<h1>
			<c:out value="${oneName.name}"></c:out>
		</h1>
		<p>(added by ${oneName.user.name})</p>

		<h3>
			Gender:
			<c:out value="${oneName.gender.name}"></c:out>
		</h3>
		<h3>
			Origin:
			<c:out value="${oneName.origin}"></c:out>
		</h3>

		<h3>
			Meaning:
			<c:out value="${oneName.meaning}"></c:out>
		</h3>
		<c:choose>
			<c:when test="${oneName.user.id == user_id }">
				<a href="/names/${oneName.id}/edit"><button class="btn btn-primary">Edit</button></a>
				<a href="/names/${oneName.id}/delete"><button class="btn btn-danger">Delete</button></a>
			</c:when>
			<c:otherwise>
				<button class="btn btn-danger">Only Creator can edit</button>
			</c:otherwise>
		</c:choose>
		<%-- ${oneName.user.name} --%>
		<a href="/home"><button class="btn btn-primary">Home</button></a>
	</div>
</body>
</html>