<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  -->
<!DOCTYPE html>
<html lang=fr>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="creer.menu.title" /></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	 <link rel="icon" href="<c:url value="/static/icones/www.ico" />">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h3 text-align=center>
			<spring:message code="evenement.creer" />
		</h3>
		<form method="POST" action="supprimerNom" modelAttribute="evenement">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="form-group">
				<form:label path="evenement.nom">
					<spring:message code="evenement.nom" />
				</form:label>
				<form:input path="evenement.nom" class="form-control" />
			</div>
		<br> <input type="submit" class="btn btn-primary"
			value="<spring:message code="evenement.supprimer" />" />
		</form>	
		<br> <br> <a href="<c:url value="/admincontroller/goToAdmin" />" type="button"
			class="btn btn-primary"><spring:message code="menu.retour" /></a>
	</div>
</body>
</html>