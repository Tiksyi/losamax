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
</head>
<body>
	<div class="container">
		<h3 text-align=center>
			<spring:message code="pari.header" />
		</h3>
		<form method="POST" action="${pageContext.request.contextPath}/clientcontroller/creerPari" modelAttribute="pari">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 			<form:hidden path="pari.evenement"/>
			<div class="form-group">
				<form:label path="pari.mise"><spring:message code="pari.mise" /><span class="required">*</span></form:label>
				<form:input path="pari.mise" class="form-control" />&nbsp;
				<form:errors path="pari.mise" cssClass="errors" />
			</div>
			<div class="form-group">
<%-- 				<form:label path="pari.evenement.participants" id="participants"><spring:message code="pari.participants" /> --%>
<%-- 				</form:label> --%>
<%-- 				<form:select path="pari.choix" items="${participants}" multiple="false" itemValue="id" itemLabel="participants" class="form-control"/> --%>
			    <spring:message code="pari.choix" />
			    <form:select path="pari.choix">
        <form:options items="${cotes}" itemValue="id" itemLabel="libelle" />
   			 </form:select>
   			 <spring:message code="pari.cote" />
			
			</div>
			
			
			
			
			
			
			
			
			
			
<!-- 			<div class="form-group"> -->
<%-- 				<form:label path="client.adresse"> --%>
<%-- 					<spring:message code="client.adresse" /> --%>
<!-- 					<span class="required">*</span> -->
<%-- 				</form:label> --%>
<%-- 				<form:input path="client.adresse" class="form-control" /> --%>
<!-- 				&nbsp; -->
<%-- 				<form:errors path="client.adresse" cssClass="errors" /> --%>

<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<%-- 				<form:label path="client.telFix"> --%>
<%-- 					<spring:message code="client.telFix" /> --%>
<!-- 					<span class="required">*</span> -->
<%-- 				</form:label> --%>
<%-- 				<form:input path="client.telFix" class="form-control" /> --%>
<!-- 				&nbsp; -->
<%-- 				<form:errors path="client.telFix" cssClass="errors" /> --%>

<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<%-- 				<form:label path="client.telMobile"> --%>
<%-- 					<spring:message code="client.telMobile" /> --%>
<!-- 					<span class="required">*</span> -->
<%-- 				</form:label> --%>
<%-- 				<form:input path="client.telMobile" class="form-control" /> --%>
<!-- 				&nbsp; -->
<%-- 				<form:errors path="client.telMobile" cssClass="errors" /> --%>

<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<%-- 				<form:label path="client.miseMax"> --%>
<%-- 					<spring:message code="client.miseMax" /> --%>
<!-- 					<span class="required">*</span> -->
<%-- 				</form:label> --%>
<%-- 				<form:input path="client.miseMax" class="form-control" /> --%>
<!-- 				&nbsp; -->
<%-- 				<form:errors path="client.miseMax" cssClass="errors" /> --%>

<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<%-- 				<form:label path="client.solde"> --%>
<%-- 					<spring:message code="client.depot.solde" /> --%>
<!-- 					<span class="required">*</span> -->
<%-- 				</form:label> --%>
<%-- 				<form:input path="client.solde" class="form-control" /> --%>
<!-- 				&nbsp; -->
<%-- 				<form:errors path="client.solde" cssClass="errors" /> --%>
<!-- 			</div> -->



<!-- 			<div class="form-group"> -->
<%-- 			<form:hidden path="client.credentials.id"/> --%>
<%-- 				<form:label path="client.credentials.username"> --%>
<%-- 					<spring:message code="client.username" /> --%>
<!-- 					<span class="required">*</span> -->
<%-- 				</form:label> --%>
<%-- 				<form:input path="client.credentials.username" /> --%>
<!-- 				&nbsp; -->
<%-- 				<form:errors path="client.credentials.username" cssClass="errors" /> --%>
<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<%-- 				<form:label path="client.credentials.password"> --%>
<%-- 					<spring:message code="client.password" /> --%>
<!-- 					<span class="required">*</span> -->
<%-- 				</form:label> --%>
<%-- 				<form:password path="client.credentials.password" /> --%>
<!-- 				&nbsp; -->
<%-- 				<form:errors path="client.credentials.password" cssClass="errors" /> --%>
<!-- 			</div> -->
<!-- 			<input type="hidden" name="client.credentials.role" -->
<!-- 				value="ROLE_USER" /> -->
<!-- 				<input type="submit" class="btn btn-primary" -->
<%-- 				value="<spring:message code="client.creer.submit" />" /> --%>
<%-- 		</form> --%>
<%-- 		<a href="<c:url value="/paricontroller/goToMenu" />" type="button" --%>
<%-- 			class="btn btn-primary"><spring:message code="menu.retour" /></a> --%>
<!-- 	</div> -->
</body>
</html>