<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang=fr>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="creer.pari.title" /></title>
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
	<link rel="stylesheet" href="<c:url value="/static/css/styles.css" />">
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script>
<script src="<c:url value="/static/js/js.js" />"></script>
</head>
<body>
	<div class="container">
		<h3 text-align=center>
			<spring:message code="pari.header" />
		</h3>

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
									<c:forEach var="p" items="${pari.evenement.participants}" varStatus="loop">
											<label><c:out value="${fn:toLowerCase(p.nom)}" /></label>
											<c:if test="${loop.index==0}">&nbsp;-&nbsp;</c:if>
									</c:forEach>
								</div>
								<div class="col-lg-4" align="center">
									<ul class="list-inline">
										<c:forEach var="c" items="${cotes}">
											<li><button type="button" class="btn btn-default" onclick="calculCote(${c.valeur}, '${c.libelle}')">
											<c:out value="${c.libelle}" /></button>&nbsp;<label><c:out value="${c.valeur}" /></label>
											</li>
										</c:forEach>
										<form:hidden id="choix" path="pari.choix" value=""/>
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
				<a href="<c:url value="/paricontroller/goToMenu" />"
			type="button" class="btn btn-primary"><spring:message
				code="menu.retour" /></a>
		</form>
	</div>
</body>
</html>