<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script>
<title><spring:message code="admin.bienvenue" /></title>
</head>
<body>
	<div class="container">
		<h3>
			<spring:message code="admin.bienvenue" />
			<br>
			<spring:message code="admin.liste.evenement" />
		</h3>
		<br> <br>
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
					code="participant.creer" /></a> <br>
							<br><a href="<c:url value="/admincontroller/goToCreerParticipant" />"
				type="button" class="btn btn-primary"><spring:message
					code="cote.creer" /></a> <br>
					<br><a href="<c:url value="/admincontroller/goToCreerEvenement" />"
				type="button" class="btn btn-primary"><spring:message
					code="evenement.creer" /></a> <br>
			<br> <a href="<c:url value="/paricontroller/goToMenu" />"
				type="button" class="btn btn-primary"><spring:message
					code="menu.retour" /></a>

		</h3>

	</div>


</body>
</html>