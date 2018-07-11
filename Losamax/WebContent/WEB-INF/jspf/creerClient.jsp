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
<title><spring:message code="creer.client.title" /></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h3 text-align=center>
			<spring:message code="client.header" />
		</h3>
		<form method="POST" action="creer" modelAttribute="client">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="form-group">
				<form:label path="client.nom">
					<spring:message code="client.nom" />
					<span class="required">*</span>
				</form:label>
				<form:input path="client.nom" class="form-control" />
				&nbsp;
				<form:errors path="client.nom" class="alert alert-danger" />

			</div>
			<div class="form-group">
				<form:label path="client.prenom">
					<spring:message code="client.prenom" />
					<span class="required">*</span>
				</form:label>
				<form:input path="client.prenom" class="form-control" />
				&nbsp;
				<form:errors path="client.prenom" class="alert alert-danger" />

			</div>
			<div class="form-group">
				<form:label path="client.mail">
					<spring:message code="client.mail" />
					<span class="required">*</span>
				</form:label>
				<form:input path="client.mail" class="form-control" />
				&nbsp;
				<form:errors path="client.mail" class="alert alert-danger" />

			</div>
			<div class="form-group">
				<form:label path="client.age">
					<spring:message code="client.age" />
					<span class="required">*</span>
				</form:label>
				<form:input path="client.age" class="form-control" />
				&nbsp;
				<form:errors path="client.age" class="alert alert-danger" />

			</div>
			<div class="form-group">
				<form:label path="client.adresse">
					<spring:message code="client.adresse" />
					</form:label>
				<form:input path="client.adresse" class="form-control" />
				</div>
			<div class="form-group">
				<form:label path="client.telFix">
					<spring:message code="client.telFix" />
					</form:label>
				<form:input path="client.telFix" class="form-control" />
				

			</div>
			<div class="form-group">
				<form:label path="client.telMobile">
					<spring:message code="client.telMobile" />
					</form:label>
				<form:input path="client.telMobile" class="form-control" />
				</div>
			<div class="form-group">
				<form:label path="client.miseMax">
					<spring:message code="client.miseMax" />
					<span class="required">*</span>
				</form:label>
				<form:input path="client.miseMax" class="form-control" />
				&nbsp;
				<form:errors path="client.miseMax" class="alert alert-danger" />

			</div>
			<div class="form-group">
				<form:label path="client.solde">
					<spring:message code="client.depot.solde" />
					</form:label>
				<form:input path="client.solde" class="form-control" />
				</div>

			<div class="form-group">
				<form:label path="client.listeSports" id="listeSports">
					<spring:message code="client.listeSports" />
				</form:label>

				<form:select path="client.listeSports" items="${sports}" multiple="true" itemValue="id" itemLabel="nom" class="form-control"/>
			</div>

			<div class="form-group">
				<form:label path="client.credentials.username">
					<spring:message code="client.username" />
					<span class="required">*</span>
				</form:label>
				<form:input path="client.credentials.username" />
				&nbsp;
				<form:errors path="client.credentials.username" class="alert alert-danger" />
			</div>
			<div class="form-group">
				<form:label path="client.credentials.password">
					<spring:message code="client.password" />
					<span class="required">*</span>
				</form:label>
				<form:password path="client.credentials.password" />
				&nbsp;
				<form:errors path="client.credentials.password" class="alert alert-danger" />
			</div>
			<form:hidden path = "client.credentials.role" value = "ROLE_USER" />
			<!-- <input type="hidden" path="client.credentials.role" name ="client.credentials.role"
				value="ROLE_USER" /> -->
				<input type="submit" class="btn btn-primary"
				value="<spring:message code="client.creer.submit" />" />
		</form>
		<a href="<c:url value="/paricontroller/goToMenu" />" type="button"
			class="btn btn-primary"><spring:message code="menu.retour" /></a>
	</div>
</body>
</html>