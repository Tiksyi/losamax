<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  -->
<!DOCTYPE html>
<html lang=fr>
<head>
<title><spring:message code="creer.menu.title" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/static/css/styles.css" />">
<link rel="icon" href="<c:url value="/static/images/losamax2.png" />">
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<%-- <link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.min.css" />">

<script src="<c:url value="/static/jquery/js/jquery.min.js" />" ></script>
<script src="<c:url value="/static/bootstrap3/js/bootstrap.min.js" />" ></script> --%>
</head>
<body>
	<div class="container">
		<h3 text-align=center>
			<spring:message code="evenement.creer" />
		</h3>
		<form method="POST" action="creerEvenement" modelAttribute="evenement">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

			<div class="form-group">
				<form:label path="evenement.nom">
					<spring:message code="evenement.nom" />
				</form:label>
				<form:input path="evenement.nom" class="form-control" />
			</div>

			<div class="form-group">
				<form:label path="evenement.participants" id="participants">
					<spring:message code="evenement.participants" />
				</form:label>

				<form:select path="evenement.participants" items="${participants}"
					multiple="true" itemValue="id" itemLabel="nom" class="form-control capital" />
			</div>
		<br>
		<div class="form-group">
			<form:label path="evenement.dateDebut">
				<spring:message code="evenement.date.debut.format" />
			</form:label>
			<form:input path="evenement.dateDebut" class="form-control" />
		</div>
		<div class="form-group">
			<form:label path="evenement.dateFin">
				<spring:message code="evenement.date.fin.format" />
			</form:label>
			<form:input path="evenement.dateFin" class="form-control" />
		</div>
		<br> <input type="submit" class="btn btn-primary"
			value="<spring:message code="evenement.creer" />" />
		</form>	
		<br> <br> <a href="<c:url value="/admincontroller/goToAdmin" />" type="button"
			class="btn btn-primary"><spring:message code="menu.retour" /></a>
	</div>
</body>
</html>