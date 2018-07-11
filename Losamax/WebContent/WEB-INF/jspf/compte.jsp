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
<link rel="icon" href="<c:url value="/static/images/losamax2.png" />">
<link rel="stylesheet" href="<c:url value="/static/css/styles.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<%-- <script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script> --%>
<%-- <script src="<c:url value="/static/jquery/js/jquery.js" />"></script> --%>
<script src="<c:url value="/static/js/js.js" />"></script>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<title><spring:message code="compte.bienvenue" />&nbsp;${client.prenom}</title>

</head>
<body>
	<div class="container">
		<div class="row">
				<h3>
					<spring:message code="compte.bienvenue" />&nbsp;<span>${client.prenom}</span>
					<span>
					<br>
					<span>Solde : ${client.solde}&euro;</span>
				</h3>
				<a type="button" class="btn btn-primary"
					href="<c:url value="/clientcontroller/goToModifier/${client.id}" />"><spring:message
						code="compte.modifier" /></a>
		</div>
		<br> <br> <br>
		<div class="row">
			<div class="col-lg-6" align="left">
				<h3>
					<spring:message code="client.historique" />
				</h3>
			</div>
			<div class="col-lg-6" align="right">
				<a type="button" class="btn btn-primary"
					href="<c:url value="/clientcontroller/actualiser/${client.credentials.username}" />"><spring:message
						code="compte.actualiser.pari" /></a>
			</div>
		</div>

		<br>
		<table class="table table-striped table-dark">
			<tr>
				<th><spring:message code="evenement.nom" /></th>
				<th><spring:message code="username" /></th>
				<th><spring:message code="pari.mise" /></th>
				<th><spring:message code="pari.choix" /></th>
				<th><spring:message code="pari.resultat.evenement" /></th>
				<th><spring:message code="pari.resultat.pari" /></th>
				<th><spring:message code="pari.suppression" /></th>
				<th><spring:message code="pari.modifier" /></th>
			</tr>
			<c:forEach items="${listeParis}" var="pari" varStatus="loop">
				<tr>
					<td><c:out value="${pari.evenement.nom}" /></td>
					<td><c:out value="${client.nom}" /></td>
					<td><c:out value="${pari.mise}" /></td>
					<td><c:out value="${pari.choix}" /></td>
					<td><c:out value="${pari.evenement.resultatFinal}" /></td>
					<td><c:out value="${resultats[loop.index]}" /></td>
					<td><a
						href="<c:url value="/paricontroller/supprimerPari/${username}/${pari.id}"/>"><spring:message
								code="pari.suppression" /></a></td>
					<td><a
						href="<c:url value="/clientcontroller/goToCreerPari/${username}/${pari.evenement.id}"/>"><spring:message
								code="pari.modifier" /></a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="<c:url value="/paricontroller/goToMenu" />" type="button"
			class="btn btn-primary"><spring:message code="menu.retour" /></a>
	</div>


</body>
</html>