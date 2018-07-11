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
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
	 <link rel="icon" href="<c:url value="/static/icones/www.ico" />">
<script src="<c:url value="/static/jquery/js/jquery.js" />"
	type="application/javascript"></script>
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"
	type="application/javascript"></script>

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!--<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
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
				<h1>
					<spring:message code="acceuil.bienvenue" />
				</h1>
				<p>Losamax, we earn, you lose. Approved by Francis Lalanne and Nicolas Anelka.</p><br>
				<img src="images/losamax.png"/>
				<hr>
				<div class="well">
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
												<a
													href="<c:url value="/clientcontroller/goToCreerPari/"/>"
													type="button" class="btn btn-primary">Parier</a>
											</div>
										</div>
									</div>
								</div>
								<div class="panel-footer">
									<i>Expire le <fmt:formatDate type="both" dateStyle="long" value="${e.dateFin}" /></i>
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