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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h3 text-align=center>
			<spring:message code="participant.creer" />
		</h3>
		<form method="POST" action="creerParticipant"
			modelAttribute="participant">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden"
				name="participant.id" />
			<div class="form-group">
				<form:label path="participant.nom">
					<spring:message code="participant.nom" />
				</form:label>
				<form:input path="participant.nom" class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="participant.sport.id">
					<spring:message code="participant.sport" />
				</form:label>
				<form:select path="participant.sport.id" class="form-control">
					<form:option value="" label="" />
					<form:options items="${sports}" itemValue="id" itemLabel="nom" />
				</form:select>
			</div>
			<br> <input type="submit" class="btn btn-primary"
				value="<spring:message code="participant.creer" />" />
		</form>
		<h3 text-align=center>
			<spring:message code="cote.creer" />
		</h3>
		<form method="POST" action="creerCote" modelAttribute="cote">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="cote.id" />
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
		<br> <a href="<c:url value="/admincontroller/goToCreerEvenement" />"
			type="button" class="btn btn-primary"><spring:message
				code="evenement.creer" /></a><br>

		<br> <a href="<c:url value="/admincontroller/goToAdmin" />"
			type="button" class="btn btn-primary"><spring:message
				code="menu.retour" /></a>
	</div>
</body>
</html>