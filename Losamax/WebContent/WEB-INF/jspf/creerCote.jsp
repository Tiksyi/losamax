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
<title><spring:message code="creer.menu.title" /></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	 <link rel="icon" href="<c:url value="/static/icones/www.ico" />">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h3 text-align=center>
			<spring:message code="cote.creer" />
		</h3>
		<form method="POST" action="${pageContext.request.contextPath}/admincontroller/creerCote" modelAttribute="cote">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
				<input type="hidden" name="evenementId" value="${evenementId}" />
			<div class="form-group">
				<form:label path="cote.libelle">
					<spring:message code="cote.libelle" />
				</form:label>
				<form:input path="cote.libelle" class="form-control" />
			</div>		
			<div class="form-group">
				<form:label path="cote.valeur">
					<spring:message code="cote.valeur" />
				</form:label>
				<form:input path="cote.valeur" class="form-control" />
			</div>

		<br> <input type="submit" class="btn btn-primary"
			value="<spring:message code="cote.creer" />" />
		</form>
		<br>
		
		<div class="container">
		<h3>
			<spring:message code="admin.liste.cotes" />
		</h3>
		<br> <br>
		<table class="table table-striped table-dark">
			<tr>
				<th><spring:message code="cote.libelle" /></th>
				<th><spring:message code="cote.valeur" /></th>
			</tr>
			<c:forEach items="${cotes}" var="cote">
				<tr>
					<td><c:out value="${cote.libelle}" /></td>
					<td><c:out value="${cote.valeur}" /></td>
				</tr>
			</c:forEach>
		</table>
		</div> <br> <a
			href="<c:url value="/admincontroller/goToAdmin" />" type="button"
			class="btn btn-primary"><spring:message code="menu.retour" /></a>
	</div>
</body>
</html>