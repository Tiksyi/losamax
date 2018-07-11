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
<html lang="fr">
<head>
<title><spring:message code="accueil.title" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="icon" href="<c:url value="/static/images/losamax2.png" />">
<link rel="stylesheet" href="<c:url value="/static/css/styles.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<%-- <script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script> --%>
<script src="<c:url value="/static/js/js.js" />"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="body">


	<c:import url="./header.jsp" />

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<%-- <p>
					<a href="#"><spring:message code="accueil.lien" /></a>
				</p>
				<p>
					<a href="#"><spring:message code="accueil.lien" /></a>
				</p>
				<p>
					<a href="#"><spring:message code="accueil.lien" /></a>
				</p> --%>
			</div>
			<div class="col-sm-8 text-left">
				<div align="center">
					<h1>
						<spring:message code="acceuil.bienvenue" />
					</h1>
					<h4>
						<spring:message code="accueil.message" />
					</h4>
				</div>
				<br>
				<div align="center">
					<img src="<c:url value="/static/images/losamax2.png"/>" width="15%"
						height="15%" />
				</div>
				<hr>
				<div class="well">
					<div>
						<h2>
							<spring:message code="accueil.rubrique.event.futur" />
						</h2>
					</div>
					<br>
					<c:forEach var="e" items="${listeEvents}">

						<%-- <h2 style="text-transform: capitalize">
							<c:out value="${fn:toLowerCase(e.nom)}" />
						</h2> --%>
						<div class="panel-group">
							<div class="panel panel-info class">
								<div class="panel-heading">
									<label class="capital"> <c:out
											value="${fn:toLowerCase(e.nom)}" /></label>
								</div>
								<div class="panel-body">
									<div class="container">
										<div class="row">
											<div class="col-lg-4 capital" align="left">
												<c:forEach var="p" items="${e.participants}"
													varStatus="loop">
													<c:out value="${fn:toLowerCase(p.nom)}" />
													<c:if test="${loop.index==0}">&nbsp;-&nbsp;</c:if>
												</c:forEach>
											</div>
											<div class="col-lg-4" align=center>
												<button type="button" class="btn btn-default">1</button>
												<button type="button" class="btn btn-default">N</button>
												<button type="button" class="btn btn-default">2</button>
											</div>
											<div class="col-lg-4" align=right>
												<%-- <a
													href="<c:url value="/clientcontroller/goToCreerPari/"/>"
													type="button" class="btn btn-primary">Parier</a> --%>
											</div>
										</div>
									</div>
								</div>
								<div class="panel-footer">
									<i><spring:message code="accueil.event.date" /><fmt:formatDate type="both" dateStyle="long"
											value="${e.dateFin}" /></i>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>
			<div class="col-sm-2 sidenav">
				<!-- <div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div> -->
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>
			<spring:message code="accueil.footer" />
		</p>
	</footer>

</body>