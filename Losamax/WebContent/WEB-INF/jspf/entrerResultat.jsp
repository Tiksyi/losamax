<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang=fr>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="entrer.resultat.title" /></title>
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script>
</head>
<body>
	<div class="container">
		<h3 text-align=center>
			<spring:message code="entrer.resultat.header" /> : ${evenement.nom}
		</h3>
		<form method="POST" action="${pageContext.request.contextPath}/admincontroller/entrerResultat" modelAttribute="evenement">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<form:hidden path="evenement.id"/>
			<div class="form-group">
				<form:label path="evenement.resultatFinal">
				</form:label>
				<form:input path="evenement.resultatFinal" class="form-control" />
				<br>
				
				<spring:message code="entrer.resultat.disponible" /><br>
				<c:forEach items="${libelles}" var="l">
					<c:out value="${l}" />
					<br>
				</c:forEach>
			</div>
				<input type="submit" class="btn btn-primary"
				value="<spring:message code="client.creer.submit" />" />
		</form>
		<br>
		<a href="<c:url value="/admincontroller/goToAdmin" />" type="button" class="btn btn-primary"><spring:message code="menu.retour" /></a>
	</div>
</body>
</html>