<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
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
<%-- <link rel="stylesheet" href="<c:url value="/static/bootstrap4/css/bootstrap.css" />"> --%>
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<%-- <script src="<c:url value="/static/bootstrap4/js/bootstrap.js" />"></script> --%>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script>
</head>
<body>

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
					<li><a href="#"><spring:message code="accueil.parier" /></a></li>
					<li><a href="#"><spring:message code="accueil.apropos" /></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-envelope"></span>&nbsp<spring:message
								code="accueil.contact" /></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><spring:message code="accueil.langue" /></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp<spring:message
								code="accueil.inscription" /></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>&nbsp
							<spring:message code="accueil.connexion" /></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<p>
					<a href="#"><spring:message code="accueil.lien" /></a>
				</p>
				<p>
					<a href="#"><spring:message code="accueil.lien" /></a>
				</p>
				<p>
					<a href="#"><spring:message code="accueil.lien" /></a>
				</p>
			</div>
			<div class="col-sm-8 text-left">
				<h1>
					<spring:message code="acceuil.bienvenue" />
				</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat
					cupidatat non proident, sunt in culpa qui officia deserunt mollit
					anim id est laborum consectetur adipiscing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
					minim veniam, quis nostrud exercitation ullamco laboris nisi ut
					aliquip ex ea commodo consequat.</p>
				<hr>
				<div class="container">
					<h2>Football</h2>
					<div class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading">Panel with panel-default class</div>
							<div class="panel-body">Panel Content</div>
						</div>
					</div>
				</div>
				
				<div class="container">
					<h2>BasketBall</h2>
					<div class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading">Panel with panel-default class</div>
							<div class="panel-body">Panel Content</div>
						</div>
					</div>
				</div>
				
				<div class="container">
					<h2>Cyclisme</h2>
					<div class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading">Panel with panel-default class</div>
							<div class="panel-body">Panel Content</div>
						</div>
					</div>
				</div>
				
				
			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>
			<spring:message code="accueil.footer" />
		</p>
	</footer>

</body>