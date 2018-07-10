<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html lang=fr>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="icon" href="<c:url value="/static/icones/www.ico" />">
 <link rel="stylesheet" href="<c:url value="/static/css/styles.css" />">
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
		<br>

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<ul class="nav navbar-nav">
					<li><a
						href="<c:url value="/admincontroller/goToCreerParticipant" />"><spring:message
								code="participant.creer" /></a></li>
					<li><a
						href="<c:url value="/admincontroller/goToCreerEvenement" />"><spring:message
								code="evenement.creer" /></a></li>
													<li><a
						href="<c:url value="/admincontroller/supprimerEvenement" />"><spring:message
								code="evenement.supprimer" /></a></li>
								<li><a
						href="<c:url value="/admincontroller/listerResultats" />"><spring:message
								code="resultats.valider" /></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value="/paricontroller/goToMenu" />"><spring:message
								code="menu.retour" /></a></li>
				</ul>
			</div>
		</nav>
		<br>
		<table class="table table-striped table-dark">
			<tr>
				<th><spring:message code="evenement.nom" /></th>
				<th><spring:message code="evenement.date.fin" /></th>
			</tr>
			<c:forEach items="${evenementsFiltres}" var="evenement">
				<tr>
					<td><c:out value="${evenement.nom}" /></td>
					<td><fmt:formatDate type = "both" dateStyle="long" value = "${evenement.dateFin}" /></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<br>
	</div>


</body>
</html>