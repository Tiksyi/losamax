<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title><spring:message code="admin.bienvenue" /></title>
</head>
<body>
	<spring:message code="admin.bienvenue" />
	<br>
	<spring:message code="admin.liste.evenement" />
	<div class="container">
		<table class="table table-striped table-dark">
			<tr>
				<th><spring:message code="evenement.nom" /></th>
				<th><spring:message code="evenement.date.debut" /></th>
				<th><spring:message code="evenement.date.fin" /></th>
			</tr>
			<c:forEach items="${evenements}" var="evenement">
				<tr>
					<td><c:out value="${evenement.nom}" /></td>
					<td><c:out value="${evenement.dateDebut}" /></td>
					<td><c:out value="${evenement.dateFin}" /></td>
				</tr>
			</c:forEach>
		</table>

		<h3>

			<a href="<c:url value="/admincontroller/goToCreerParticipant" />"
				type="button" class="btn btn-primary"><spring:message
					code="participant.creer" /></a> <br><br> <a
				href="<c:url value="/paricontroller/goToMenu" />" type="button"
				class="btn btn-primary"><spring:message code="menu.retour" /></a>

		</h3>

	</div>


</body>
</html>