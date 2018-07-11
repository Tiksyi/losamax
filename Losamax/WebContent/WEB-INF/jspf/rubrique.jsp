<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<title><spring:message code="accueil.title" /></title>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet" href="<c:url value="/static/css/styles.css" />">
 <link rel="icon" href="<c:url value="/static/icones/www.ico" />">
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

				<h1 class="capital">Rubrique ${nom}</h1>
				<div class="well">
					<c:forEach var="e" items="${listeEvents}">

						<h2 style="text-transform: capitalize">
							<c:out value="${e.nom}"></c:out>
						</h2>
						<form action="" method="get">
							<div class="panel-group">
								<div class="panel panel-info class">
									<div class="panel-heading">Rencontre � la une</div>
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
												<%-- <div class="col-lg-4" align="center">
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
												</div> --%>
												<div class="col-lg-4" align=center>
													<button type="button" class="btn btn-default">1</button>
													<button type="button" class="btn btn-default">N</button>
													<button type="button" class="btn btn-default">2</button>
												</div>
												<div class="col-lg-4" align="right">
													<c:set var="username" scope="session">
														<sec:authentication property="principal.username" />
													</c:set>
													<button type="submit" class="btn btn-primary"
														formmethod="get"
														formaction="<c:url value="/clientcontroller/goToCreerPari/${username}/${e.id}"/>">
														<spring:message code="pari.nom" />
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="panel-footer">
										<i>Expire le <fmt:formatDate type="both" dateStyle="long"
												value="${e.dateFin}" /></i>
									</div>
								</div>
							</div>
						</form>
					</c:forEach>
				</div>
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