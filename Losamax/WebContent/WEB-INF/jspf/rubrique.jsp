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
<title><spring:message code="accueil.title" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/static/css/styles.css" />">
<%-- <link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script> --%>
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script>
</head>
<body class="body">

	<c:import url="./header.jsp" />

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav-right">
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

				<h1 class="capital">Rubrique ${nom}</h1>

				<c:forEach var="e" items="${listesEvent}">
					<div class="well">
						<h2 style="text-transform: capitalize">
							test
						</h2>
						<div class="panel-group">
							<div class="panel panel-info class">
								<div class="panel-heading">Rencontre à la une</div>
								<div class="panel-body">
									<div class="container">
										<div class="row">
											<div class="col-lg-4">
												<label text-align=left>France - Uruguay</label>
											</div>
											<div class="col-lg-4" align=center>
												<button type="button" class="btn btn-default">1</button>
												<button type="button" class="btn btn-default">N</button>
												<button type="button" class="btn btn-default">2</button>
											</div>
											<div class="col-lg-4" text-align=right>
												<a href="<c:url value="/clientcontroller/parier"/>" type="button" class="btn btn-primary" >Parier</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="col-sm-2 sidenav-left">
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