<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=fr>
<head>
<title><spring:message code="creer.pari.title" /></title>
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
	<script
	src="<c:url value="/static/js/js.js" />"></script>
	
<%-- <link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.min.css" />">

<script src="<c:url value="/static/jquery/js/jquery.min.js" />" ></script>
<script src="<c:url value="/static/bootstrap3/js/bootstrap.min.js" />" ></script> --%>
</head>
<body>
	<div class="container">
		<h3 text-align=center>
			<spring:message code="pari.header" />
		</h3>
		<form action="" modelAttribute="client">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<ul class="nav navbar-nav">
					 <p class="navbar-text capital">${client.nom}</p>
					 <p class="navbar-text">Solde : ${client.solde} &euro;</p>
					 <p class="navbar-text">Mise maximum : ${client.miseMax} &euro;</p>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value="/paricontroller/goToMenu" />"><spring:message
								code="menu.retour" /></a></li>
				</ul>
			</div>
		</nav>
		</form>
		<form method="POST"
			action="${pageContext.request.contextPath}/clientcontroller/creerPari"
			modelAttribute="pari">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="form-group">

				<form:label path="pari.mise">
					<spring:message code="pari.mise" />
					<span class="required">*</span>
				</form:label>
				<form:input path="pari.mise" class="form-control" id="mise" />
				&nbsp;
				<form:errors path="pari.mise" cssClass="errors" />
			</div>
			<div class="panel-group">
				<div class="panel panel-info class">
					<div class="panel-body">
						<div class="container">
							<div class="row">
								<div class="col-lg-4 capital" align="left">
									<c:forEach var="p" items="${pari.evenement.participants}"
										varStatus="loop">
										<label><c:out value="${fn:toLowerCase(p.nom)}" /></label>
										<c:if test="${loop.index==0}">&nbsp;-&nbsp;</c:if>
									</c:forEach>
								</div>
								<div class="col-lg-4" align="center">
									<ul class="list-inline">
										<c:forEach var="c" items="${cotes}">
											<li><button type="button" class="btn btn-default"
													onclick="calculCote(${c.valeur}, '${c.libelle}')">
													<c:out value="${c.libelle}" />
												</button>&nbsp;<label><c:out value="${c.valeur}" /></label></li>
										</c:forEach>
										<form:hidden id="choix" path="pari.choix" value="" />
										<form:hidden path="pari.evenement.id" />
										<form:hidden path="pari.client.id" />
									</ul>
								</div>
								<div class="col-lg-4" align="right">
									<input type="text" class="form-control" id="view" value="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">
				<spring:message code="client.creer.submit" />
			</button>
			<a href="<c:url value="/paricontroller/goToMenu" />" type="button"
				class="btn btn-primary"><spring:message code="menu.retour" /></a>
		</form>
	</div>
</body>
</html>