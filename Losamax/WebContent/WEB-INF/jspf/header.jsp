<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang=fr>
<head>
<title><spring:message code="accueil.title" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/static/css/styles.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="body">
 --%>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">LOSAMAX</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#"><span
							class="glyphicon glyphicon-home"></span>&nbsp<spring:message
								code="accueil.accueil" /></a></li>
					<li><a href="<c:url value="/clientcontroller/parier"/>"><spring:message code="accueil.parier" /></a></li>

					<c:forEach var="s" items="${listeSports}">
						<li></li>
						<li><a href="<c:url value="/paricontroller/${s.nom}"/>"
							style="text-transform: capitalize"><c:out
									value="${fn:toLowerCase(s.nom)}" /></a></li>
						<li>|</li>
					</c:forEach>

					<li><a href="#"><spring:message code="accueil.apropos" /></a></li>
					<li><a href="./contact.jsp"><span class="glyphicon glyphicon-envelope"></span>&nbsp<spring:message
								code="accueil.contact" /></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><spring:message
								code="accueil.langue" /><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="?lang=fr">FR</a></li>
							<li><a href="?lang=en">EN</a></li>
							<li><a href="#">RU</a></li>
						</ul></li>
					<li><a href="<c:url value="/clientcontroller/goToCreer" />"><span
							class="glyphicon glyphicon-user"></span>&nbsp<spring:message
								code="accueil.inscription" /></a></li>
					<li><a href="<c:url value="/clientcontroller/goToLogin" />"><span
							class="glyphicon glyphicon-log-in"></span>&nbsp <spring:message
								code="accueil.connexion" /></a></li>
				</ul>
			</div>
		</div>
	</nav>


<!-- </body> -->