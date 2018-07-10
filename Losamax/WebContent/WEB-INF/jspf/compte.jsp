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
			<spring:message code="compte.bienvenue" />
			&nbsp;
			<sec:authentication property="principal.username" />
			<br>
			<spring:message code="client.historique" />
		</h3>
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
			<c:forEach items="${listeParis}" var="pari">
				<tr>
					<td><c:out value="${pari.evenement.nom}" /></td>
					<td><c:out value="${pari.client.credentials.username}" /></td>
					<td><c:out value="${pari.mise}" /></td>
					<td><c:out value="${pari.choix}" /></td>
					<td><c:out value="${pari.evenement.resultatFinal}" /></td>
					<td></td>
					<td><a href="<c:url value="/paricontroller/supprimerPari/${username}/${pari.id}"/>"><spring:message code="pari.suppression" /></a></td>
					<td><a href="<c:url value="/clientcontroller/goToCreerPari/${username}/${pari.evenement.id}"/>"><spring:message code="pari.modifier" /></a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="<c:url value="/paricontroller/goToMenu" />" type="button"
			class="btn btn-primary"><spring:message code="menu.retour" /></a>
	</div>


</body>
</html>