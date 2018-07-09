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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="creer.pari.title" /></title>
<link rel="stylesheet"
	href="<c:url value="/static/bootstrap3/css/bootstrap.css" />">
<script src="<c:url value="/static/bootstrap3/js/bootstrap.js" />"></script>
<script src="<c:url value="/static/jquery/js/jquery.js" />"></script>
<script type="text/javascript">
	function calculCote(id){
		var mise = document.getElementById('mise').value;
		var cote = document.getElementById(id).innerHTML;
		var resultat;
		
		resultat = mise * cote;
		console.log(mise);
		console.log(cote);
		console.log(resultat);
		var view = document.getElementById('view');
		view.value = resultat + " €";
	}
</script>
</head>
<body>
	<div class="container">
		<h3 text-align=center>
			<spring:message code="pari.header" />
		</h3>

		<form method="POST"
			action="${pageContext.request.contextPath}/clientcontroller/creerPari"
			modelAttribute="pari">
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
								<div class="col-lg-4">
									<label text-align=left align=center class="capital"> <c:forEach
											var="p" items="${pari.evenement.participants}"
											varStatus="loop">
											<c:out value="${fn:toLowerCase(p.nom)}" />
											<c:if test="${loop.index==0}">&nbsp;-&nbsp;</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="col-lg-4" align=left>
									<ul class="list-inline">
										<c:forEach var="c" items="${cotes}">
											<li><button type="button" class="btn btn-default"
													onclick="calculCote(${c.libelle})">
													<c:out value="${c.libelle}" />
												</button>&nbsp;<label id="${c.libelle}"><c:out value="${c.valeur}" /></label></li>
										</c:forEach>
									</ul>
								</div>
								<div class="col-lg-4">
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