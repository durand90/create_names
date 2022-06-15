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
<link rel="stylesheet" href="/css/users.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">

		<div>
			<h1>Create Login</h1>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<%-- <form:input type="hidden" path"user" value="${logUser.userName}"/> --%>
				<p>
					<form:label path="name"></form:label>
					<form:errors path="name" />
					<form:input class="form-control" path="name" placeholder="Name"/>
				</p>
				<p>
					<form:label path="email"></form:label>
					<form:errors path="email" />
					<form:input class="form-control" path="email" placeholder="Email"/>
				</p>
				<p>
					<form:label path="password"></form:label>
					<form:errors path="password" />
					<form:input class="form-control" path="password" placeholder="Password"/>
				</p>
				<p>
					<form:label path="confirm"></form:label>
					<form:errors path="confirm" />
					<form:input class="form-control" path="confirm" placeholder="Confirm Password"/>
				</p>

				<input type="submit" value="Submit" class="btn btn-primary"/>
			</form:form>
		</div>

	

		<div>
			<h1>Login</h1>
			<form:form action="/login" method="post" modelAttribute="newLogin">
				<%-- <form:input type="hidden" path"user" value="${logUser.userName}"/> --%>
				<p>
					<form:label path="email"></form:label>
					<form:errors path="email" />
					<form:input class="form-control" path="email" placeholder="Email"/>
				</p>
				<p>
					<form:label path="password"></form:label>
					<form:errors path="password" />
					<form:input class="form-control" path="password" placeholder="Password"/>
				</p>
				<input type="submit" value="Submit" class="btn btn-success"/>
			</form:form>

		</div>



	</div>
</body>
</html>