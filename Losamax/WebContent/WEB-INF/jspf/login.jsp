<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>

<link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../../../favicon.ico">

<%-- <title><c:out value="${pageTitle}" /></title> --%>
<title>Connexion</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap4/css/bootstrap.css" />" />
<%-- <link href="<c:url value="/static/css/styles.css" />" rel="stylesheet"> --%>

<!-- Custom styles for this template -->
<link href="<c:url value="/static/css/signin.css" />" rel="stylesheet">
</head>

<body>
	<%-- <h2>
		<c:out value="${message}" />
	</h2> --%>
	<form class="form-signin" method="POST"
		action="<c:url value="/login" />">

		<div class="text-center mb-4">

			<h1 class="h3 mb-3 font-weight-normal"><spring:message code="login.message"/></h1>

		</div>

		<div class="form-label-group">
			<input name="username" type="text" 
				class="form-control" placeholder="Username" value="">
			<!--  <label for="inputEmail">@Email</label> -->
		</div>
		<br>
		<div class="form-label-group">
			<input name="password" type="password" 
				class="form-control" placeholder="Password" required value="">
			<!-- <label for="inputPassword">Password</label> -->
		</div>
		<br>
		<!-- 
		<div class="checkbox mb-3">
			<label> <input type="checkbox" value="remember-me">
				Remember me
			</label>
		</div> -->
		<button class="btn btn-lg btn-primary2 btn-block" type="submit"><spring:message code="login.connexion"/></button>
		<p class="mt-5 mb-3 text-muted text-center">
			<spring:message code="accueil.footer" />
		</p>
		
		<div class="text-center mb-4">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<%-- 	<c:if test="${param.error}">
				<span class="error"><spring:message code="login.error" /></span>
			</c:if> --%>
		</div>
	</form>
</body>

</html>